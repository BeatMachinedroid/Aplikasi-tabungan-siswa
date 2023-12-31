<section class="content-header">
	<h1>
		Master Data
		<small>Siswa</small>
	</h1>
	<ol class="breadcrumb">
		<li>
			<a href="index.php">
				<i class="fa fa-home"></i>
				<b>Tabsis</b>
			</a>
		</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-info">
				<div class="box-header with-border">
					<h3 class="box-title">Tambah Siswa</h3>
					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool" data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool" data-widget="remove">
							<i class="fa fa-remove"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<form action="" method="post" enctype="multipart/form-data">
					<div class="box-body">
						<div class="form-group">
							<label>NIS</label>
							<input type="text" name="nis" id="nis" class="form-control" placeholder="NIS">
						</div>

						<div class="form-group">
							<label>Nama Siswa</label>
							<input type="text" name="nama_siswa" id="nama_siswa" class="form-control" placeholder="Nama Siswa">
						</div>

						<div class="form-group">
							<label>Jenis Kelamin</label>
							<select name="jekel" id="jekel" class="form-control" required>
								<option>-- Pilih --</option>
								<option>LK</option>
								<option>PR</option>
							</select>
						</div>

						<div class="form-group">
							<label>Kelas</label>
							<select name="id_kelas" id="id_kelas" class="form-control" required>
								<option value="">-- Pilih --</option>
								<?php
								// ambil data dari database
								$query = "select * from tb_kelas";
								$hasil = mysqli_query($koneksi, $query);
								while ($row = mysqli_fetch_array($hasil)) {
								?>
								<option value="<?php echo $row['id_kelas'] ?>">
									<?php echo $row['kelas'] ?>
								</option>
								<?php
                  }
                  ?>
							</select>
						</div>

						<div class="form-group">
							<label>Tanggal Lahir</label>
							<input type="date" name="tgl_lahir" id="tgl_lahir" class="form-control" placeholder="tanggal lahir">
						</div>

					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<input type="submit" name="Simpan" value="Simpan" class="btn btn-info">
						<a href="?page=MyApp/data_siswa" class="btn btn-warning">Batal</a>
					</div>
				</form>
			</div>
			<!-- /.box -->
</section>

<?php
if (isset($_POST['Simpan'])) {
    $nis = $_POST['nis'];
    $nama = $_POST['nama_siswa'];
    $jakel = $_POST['jekel'];
    $id_kelas = $_POST['id_kelas'];
    $status = 'aktif';
    $tgl_lahir = $_POST['tgl_lahir'];
    
    // Make sure you have the proper database connection ($koneksi) established before executing the query
    $sql_simpan = "INSERT INTO tb_siswa (nis, nama_siswa, jekel, id_kelas, status, tgl_lahir) VALUES ('$nis', '$nama', '$jakel', '$id_kelas', '$status', '$tgl_lahir')";
    
    $query_simpan = mysqli_query($koneksi, $sql_simpan);
	// if (!$query_simpan) {
	// 	die("Query failed: " . $koneksi->error);
	// }
    if ($query_simpan) {
        echo "<script>
            Swal.fire({
                title: 'Tambah Data Berhasil',
                text: '',
                icon: 'success',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.value) {
                    window.location = 'index.php?page=MyApp/data_siswa';
                }
            });
        </script>";
    } else {
        echo "<script>
            Swal.fire({
                title: 'Tambah Data Gagal',
                text: '',
                icon: 'error',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.value) {
                    window.location = 'index.php?page=MyApp/add_siswa';
                }
            });
        </script>";
    }
}
?>
