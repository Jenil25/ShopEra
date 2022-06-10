<?php

include "../conn.php";

$sql2 = $conn->query("select * from offer_images");

$res = array();

while($row=$sql2->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);
?>