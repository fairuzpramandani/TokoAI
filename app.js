const express = require('express');
const bodyParser = require('body-parser');
const db = require('./db');
const { GoogleGenerativeAI } = require("@google/generative-ai");
require('dotenv').config();

const app = express();
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static('public'));

const genAI = new GoogleGenerativeAI(process.env.API_KEY);

// ROUTE: Halaman Utama (Admin & Chat)
app.get('/', (req, res) => {
    const sql = `
        SELECT p.id, p.name, p.price, s.qty 
        FROM products p 
        JOIN stocks s ON p.id = s.product_id;
        
        SELECT pur.id, p.name as product_name, pur.qty, pur.status 
        FROM purchases pur 
        JOIN products p ON pur.product_id = p.id 
        ORDER BY pur.id DESC;
    `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error(err);
            return res.send("Error Database. Cek terminal untuk detail.");
        }
        res.render('index', { products: results[0], purchases: results[1] });
    });
});

// ROUTE: Proses Pembelian
app.post('/purchase', (req, res) => {
    const { product_id, qty } = req.body;
    db.query('UPDATE stocks SET qty = qty - ? WHERE product_id = ?', [qty, product_id], (err) => {
        if (err) throw err;
        db.query('INSERT INTO purchases (product_id, qty) VALUES (?, ?)', [product_id, qty], (err) => {
            if (err) throw err;
            res.redirect('/');
        });
    });
});

// ROUTE: Cancel Pembelian
app.post('/cancel/:id', (req, res) => {
    const purchaseId = req.params.id;
    db.query('SELECT * FROM purchases WHERE id = ?', [purchaseId], (err, rows) => {
        if (err || rows.length === 0) return res.redirect('/');
        const data = rows[0];
        db.query('UPDATE stocks SET qty = qty + ? WHERE product_id = ?', [data.qty, data.product_id], (err) => {
            db.query("UPDATE purchases SET status = 'canceled' WHERE id = ?", [purchaseId], (err) => {
                res.redirect('/');
            });
        });
    });
});

// ROUTE: Chatbot AI (Tanya Jawab)
app.post('/chat', async (req, res) => {
    try {
        const userMsg = req.body.message;

        // 1. AMBIL STOK DARI DATABASE
        const sql = `SELECT p.name, p.price, s.qty FROM products p JOIN stocks s ON p.id = s.product_id`;

        db.query(sql, async (err, items) => {
            if (err) return res.json({ reply: "Maaf, database error." });

            // 2. Buat Contekan Data untuk AI
            let dataToko = items.map(item => 
                `- ${item.name} (Stok: ${item.qty}, Harga: Rp${item.price})`
            ).join('\n');

            // 3. Gabungkan Data + Pertanyaan User
            const promptRahasia = `
                Kamu adalah asisten toko.
                DATA STOK REAL-TIME:
                ${dataToko}

                Pertanyaan Customer: "${userMsg}"
                
                Instruksi:
                - Jawab berdasarkan DATA STOK di atas.
                - Jika ditanya resep, berikan resep umum yang relevan dengan produk.
            `;

            // 4. Kirim ke Google
            const model = genAI.getGenerativeModel({ model: "gemini-2.5-flash"});
            const result = await model.generateContent(promptRahasia);
            const response = await result.response;
            
            res.json({ reply: response.text() });
        });

    } catch (error) {
        console.error("Error AI:", error);
        res.json({ reply: "Maaf, AI sedang gangguan." });
    }
});

app.listen(3000, () => {
    console.log('Server Ready Buka browser: http://localhost:3000');
});