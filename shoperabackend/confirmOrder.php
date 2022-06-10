<?php 
include "conn.php";

$uid = (int)mysqli_real_escape_string($conn, $_POST['uid']);
$datetime = mysqli_real_escape_string($conn, $_POST['datetime']);
$amount = mysqli_real_escape_string($conn, $_POST['amount']);
$name = mysqli_real_escape_string($conn, $_POST['name']);
$mobile_number = mysqli_real_escape_string($conn, $_POST['mobile_number']);
$address1 = mysqli_real_escape_string($conn, $_POST['address1']);
$address2 = mysqli_real_escape_string($conn, $_POST['address2']);
$city = mysqli_real_escape_string($conn, $_POST['city']);
$mode = mysqli_real_escape_string($conn, $_POST['mode']);

$query = "INSERT INTO order_index( u_id, o_datetime, o_amount, o_name, o_mobile_number, o_address_line1, o_address_line2, o_city, o_mode) VALUES( '$uid', '$datetime', '$amount', '$name', '$mobile_number', '$address1', '$address2', '$city', '$mode' )";

$conn->query($query);

echo $conn->insert_id;

?>