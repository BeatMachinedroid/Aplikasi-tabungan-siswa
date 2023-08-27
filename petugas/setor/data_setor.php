<!-- Content Header (Page header) -->
<?php 
$data_nama = $_SESSION["ses_nama"];
?>

<section class="content-header">
	<h1>
		Transaksi
		<small>Setoran</small>
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
<!-- Main content -->

<section class="content">

	<!-- /.box-header -->

	<div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		<h4>
			<i class="icon fa fa-info"></i> Total Setoran</h4>
		<?php
    		$sql = $koneksi->query("SELECT SUM(setor) as total  from tb_tabungan where jenis='ST'");
    		while ($data= $sql->fetch_assoc()) {
  		?>
		<h3>
			<?php echo rupiah($data['total']); }?>
		</h3>
	</div>


	<div class="box box-primary">
		<div class="box-header">
			<a href="?page=add_setor" class="btn btn-primary">
				<i class="glyphicon glyphicon-plus"></i> Tambah Data</a>
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
		<div class="box-body">
			<div class="table-responsive">
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>No</th>
							<th>NIS</th>
							<th>Nama</th>
							<th>Kelas</th>
							<th>Wali Kelas</th>
							<th>Tanggal</th>
							<th>Setoran</th>
							<th>Petugas</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>

						<?php

                  $no = 1;
				  $sql = $koneksi->query("SELECT s.nis, s.nama_siswa,s.id_kelas, t.id_tabungan, t.setor, t.tgl, t.petugas, k.wl_kelas, k.kelas 
				  FROM tb_siswa s 
				  JOIN tb_tabungan t ON s.nis = t.nis 
				  JOIN tb_kelas k ON s.id_kelas = k.id_kelas WHERE t.jenis = 'ST' 
				   ORDER BY t.tgl DESC, t.id_tabungan DESC");
				  if (!$sql) {
					die("Query failed: " . $koneksi->error);
				}
                  while ($data= $sql->fetch_assoc()) {
                ?>

						<tr>
							<td>
								<?php echo $no++; ?>
							</td>
							<td>
								<?php echo $data['nis']; ?>
							</td>
							<td>
								<?php echo $data['nama_siswa']; ?>
							</td>
							<td>
								<?php echo $data['kelas']; ?>
							</td>
							<td>
								<?php echo $data['wl_kelas']; ?>
							</td>
							<td>
								<?php  $tgl = $data['tgl']; echo date("d/M/Y", strtotime($tgl))?>
							</td>
							<td align="right">
								<?php echo rupiah($data['setor']); ?>
							</td>
							
							<td>
								<?php echo $data['petugas']; ?>
							</td>
							<td>

								<a href="?page=edit_setor&kode=<?php echo $data['id_tabungan']; ?>" title="Ubah"
								 class="btn btn-success btn-sm">
									<i class="glyphicon glyphicon-edit"></i>
								</a>
								<a href="?page=del_setor&kode=<?php echo $data['id_tabungan']; ?>" onclick="return confirm('Apakah anda yakin hapus data ini ?')"
								 title="Hapus" class="btn btn-danger btn-sm">
									<i class="glyphicon glyphicon-trash"></i>
							</td>
						</tr>
						<?php
                  }
                ?>
					</tbody>

				</table>
			</div>
		</div>
	</div>
</section>