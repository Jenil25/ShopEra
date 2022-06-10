<?php

include "conn.php";

$category_id = mysqli_real_escape_string($conn, $_POST['category_id']);

$sql = $conn->query("SELECT * FROM product WHERE p_category = '$category_id' ");

$res = array();

while($row=$sql->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);
?>