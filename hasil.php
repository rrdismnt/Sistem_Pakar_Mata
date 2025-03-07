<?php 
include 'function.php';

if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 0) {
        header("location: indexAdmin.php");
        exit();
    } else if ($_SESSION['role'] == 2) {
        header("location: indexPakar.php");
        exit();
    }
} else {
    header("location:index.php");
    exit();
}

if (!isset($_POST['gejala'])) {
    echo "No symptoms selected!";
    exit();
}

$selected_gejala = $_POST['gejala'];

// Asumsi daftar gejala
$gejala_list = [
    1 => 'Gejala 1 = Pandangan kabur sepereti berkabut',
    2 => 'Gejala 2 = Pandangan ganda',
    3 => 'Gejala 3 = Warna di sekitar memudar',
    4 => 'Gejala 4 = Melihat kilatan cahaya (Fotopsis)',
    5 => 'Gejala 5 = Terdapat bintik hitam yang selalu bergerak/melayang',
    6 => 'Gejala 6 = Lapangan pandang yang menyempit',
    7 => 'Gejala 7 = Pandangan yang samar atau tidak fokus',
    8 => 'Gejala 8 = Kesulitan membedakan warna-warna yang bersebelahan',
    9 => 'Gejala 9 = Sensitif terhadap sorotan cahaya',
    10 => 'Gejala 10 = Melihat bayangan lingkarang di sekeliling cahaya',
    11 => 'Gejala 11 = Mata memerah',
    12 => 'Gejala 12 = Penglihatan yang semakin menyempit hingga akhirnya tidak dapat melihat objek sama sekali',
    13 => 'Gejala 13 = Gangguan penglihatan',
    14 => 'Gejala 14 = Pembesaran kornea',
    15 => 'Gejala 15 = Kemerahan pada konjungtiva mata',
    16 => 'Gejala 16 = Mata sering terasa gatal dan seperti ada debu',
    17 => 'Gejala 17 = Mata mengeluarkan cairan kental yang membentuk kerak pda malam hari',
    18 => 'Gejala 18 = Mata dapat mengeluarkan cairan kental yang membentuk kerak pda malm hari, sehingga menyulitkan kamu',
    19 => 'Gejala 19 = Terkadang mata mengeluarkan air',
    20 => 'Gejala 20 = Iritasi dan perih pada mata',
    21 => 'Gejala 21 = Pertumbuhan selaput berwarna putih pada sudut mata bagian dalam atau luar',
    22 => 'Gejala 22 = Kelopak mata terasa gatal',
    23 => 'Gejala 23 = Kelopak mata menjadi lengket',
    24 => 'Gejala 24 = Tepi kelopak mata terlihat bengkak',
    25 => 'Gejala 25 = Mata yang terlalu berair',
    26 => 'Gejala 26 = Munculnya nanah yang keluar dari sudut mata',
    27 => 'Gejala 27 = Pembengkakan pada saluran air mata dikelopak bagian bawah',
];

$Katarak = [1, 2, 3];
$Ablasio = [4, 5, 6];
$Astigmatisme = [7, 8, 9];
$Glaukoma = [10, 11, 12];
$Bufthalmus = [13, 14, 15];
$Konjungtivitis = [16, 17, 18];
$Pterygium = [19, 20, 21];
$Blefaritis = [22, 23, 24];
$Dakriosistitis = [25, 26, 27];

function calculatePercentage($symptoms, $selected_gejala) {
    $nilai = 0;
    foreach ($selected_gejala as $value) {
        if (in_array($value, $symptoms)) {
            $nilai += 1;
        }
    }
    return number_format(($nilai / count($symptoms)) * 100, 2);
}

$katarak_percentage = calculatePercentage($Katarak, $selected_gejala);
$ablasio_percentage = calculatePercentage($Ablasio, $selected_gejala);
$astigmatisme_percentage = calculatePercentage($Astigmatisme, $selected_gejala);
$glaukoma_percentage = calculatePercentage($Glaukoma, $selected_gejala);
$bufthalmus_percentage = calculatePercentage($Bufthalmus, $selected_gejala);
$konjungtivitis_percentage = calculatePercentage($Konjungtivitis, $selected_gejala);
$pterygium_percentage = calculatePercentage($Pterygium, $selected_gejala);
$blefaritis_percentage = calculatePercentage($Blefaritis, $selected_gejala);
$dakriosistitis_percentage = calculatePercentage($Dakriosistitis, $selected_gejala);

$solusi_map = [
    'Katarak' => $katarak_percentage,
    'Ablasio' => $ablasio_percentage,
    'Astigmatisme' => $astigmatisme_percentage,
    'Glaukoma' => $glaukoma_percentage,
    'Bufthalmus' => $bufthalmus_percentage,
    'Konjungtivitis' => $konjungtivitis_percentage,
    'Pterygium' => $pterygium_percentage,
    'Blefaritis' => $blefaritis_percentage,
    'Dakriosistitis' => $dakriosistitis_percentage
];

arsort($solusi_map);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
    rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous"/>
    <link
    href="https://fonts.googleapis.com/css?family=Poppins:300,400,700&display=swap"
    rel="stylesheet"/>
    <link rel="stylesheet" href="custom.css" />
    <style> body {
    background-color: #4abdac;
  }
  /* Styling for the table */
  table {
            background-color: white;
            color: white;
        }
        table th, table td {
            border-color: white;
        }
</style>
    
    <title>Hasil Diagnosis</title>
</head>
<body>
    <nav class="navbar py-2 navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="gambar/logomata.png" width="147" alt="logo" />
            </a>
            <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="btn btn-primary ml-2" href="test.php" role="button">Cek Ulang</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary ml-2" href="logout.php" role="button">Log Out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="gejala mt-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 align-self-center">
                    <h3 class="mb-4">Gejala yang Dipilih:</h3>
                    <ul>
                        <?php foreach ($selected_gejala as $gejala): ?>
                            <li><?php echo $gejala_list[$gejala]; ?></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <section class="hasil mt-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10 align-self-center">
                    <h3 class="mb-4">Hasil Diagnosis Anda:</h3>
                    <table class="table table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Penyakit</th>
                                <th scope="col">Persentase</th>
                                <th scope="col">Solusi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($solusi_map as $penyakit => $persentase): ?>
                                <tr>
                                    <td><?php echo $penyakit; ?></td>
                                    <td><?php echo $persentase; ?>%</td>
                                    <td>
                                        <?php
                                        // Mengambil solusi untuk setiap penyakit dari database
                                        $query = "SELECT solusi FROM solusi WHERE id_penyakit = (SELECT id_penyakit FROM penyakit WHERE penyakit = '$penyakit')";
                                        $result = mysqli_query($koneksi, $query);

                                        if (!$result) {
                                            echo "Error: " . mysqli_error($koneksi);
                                        } else {
                                            while ($row = mysqli_fetch_assoc($result)) {
                                                echo '<div>' . $row['solusi'] . '</div>';
                                            }
                                        }
                                        ?>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</body>
<script
    src="https://code.jquery.com/jquery-3.4.1.js"
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"
></script>
<script
    src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"
></script>
<script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"
></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"
></script>
</html>
