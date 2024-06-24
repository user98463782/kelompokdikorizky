<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>tugas PHP</title>
</head>
<body>
  <?php echo("Bentuk Pertama"); ?>
  <hr>
  <?php echo("Bentuk Kedua"); ?>
  <hr>
  <script language="php"> echo("Bentuk Ketiga"); </script>
  <hr>
  <?php //Contoh Komentar Pertama
    /*Contoh Komentar Kedua*/
     echo("Bentuk Penulisan Keempat"); 
    ?>
  <hr>
  <?php echo("Menghitung Gaji Total<br>");
   $gapok=2000000; $tunjangan=500000;
    $total=$gapok+$tunjangan;
     echo("Total Gaji=$total");
  ?>
  <hr>
  <?php $x=100;
   $y=150;
    if($x>$y) 
      echo("X > Y");
     else if($y>$x) 
      echo("Y > X"); 
    else 
      echo("X = Y"); 
  ?>
  <hr>
  <?php 
  $x=10; 
  while($x<=100)
  {
    echo($x."<br>");
    $x+=10; 
  } 
  ?> 
  <hr>
  <?php
   $x=0;
    for($x==0;$x<=10;$x++)
     {
       echo("Bilangan Genap: $x");
        $x++;
       echo("<br>");
      }
   ?>
  <hr>
 </body>
</html>