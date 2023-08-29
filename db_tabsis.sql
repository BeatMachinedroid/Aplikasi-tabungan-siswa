-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Agu 2023 pada 12.39
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tabsis`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `wl_kelas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `kelas`, `wl_kelas`) VALUES
(1, 'Kelas 1a', 'Lediyati'),
(2, 'Kelas 1b', 'Yuke Lisnawati'),
(3, 'Kelas 1c', 'Septina Marta'),
(4, 'Kelas 2a', 'Kamisah'),
(5, 'Kelas 2b', 'Supiah'),
(6, 'Kelas 2c', 'Maya Suciani'),
(7, 'Kelas 3a', 'Neliyana'),
(8, 'Kelas 3b', 'Rosalina Siahaan'),
(9, 'Kelas 3c', 'Eli Suryana'),
(10, 'Kelas 4a', 'Sawinah'),
(11, 'Kelas 4b', 'Sujimah'),
(12, 'Kelas 4c', 'Sutar'),
(13, 'Kelas 5a', 'Nyoman Sukerti'),
(14, 'Kelas 5b', 'M Badar'),
(15, 'Kelas 5c', 'Elisa'),
(16, 'Kelas 6a', 'Rohyani'),
(17, 'Kelas 6b', 'Mega Suryanti'),
(18, 'Kelas 6c', 'Derta Roliyanti');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `level` enum('Administrator','Petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'Lina Herlina', 'admin', '12345', 'Administrator'),
(2, 'Lediyati', 'lediyati@gmail.com', '12345678', 'Petugas'),
(3, 'Yuke Lisnawati', 'yuke@gmail.com', '12345678', 'Petugas'),
(4, 'Septina Marta', 'septina@gmail.com', '12345678', 'Petugas'),
(5, 'Kamisah', 'kamisah@gmail.com', '12345678', 'Petugas'),
(6, 'Supiah', 'supiah@gmail.com', '12345678', 'Petugas'),
(7, 'Maya Suciani', 'maya@gmail.com', '12345678', 'Petugas'),
(8, 'Neliyana', 'neliyana@gmail.com', '12345678', 'Petugas'),
(9, 'Rosalina Siahaan', 'rosalina@gmail.com', '12345678', 'Petugas'),
(10, 'Eli Suryana', 'elisuryana@gmail.com', '12345678', 'Petugas'),
(11, 'Sawinah', 'sawinah@gmail.com', '12345678', 'Petugas'),
(12, 'Sujimah', 'sujimah@gmail.com', '12345678', 'Petugas'),
(13, 'Nyoman Sukerti', 'nyoman@gmail.com', '12345678', 'Petugas'),
(14, 'Muhammad Badar', 'badar@gmail.com', '12345678', 'Petugas'),
(15, 'Elisa', 'elisa@gmail.com', '12345678', 'Petugas'),
(16, 'Rohyani', 'rohyani@gmail.com', '12345678', 'Petugas'),
(17, 'Mega Suryanti', 'mega@gmail.com', '12345678', 'Petugas'),
(18, 'Derta Roliyanti', 'derta@gmail.com', '12345678', 'Petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_profil`
--

CREATE TABLE `tb_profil` (
  `id_profil` int(11) NOT NULL,
  `nama_sekolah` varchar(200) NOT NULL,
  `alamat` varchar(400) NOT NULL,
  `akreditasi` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_profil`
--

INSERT INTO `tb_profil` (`id_profil`, `nama_sekolah`, `alamat`, `akreditasi`) VALUES
(1, 'SD Sukajawa', 'Sukajawa', 'A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `nis` char(12) NOT NULL,
  `nama_siswa` varchar(40) NOT NULL,
  `jekel` enum('LK','PR') NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `status` enum('Aktif','Lulus','Pindah') NOT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`nis`, `nama_siswa`, `jekel`, `id_kelas`, `status`, `tgl_lahir`) VALUES
('0081706202', 'Dasya Sahira', 'PR', 17, 'Aktif', '2008-10-10'),
('0096629943', 'Yuriko', 'LK', 15, 'Aktif', '2009-11-04'),
('0098767248', 'Yolanda Sendy', 'PR', 18, 'Aktif', '2008-06-03'),
('0102971100', 'Andika Pratama', 'LK', 14, 'Aktif', '2010-04-12'),
('0104450416', 'Alvin Saputra', 'LK', 13, 'Aktif', '2010-03-15'),
('0107265618', 'Calista Shakira', 'PR', 13, 'Aktif', '2010-11-23'),
('0108545358', 'Anton Saputra', 'LK', 10, 'Aktif', '2010-08-08'),
('0108590142', 'Yuni Sari', 'PR', 15, 'Aktif', '2010-02-01'),
('0109596410', 'Aurel Nazwa', 'PR', 11, 'Aktif', '2010-01-16'),
('0113042854', 'Dian Maharani', 'PR', 12, 'Aktif', '2011-11-15'),
('0114398636', 'Ailsa Husna', 'PR', 7, 'Aktif', '2011-12-01'),
('0116711849', 'Carrol Khalaqas', 'LK', 11, 'Aktif', '2011-06-08'),
('0117092797', 'Afrian Saputra', 'LK', 12, 'Aktif', '2011-05-02'),
('0118331231', 'Arum Anggaraini', 'PR', 10, 'Aktif', '2011-11-29'),
('0119088795', 'Apriyansyah', 'LK', 7, 'Aktif', '2011-03-24'),
('0124433331', 'Abriyan Tsaqif', 'LK', 8, 'Aktif', '2012-04-29'),
('0125502732', 'Ahmad Fathir Adzidzikra', 'LK', 5, 'Aktif', '2012-04-02'),
('0126065967', 'Ardy Hidayat', 'LK', 8, 'Aktif', '2012-07-14'),
('0126222257', 'Aulia Putri', 'PR', 14, 'Aktif', '2012-05-31'),
('0126427321', 'Abdul Qodir', 'LK', 9, 'Aktif', '2012-04-29'),
('0128854636', 'Aprilia Nesti', 'PR', 9, 'Aktif', '2012-04-21'),
('0131288846', 'Alifi Aji Maulana', 'LK', 3, 'Aktif', '2013-10-01'),
('0131814224', 'Achmad Fauzan', 'LK', 3, 'Aktif', '2013-12-16'),
('013421499', 'Apri Yani Putri', 'PR', 5, 'Aktif', '2013-04-14'),
('0136709918', 'Amanda Safitri', 'PR', 4, 'Aktif', '2013-06-23'),
('0137109157', 'Annisa Olivia Maharani', 'PR', 2, 'Aktif', '2013-10-10'),
('0146262741', 'Alycia Salsabila Putri Roji', 'PR', 1, 'Aktif', '2014-02-19'),
('0146311855', 'Alika Aneira Nalani', 'PR', 1, 'Aktif', '2014-02-11'),
('0147541481', 'Aliyah Nurul Afiqah', 'PR', 1, 'Aktif', '2014-03-01'),
('1245379800', 'Fauzan Aziz', 'LK', 17, 'Aktif', '2008-03-10'),
('2123245623', 'Nilam Cahya', 'PR', 18, 'Aktif', '2008-11-12'),
('3085206155', 'Bangkit Sanjaya', 'LK', 16, 'Aktif', '2008-05-16'),
('3099033491', 'Aura Nadhifa', 'PR', 16, 'Aktif', '2009-05-01'),
('3122401012', 'Amira Okta Dwi Cahya', 'PR', 5, 'Aktif', '2013-05-31'),
('3123988526', 'Aldian Prayoga', 'LK', 6, 'Aktif', '2012-04-07'),
('3124391755', 'Ade Ahmad', 'LK', 6, 'Aktif', '2012-08-10'),
('3126218661', 'Abdul Latif', 'LK', 4, 'Aktif', '2012-08-12'),
('3128481579', 'Abitia Ramadani', 'LK', 4, 'Aktif', '2012-08-09'),
('3135288191', 'Abdilah', 'LK', 3, 'Aktif', '2013-12-18'),
('3141055914', 'Aliya Afifah', 'PR', 2, 'Aktif', '2014-01-24'),
('3142516371', 'Amar Tubagus Ali', 'LK', 2, 'Aktif', '2014-03-05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tabungan`
--

CREATE TABLE `tb_tabungan` (
  `id_tabungan` int(11) NOT NULL,
  `nis` char(12) NOT NULL,
  `setor` int(11) NOT NULL,
  `tarik` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `jenis` enum('ST','TR') NOT NULL,
  `petugas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_tabungan`
--

INSERT INTO `tb_tabungan` (`id_tabungan`, `nis`, `setor`, `tarik`, `tgl`, `jenis`, `petugas`) VALUES
(63, '0147541481', 5000, 0, '2023-08-29', 'ST', 'Lediyati'),
(64, '0146262741', 10000, 0, '2023-08-29', 'ST', 'Lediyati'),
(65, '0146311855', 20000, 0, '2023-08-29', 'ST', 'Lediyati'),
(66, '0146262741', 0, 5000, '2023-08-29', 'TR', 'Lediyati'),
(67, '3141055914', 2000, 0, '2023-08-29', 'ST', 'Yuke Lisnawati'),
(68, '3142516371', 10000, 0, '2023-08-29', 'ST', 'Yuke Lisnawati'),
(69, '0137109157', 5000, 0, '2023-08-29', 'ST', 'Yuke Lisnawati'),
(70, '0137109157', 0, 1000, '2023-08-29', 'TR', 'Yuke Lisnawati'),
(71, '3142516371', 0, 5000, '2023-08-29', 'TR', 'Yuke Lisnawati'),
(72, '3135288191', 50000, 0, '2023-08-29', 'ST', 'Septina Marta'),
(73, '0131814224', 10000, 0, '2023-08-29', 'ST', 'Septina Marta'),
(74, '0131288846', 5000, 0, '2023-08-29', 'ST', 'Septina Marta'),
(75, '3135288191', 0, 10000, '2023-08-29', 'TR', 'Septina Marta'),
(76, '3126218661', 20000, 0, '2023-08-29', 'ST', 'Kamisah'),
(77, '0125502732', 100000, 0, '2023-08-29', 'ST', 'Kamisah'),
(78, '3122401012', 20000, 0, '2023-08-29', 'ST', 'Kamisah'),
(79, '0125502732', 0, 50000, '2023-08-29', 'TR', 'Kamisah'),
(80, '013421499', 10000, 0, '2023-08-29', 'ST', 'Supiah'),
(81, '3122401012', 10000, 0, '2023-08-29', 'ST', 'Supiah'),
(82, '3124391755', 40000, 0, '2023-08-29', 'ST', 'Maya Suciani'),
(83, '3123988526', 20000, 0, '2023-08-29', 'ST', 'Maya Suciani'),
(84, '3124391755', 0, 10000, '2023-08-29', 'TR', 'Maya Suciani'),
(85, '0114398636', 50000, 0, '2023-08-29', 'ST', 'Neliyana'),
(86, '0119088795', 5000, 0, '2023-08-29', 'ST', 'Neliyana'),
(87, '0114398636', 0, 10000, '2023-08-29', 'TR', 'Neliyana'),
(88, '0126065967', 20000, 0, '2023-08-29', 'ST', 'Rosalina Siahaan'),
(89, '0124433331', 10000, 0, '2023-08-29', 'ST', 'Rosalina Siahaan'),
(90, '0126427321', 40000, 0, '2023-08-29', 'ST', 'Eli Suryana'),
(91, '0128854636', 5000, 0, '2023-08-29', 'ST', 'Eli Suryana'),
(92, '0126427321', 0, 20000, '2023-08-29', 'TR', 'Eli Suryana'),
(93, '0108545358', 10000, 0, '2023-08-29', 'ST', 'Sawinah'),
(94, '0118331231', 50000, 0, '2023-08-29', 'ST', 'Sawinah'),
(95, '0109596410', 20000, 0, '2023-08-29', 'ST', 'Sujimah'),
(96, '0116711849', 10000, 0, '2023-08-29', 'ST', 'Sujimah'),
(100, '0126222257', 20000, 0, '2023-08-29', 'ST', 'Muhammad Badar'),
(102, '0104450416', 0, 20000, '2023-08-29', 'TR', 'Nyoman Sukerti'),
(104, '0107265618', 100000, 0, '2023-08-29', 'ST', 'Nyoman Sukerti'),
(105, '0104450416', 50000, 0, '2023-08-29', 'ST', 'Nyoman Sukerti'),
(106, '0102971100', 20000, 0, '2023-08-29', 'ST', 'Muhammad Badar'),
(107, '0108590142', 10000, 0, '2023-08-29', 'ST', 'Elisa'),
(108, '0096629943', 40000, 0, '2023-08-29', 'ST', 'Elisa'),
(109, '3085206155', 10000, 0, '2023-08-29', 'ST', 'Rohyani'),
(110, '3099033491', 20000, 0, '2023-08-29', 'ST', 'Rohyani'),
(111, '0081706202', 5000, 0, '2023-08-29', 'ST', 'Mega Suryanti'),
(112, '1245379800', 50000, 0, '2023-08-29', 'ST', 'Mega Suryanti'),
(113, '0098767248', 100000, 0, '2023-08-29', 'ST', 'Derta Roliyanti'),
(114, '2123245623', 25000, 0, '2023-08-29', 'ST', 'Derta Roliyanti'),
(115, '0098767248', 0, 20000, '2023-08-29', 'TR', 'Derta Roliyanti');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `tb_profil`
--
ALTER TABLE `tb_profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  ADD PRIMARY KEY (`id_tabungan`),
  ADD KEY `nis` (`nis`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tb_profil`
--
ALTER TABLE `tb_profil`
  MODIFY `id_profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  MODIFY `id_tabungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  ADD CONSTRAINT `tb_tabungan_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `tb_siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
