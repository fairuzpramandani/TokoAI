# 🛒 TokoAI - Sistem Manajemen Toko & Asisten Cerdas

**Nama:** Fairuz Pramandani  
**Repository:** [https://github.com/fairuzpramandani/TokoAI](https://github.com/fairuzpramandani/TokoAI)  
**Teknologi:** Node.js, Express, MySQL, Google Gemini API

## 📖 Deskripsi
Aplikasi ini adalah sistem kasir sederhana yang dilengkapi dengan **Kecerdasan Buatan (AI)**. Admin bisa mengelola stok barang dan berkonsultasi dengan Chatbot mengenai stok, resep, atau strategi penjualan berdasarkan data stok yang tersedia secara *real-time*.

## ✨ Fitur Utama
1.  **Input Transaksi:** Mengurangi stok otomatis saat pembelian.
2.  **Cancel Transaksi:** Mengembalikan stok jika batal.
3.  **Gambar Produk Otomatis:** Menggunakan Bing Image Search.
4.  **AI Contextual:** Chatbot tahu sisa stok barang di database secara otomatis.

---

## ⚙️ Panduan Instalasi & Penggunaan

### 1. Prasyarat
* Pastikan sudah terinstall **Node.js**.
* Pastikan sudah terinstall **Laragon** atau **XAMPP** (untuk MySQL).
* Koneksi Internet (wajib untuk memuat gambar dan akses AI).

### 2. Persiapan Database
1.  Nyalakan MySQL di Laragon/XAMPP.
2.  Buat database baru bernama: `toko_nodejs`.
3.  *(Opsional)* Aplikasi akan membuat tabel otomatis saat dijalankan pertama kali.
4.  Pastikan password root database Anda sesuai dengan file `db.js`.
    * *Default di file ini password:* `'fairuz'` (Silakan ganti jika berbeda).

### 3. Setup API Key (PENTING!)
Agar fitur Chatbot berfungsi, Anda harus memiliki kunci dari Google AI Studio.
1.  Buat file baru bernama `.env` di folder utama project.
2.  Isi file `.env` dengan format berikut:
    ```env
    API_KEY=masukkan_kunci_google_ai_studio_disini
    ```
    > **Catatan:** Ganti teks di atas dengan API Key milik Anda sendiri.

### 4. Install Dependencies
Buka terminal di folder proyek, lalu ketik perintah ini untuk mengunduh library yang dibutuhkan:
```bash
npm install