<?php
include 'koneksi.php';

        $kode = $_POST['kode_barang'];
        $gambar= $_POST['gambar_barang'];
        $nama = $_POST['nama_barang'];
        $status = $_POST['status'];


        // Insert user data into table
        if(isset($_POST['add'])){
            $query = $koneksi->query("INSERT INTO tb_barang values ('$kode','$gambar','$nama','$status')");

        }if ($query) {
        header("location:barang.php");
        } else {
        echo "gagal menambah data";
        }
    ?>