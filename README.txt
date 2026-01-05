TOKO AI - SISTEM MANAJEMEN TOKO & ASISTEN CERDAS

Nama  : Fairuz Pramandani
Repository   : https://github.com/fairuzpramandani/TokoAI
Teknologi    : Node.js, Express, MySQL, Google Gemini KEY API

[ DESKRIPSI ]
Aplikasi ini adalah sistem kasir sederhana yang dilengkapi dengan
Kecerdasan Buatan (AI). Admin bisa mengelola stok barang dan
berkonsultasi dengan Chatbot mengenai stok, resep, atau strategi
penjualan berdasarkan data stok yang tersedia secara real-time.

[ FITUR UTAMA ]
1. Input Transaksi: Mengurangi stok otomatis saat pembelian.
2. Cancel Transaksi: Mengembalikan stok jika batal.
3. Gambar Produk Otomatis: Menggunakan Bing Image Search.
4. AI Contextual: Chatbot tahu sisa stok barang di database.

PANDUAN INSTALASI & PENGGUNAAN

1. PRASYARAT
   - Pastikan sudah terinstall Node.js
   - Pastikan sudah terinstall Laragon atau XAMPP (untuk MySQL)
   - Koneksi Internet (untuk memuat gambar dan akses AI)

2. PERSIAPAN DATABASE
   - Nyalakan MySQL di Laragon/XAMPP.
   - Buat database baru bernama: toko_nodejs
   - (Opsional) Aplikasi akan membuat tabel otomatis saat dijalankan.
   - Pastikan password root database Anda sesuai dengan file db.js
     (Default di file ini password: 'fairuz')

3. SETUP API KEY (PENTING!)
   - Buat file baru bernama .env di folder utama.
   - Isi file .env dengan format berikut:
     API_KEY=masukkan_kunci_google_ai_studio_disini
   
   *Tanpa ini, fitur Chatbot tidak akan berjalan.

4. INSTALL DEPENDENCIES
   Buka terminal di folder proyek, lalu ketik:
   npm install

5. MENJALANKAN APLIKASI
   Ketik perintah berikut di terminal:
   node app.js

6. AKSES APLIKASI
   Buka browser (Chrome/Edge) dan kunjungi alamat:
   http://localhost:3000

STRUKTUR FILE

- app.js           : Logika utama server & integrasi AI
- db.js            : Konfigurasi koneksi database
- .env             : Penyimpanan API Key (Rahasia)
- views/index.ejs  : Tampilan antarmuka (Frontend)
- cek_model.js     : Script tes koneksi ke Google AI

Terima Kasih