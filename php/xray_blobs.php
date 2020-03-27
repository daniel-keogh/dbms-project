<?php
    // Local
    $var = mysqli_connect("localhost", "root", "");

    // Remote
    // $var = mysqli_connect("CLOUD_IP", "DK", "DK");

    mysqli_select_db($var, "mulcahy_dental") or die(mysqli_error());

	$image_id = $_GET['treatment_id'];
    $sql = "SELECT xray FROM treatment WHERE treatment_id=$image_id" ;
    $resultset = mysqli_query($var, "$sql") or die("Invalid query: " . mysqli_error());

    $row = mysqli_fetch_array($resultset);
    
    header('Content-type: image/jpeg');
    echo $row[0];
    
   	mysqli_close($var);
?>