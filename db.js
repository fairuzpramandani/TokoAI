const mysql = require('mysql2');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'fairuz',
    database: 'toko_nodejs',
    multipleStatements: true
});

db.connect((err) => {
    if (err) {
        console.error('Gagal konek ke Database Laragon:', err);
        return;
    }
    console.log('Berhasil konek ke MySQL Laragon!');
    const initSQL = `
        CREATE TABLE IF NOT EXISTS products (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(255),
            price DECIMAL(10,2)
        );

        CREATE TABLE IF NOT EXISTS stocks (
            product_id INT,
            qty INT,
            FOREIGN KEY (product_id) REFERENCES products(id)
        );

        CREATE TABLE IF NOT EXISTS purchases (
            id INT AUTO_INCREMENT PRIMARY KEY,
            product_id INT,
            qty INT,
            status ENUM('success', 'canceled') DEFAULT 'success',
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
    `;

    db.query(initSQL, (err) => {
        if (err) throw err;
        
        db.query("SELECT COUNT(*) AS count FROM products", (err, result) => {
            if (result[0].count === 0) {
                const sqlInsert = `
                    INSERT INTO products (name, price) VALUES 
                    ('Kopi Hitam', 15000), ('Teh Manis', 5000), ('Roti Bakar', 12000),
                    ('Nasi Goreng', 20000), ('Mie Instan', 10000), ('Ayam Goreng', 25000),
                    ('Es Jeruk', 7000), ('Kentang Goreng', 15000), ('Salad Buah', 18000), ('Air Mineral', 4000);
                `;
                db.query(sqlInsert, () => {
                    for(let i=1; i<=10; i++) {
                        db.query(`INSERT INTO stocks (product_id, qty) VALUES (${i}, 50)`);
                    }
                    console.log("Database berhasil diisi 10 Produk Dummy!");
                });
            }
        });
    });
});

module.exports = db;