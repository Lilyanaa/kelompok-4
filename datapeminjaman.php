<?php 
  session_start();
 
  // cek apakah yang mengakses halaman ini sudah login
if($_SESSION['level']==""){
  header("location:index.php?pesan=gagal");
}
 
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Logistik</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <nav class="navbar">
    <span class="open-slide">
      <a href="#" onclick="openSlideMenu()">
        <svg width="30" height="30">
            <path d="M0,5 30,5" stroke="#fff" stroke-width="5"/>
            <path d="M0,14 30,14" stroke="#fff" stroke-width="5"/>
            <path d="M0,23 30,23" stroke="#fff" stroke-width="5"/>
        </svg>
      </a>
    </span>

    <ul class="navbar-nav">
      <li><a href="halaman_user.php">Home</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Contact</a></li>
      <a href="Logout.php">Logout</a>
    </ul>
  </nav>
   <div id="side-menu" class="side-nav">
    <a href="#" class="btn-close" onclick="closeSlideMenu()">&times;</a>
    <a href="halaman_user.php">Home</a>
    <a href="infobarang.php">Daftar Barang</a>
    <a href="peminjaman.php">Peminjaman</a>
    <a href="peminjaman.php">Peminjaman</a>
  </div>
  <legend align="center"><h1>Data Peminjaman</h1></legend>
  <table id="tabelpeminjaman" class="table table-bordered table-striped table-hover">
    <thead>
    <tr>
    <th>NIM</th>
    <th>Nama Lengkap</th>
    <th>Nama Barang</th>
    <th>Tanggal Pinjam</th>
    <th>Status</th>
    <th>Action</th>
    </tr>
    </thead>
    <?php
    $sql = "SELECT peminjaman.id_peminjaman, peminjaman.status, peminjaman.id_anggota, peminjaman.tgl_pinjam, barang.nama_brg, anggota.nama FROM peminjaman JOIN barang ON peminjaman.id_brg=barang.id_brg JOIN anggota ON anggota.id_anggota=peminjaman.id_anggota ORDER BY peminjaman.id_peminjaman DESC";
    $query = $koneksi->query($sql);
    $no = 1;
    while ($lihat=mysqli_fetch_array($query)){
    ?>
    <tbody>
    <tr>
    <td><?php echo $no++ ?></td>
    <td><?php echo $lihat ['nama_brg']; ?></td>
    <td><?php echo $lihat ['nama'];?></td>
    <td><?php echo date('d-m-Y',strtotime($lihat['tgl_pinjam'])); ?></td>
    <td><span class="btn btn-xs btn-<?php echo $lihat['status'] == 1 ? 'success' : 'danger' ?>"><?php echo $lihat['status'] == 1 ? 'sudah dikembalikan' : 'belum dikembalikan'; ?></span></td>
    <td> <a href="editpeminjaman.php?id_peminjaman=<?php echo $lihat['id_peminjaman']; ?>" class="btn btn-danger">Edit</a>
    <a href="hapuspeminjaman.php?id=<?php echo $lihat['id_peminjaman']; ?>" class="btn btn-danger">Hapus</a></td>


                        </tr>
                        <?php
                        } ?>
                        </tbody>
              </table>

  <script>
    function openSlideMenu(){
      document.getElementById('side-menu').style.width = '250px';
      document.getElementById('main').style.marginLeft = '250px';
    }

    function closeSlideMenu(){
      document.getElementById('side-menu').style.width = '0';
      document.getElementById('main').style.marginLeft = '0';
    }
  </script>
</body>
</html>
