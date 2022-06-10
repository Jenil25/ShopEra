<?php 
include "conn.php";

$u_id = mysqli_real_escape_string($conn, $_GET['u_id']);

$sql = $conn->query("SELECT * FROM cart WHERE u_id = '$email'");

$res = array();

while($row=$sql->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);

?>