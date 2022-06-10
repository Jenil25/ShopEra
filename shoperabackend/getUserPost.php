<?php 
include "conn.php";

$email = mysqli_real_escape_string($conn, $_POST['u_email']);

$sql = $conn->query("SELECT * FROM user WHERE u_email = '$email'");

$res = array();

while($row=$sql->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);

?>