<?php 
include "conn.php";

$u_id = mysqli_real_escape_string($conn, $_POST['u_id']);
$p_id = mysqli_real_escape_string($conn, $_POST['p_id']);

$query = "INSERT INTO cart(u_id,p_id) VALUES('$u_id','$p_id')";
$results = mysqli_query($conn, $query);
if($results>0)
{
    echo "user added successfully";
}


?>