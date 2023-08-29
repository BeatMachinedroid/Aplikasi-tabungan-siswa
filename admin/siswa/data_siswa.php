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
<!-- Main content -->
<section class="content">
	<div class="box box-primary">
		<div class="box-header with-border">
			<a href="?page=MyApp/add_siswa" title="Tambah Data" class="btn btn-primary">
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
							<th>JK</th>
							<th>Kelas</th>
							<th>Wali Kelas</th>
							<th>Status</th>
							<th>Tanggal Lahir</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>

						<?php
                  $no = 1;
				  $query = "SELECT s.nis, s.nama_siswa, s.jekel, s.status, s.tgl_lahir, k.kelas, k.wl_kelas
				  FROM tb_siswa s INNER JOIN tb_kelas k ON s.id_kelas=k.id_kelas ORDER BY kelas ASC, nis ASC";
                  $sql = $koneksi->query($query);

				  if (!$sql) {
					die("Query failed: " . $koneksi->error);
				}

                  while ($data = $sql->fetch_assoc()) {
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
								<?php $jk = $data['jekel']?>
								<?php if ($jk == 'LK') { ?>
									<td>Laki - Laki</td>	
								<?php }else{ ?>
									<td>Perempuan</td>	
								<?php }?>
							<td>
								<?php echo $data['kelas']; ?>
							</td>
							<td>
								<?php echo $data['wl_kelas']; ?>
							</td>

							<?php $warna = $data['status']  ?>
							<td>
								<?php if ($warna == 'Aktif') { ?>
								<span class="label label-primary">Aktif</span>
								<?php } elseif ($warna == 'Lulus') { ?>
								<span class="label label-success">Lulus</span>
								<?php } elseif ($warna == 'Pindah') { ?>
								<span class="label label-danger">Pindah</span>
							</td>
							<?php } ?>

							<td>
								<?= $data['tgl_lahir']; ?>
							</td>

							<td>
								<a href="?page=MyApp/edit_siswa&kode=<?php echo $data['nis']; ?>" title="Ubah"
								 class="btn btn-success">
									<i class="glyphicon glyphicon-edit"></i>
								</a>
								<a href="?page=MyApp/del_siswa&kode=<?php echo $data['nis']; ?>" onclick="return confirm('Yakin Hapus Data Ini ?')"
								 title="Hapus" class="btn btn-danger">
									<i class="glyphicon glyphicon-trash"></i>
									</>
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