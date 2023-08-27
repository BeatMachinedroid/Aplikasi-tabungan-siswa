-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2023 at 09:24 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

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
-- Table structure for table `tb_kelas`
--


CREATE TABLE `tb_kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(20) NOT NULL,
  `wl_kelas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kelas`
--

INSERT INTO `tb_kelas` (`id_kelas`, `kelas`, `wl_kelas`) VALUES
(1, 'Kelas 1', 'Zainal Arifin'),
(2, 'Kelas 2', 'Citra');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL,
  `level` enum('Administrator','Petugas') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `username`, `password`, `level`) VALUES
(1, 'Citra', 'admin', '1', 'Administrator'),
(2, 'Nama Petugas', 'tugas', '1', 'Petugas'),
(3, 'umi', 'umi', '123', 'Petugas');

-- --------------------------------------------------------

--
-- Table structure for table `tb_profil`
--

CREATE TABLE `tb_profil` (
  `id_profil` int(11) NOT NULL,
  `nama_sekolah` varchar(200) NOT NULL,
  `alamat` varchar(400) NOT NULL,
  `akreditasi` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_profil`
--

INSERT INTO `tb_profil` (`id_profil`, `nama_sekolah`, `alamat`, `akreditasi`) VALUES
(1, 'SD Sukajawa', 'Sukajawa', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `nis` char(12) NOT NULL,
  `nama_siswa` varchar(40) NOT NULL,
  `jekel` enum('LK','PR') NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `status` enum('Aktif','Lulus','Pindah') NOT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`nis`, `nama_siswa`, `jekel`, `id_kelas`, `status`, `tgl_lahir`) VALUES
('100', 'Abdul', 'LK', 1, 'Aktif', '2020-1-1'),
('123', 'Ana', 'LK', 1, 'Aktif', '2001-2-2'),
('124', 'Budi', 'LK', 1, 'Aktif', '2001-3-3'),
('145', 'Candra', 'LK', 1, 'Aktif', '2001-4-4');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tabungan`
--

CREATE TABLE `tb_tabungan` (
  `id_tabungan` int(11) NOT NULL,
  `nis` char(12) NOT NULL,
  `setor` int(11) NOT NULL,
  `tarik` int(11) NOT NULL,
  `tgl` date NOT NULL,
  `jenis` enum('ST','TR') NOT NULL,
  `petugas` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tabungan`
--

INSERT INTO `tb_tabungan` (`id_tabungan`, `nis`, `setor`, `tarik`, `tgl`, `jenis`, `petugas`) VALUES
(40, '124', 5000, 0, '2020-04-01', 'ST', 'Zainal Arifin'),
(41, '145', 50000, 0, '2020-04-01', 'ST', 'Zainal Arifin'),
(42, '123', 50000, 0, '2020-04-01', 'ST', 'Zainal Arifin'),
(43, '145', 20000, 0, '2020-04-02', 'ST', 'Zainal Arifin'),
(44, '124', 10000, 0, '2020-04-02', 'ST', 'Zainal Arifin'),
(45, '145', 0, 50000, '2020-04-02', 'TR', 'Zainal Arifin'),
(46, '124', 20000, 0, '2020-05-19', 'ST', 'Zainal Arifin'),
(47, '124', 0, 30000, '2020-05-19', 'TR', 'Zainal Arifin'),
(48, '100', 20000, 0, '2023-02-23', 'ST', 'Citra');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_profil`
--
ALTER TABLE `tb_profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`nis`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- Indexes for table `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  ADD PRIMARY KEY (`id_tabungan`),
  ADD KEY `nis` (`nis`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_profil`
--
ALTER TABLE `tb_profil`
  MODIFY `id_profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  MODIFY `id_tabungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `tb_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_tabungan`
--
ALTER TABLE `tb_tabungan`
  ADD CONSTRAINT `tb_tabungan_ibfk_1` FOREIGN KEY (`nis`) REFERENCES `tb_siswa` (`nis`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
