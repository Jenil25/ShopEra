<?php 
include "conn.php";

$sid = (int)mysqli_real_escape_string($conn, $_POST['sid']);

$query = "UPDATE shop SET signups = signups + 1 WHERE s_id = $sid ";
$results = mysqli_query($conn, $query);


if($results>0)
{
    //echo "user added successfully";
}


?>