-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Des 2024 pada 14.07
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisata_brazil`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nomor_telepon` varchar(15) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `role` enum('admin','peserta') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id`, `username`, `nama`, `email`, `password`, `nomor_telepon`, `tanggal_lahir`, `role`, `created_at`) VALUES
(1, 'admin', 'Admin Utama', 'admin@brazil.com', '$2y$10$vrqsVdRsILiMcnXVO48pLeCXzERm2KtR6DeJepZp/hpa8GTJsIWr2', '081256786543', '1999-01-02', 'admin', '2024-11-26 03:30:45'),
(2, 'Hadi', 'nugrahhadi', 'nugrahhadi11@gmail.com', '$2y$10$xCkgPZ.WVszaAoUM8/a0L..B/MvCVCZhlIG0.6R.Ete17zkzLsY4y', '089567876678', '2004-06-15', 'peserta', '2024-12-02 12:17:17'),
(10, 'ayu', 'ayu', 'ayu123@gmail.com', '$2y$10$YanSffkAd6z1HEnXxC.pjelUOqteQexZAZ23a6MhDtHwvljWphrgS', '08907898765', '2004-02-03', 'peserta', '2024-12-09 11:55:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `destinasi_id` int(11) NOT NULL,
  `jumlah_tiket` int(11) NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `total_pembayaran` decimal(10,2) NOT NULL,
  `metode_pembayaran` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `payment_status` varchar(50) DEFAULT 'pending',
  `payment_token` varchar(100) DEFAULT NULL,
  `midtrans_order_id` varchar(100) DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `destinasi_id`, `jumlah_tiket`, `tanggal_kunjungan`, `total_pembayaran`, `metode_pembayaran`, `nama_lengkap`, `email`, `status`, `created_at`, `payment_status`, `payment_token`, `midtrans_order_id`, `payment_time`) VALUES
(1, 2, 1, 1, '2024-12-12', 2000000.00, 'transfer_bank', 'Hadi', 'nugrahhadi11@gmail.com', 'pending', '2024-12-09 18:20:29', 'pending', NULL, NULL, NULL),
(2, 2, 1, 1, '2024-12-10', 2000000.00, 'transfer_bank', 'Hadi', 'nugrahhadi11@gmail.com', 'pending', '2024-12-09 18:49:40', 'pending', NULL, NULL, NULL),
(3, 2, 1, 1, '2024-12-19', 2000000.00, 'transfer_bank', 'Hadi', 'nugrahhadi11@gmail.com', 'pending', '2024-12-09 18:58:44', 'pending', NULL, NULL, NULL),
(4, 1, 1, 2, '2024-12-11', 4000000.00, 'transfer_bank', 'Muhammad Nugrahhadi Al Khawarizmi', 'nugrahhadi11@gmail.com', 'pending', '2024-12-09 20:13:29', 'pending', NULL, NULL, NULL),
(5, 1, 1, 2, '2024-12-11', 4000000.00, 'transfer_bank', 'Muhammad Nugrahhadi Al Khawarizmi', 'nugrahhadi11@gmail.com', 'pending', '2024-12-09 20:13:31', 'pending', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `destinasi`
--

CREATE TABLE `destinasi` (
  `id` int(11) NOT NULL,
  `nama_destinasi` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `destinasi`
--

INSERT INTO `destinasi` (`id`, `nama_destinasi`, `deskripsi`, `harga`, `kategori`, `gambar`) VALUES
(1, 'Pantai Brazil', 'Pantai indah di brazil', 2000000.00, 'air terjun', 'uploads/idm-1.png'),
(2, 'Pantai 2', 'pantai indah di brazil', 1000000.00, 'air terjun', 'uploads/idm-1.png'),
(4, 'Air terjun', 'air terjun brazil', 500000.00, 'air terjun', 'uploads/6756dd22e8cdb.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `destinasi_id` (`destinasi_id`);

--
-- Indeks untuk tabel `destinasi`
--
ALTER TABLE `destinasi`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `destinasi`
--
ALTER TABLE `destinasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `akun` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`destinasi_id`) REFERENCES `destinasi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
