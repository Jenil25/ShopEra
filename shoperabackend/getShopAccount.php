<?php

include "conn.php";

$email = mysqli_real_escape_string($conn, $_POST['email']);

$sql = $conn->query("select * from shop WHERE dp_email = '$email'");

$res = array();

while($row=$sql->fetch_assoc()){
    $res[] = $row;
}

if(empty($res)){
    echo null;
}
else{
    echo json_encode($res);
}
?>