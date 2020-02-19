<?php
include 'koneksi.php';
$kode = $_GET['kode_barang'];
$hapus = $koneksi->query("DELETE FROM tb_barang WHERE kode_barang=$kode");
if($hapus){
	header("location:barang.php");
}else{
	echo"gagal menghapus data";
}
?>