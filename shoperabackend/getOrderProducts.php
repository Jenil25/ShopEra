<?php 
include "conn.php";

$o_id = mysqli_real_escape_string($conn, $_POST['oid']);

$sql = $conn->query("SELECT * FROM order_relation WHERE o_id = '$o_id'");

$res = array();

while($row=$sql->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);

?>