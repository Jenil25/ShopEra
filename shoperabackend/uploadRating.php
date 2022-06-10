<?php 
include "conn.php";

$u_id = mysqli_real_escape_string($conn, $_POST['u_id']);
$p_id = mysqli_real_escape_string($conn, $_POST['p_id']);
$value = mysqli_real_escape_string($conn, $_POST['rating']);

$query = "INSERT INTO rate(u_id,p_id,value) VALUES('$u_id','$p_id','$value')";
$results = mysqli_query($conn, $query);
if($results>0)
{
    echo "user added successfully";
}


?>