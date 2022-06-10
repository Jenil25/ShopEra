<?php

include "conn.php";

$u_id = mysqli_real_escape_string($conn, $_POST['u_id']);

$sql = $conn->query("SELECT * FROM cart WHERE u_id = '$u_id' ");

$res = array();

while($row=$sql->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);
?>