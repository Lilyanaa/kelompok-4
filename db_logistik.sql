-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2019 at 10:54 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_logistik`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `kode_anggota` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nim` int(8) NOT NULL,
  `jurusan` varchar(30) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `telp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_anggota`
--

INSERT INTO `tb_anggota` (`kode_anggota`, `nama`, `nim`, `jurusan`, `kelas`, `telp`) VALUES
('A001', 'Yoga Rizky Pratama', 1805029, 'TI', 'RPL', '082217461498'),
('A002', 'Wahyu Ramadhan', 1805028, 'TI', 'RPL', '081111111111');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(10) NOT NULL,
  `gambar_barang` varchar(1) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `gambar_barang`, `nama_barang`, `status`) VALUES
('B001', '', 'Proyektor', 'Tersedia'),
('B002', '', 'Mic', 'Tersedia'),
('B003', '', 'Kabel VGA', 'Tersedia'),
('B004', '', 'Sound System', 'Tidak Tersedia'),
('B005', '', 'Megaphone', 'Tidak Tersedia'),
('B006', '', 'HS', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `kode_peminjaman` varchar(10) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `t_pinjam` date NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengembalian`
--

CREATE TABLE `tb_pengembalian` (
  `kode_pengembalian` varchar(10) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `kode_peminjaman` varchar(10) NOT NULL,
  `t_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `kode_user` varchar(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`kode_user`, `nama`, `username`, `password`, `level`) VALUES
('U001', 'Andi Purnomo', 'andi', '123456', 'admin'),
('U002', 'Achmad Nur Fauzi', 'Fauzi', '123456', 'admin'),
('U003', 'Lilyan', 'lilyan', '123456', 'admin'),
('U004', 'wahyu ramadhan', 'wahyu', '123456', 'user'),
('U005', 'Yoga Rizky Pratama', 'yoga', '123456', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`kode_anggota`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`kode_peminjaman`),
  ADD KEY `kode_barang` (`kode_barang`,`kode_anggota`),
  ADD KEY `anggota` (`kode_anggota`);

--
-- Indexes for table `tb_pengembalian`
--
ALTER TABLE `tb_pengembalian`
  ADD PRIMARY KEY (`kode_pengembalian`),
  ADD KEY `kode_barang` (`kode_barang`),
  ADD KEY `kode_peminjaman` (`kode_peminjaman`),
  ADD KEY `kode_anggota` (`kode_anggota`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`kode_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD CONSTRAINT `anggota` FOREIGN KEY (`kode_anggota`) REFERENCES `tb_anggota` (`kode_anggota`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `barang` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_pengembalian`
--
ALTER TABLE `tb_pengembalian`
  ADD CONSTRAINT `peminjaman` FOREIGN KEY (`kode_peminjaman`) REFERENCES `tb_peminjaman` (`kode_peminjaman`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
