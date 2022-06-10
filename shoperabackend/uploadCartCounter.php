<?php 
include "conn.php";

$c_id = mysqli_real_escape_string($conn, $_POST['c_id']);
$qty = mysqli_real_escape_string($conn, $_POST['qty']);

$query = "UPDATE cart SET qty = '$qty' WHERE c_id = $c_id ";
$results = mysqli_query($conn, $query);
if($results>0)
{
    echo "user added successfully";
}


?>