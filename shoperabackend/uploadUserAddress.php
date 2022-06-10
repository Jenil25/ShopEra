<?php 
include "conn.php";
// REGISTER USER

$u_id = mysqli_real_escape_string($conn, $_POST['u_id']);
$address = mysqli_real_escape_string($conn, $_POST['address']);
$city = mysqli_real_escape_string($conn, $_POST['city']);


$query = "INSERT INTO user_addresses(u_id,address,city) VALUES('$u_id','$address','$city')";
$results = mysqli_query($conn, $query);
if($results>0)
{
    echo "user address added successfully";
}
    
?>