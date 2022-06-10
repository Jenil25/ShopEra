<?php 
include "conn.php";

$u_id = mysqli_real_escape_string($conn, $_POST['uid']);

$sql = $conn->query("SELECT * FROM order_index WHERE u_id = '$u_id'");

$res = array();

while($row=$sql->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);

?>