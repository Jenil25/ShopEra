<?php

include "conn.php";

$parent_id = mysqli_real_escape_string($conn, $_POST['parent_id']);

$sql = $conn->query("SELECT * FROM category WHERE category_parent_id = '$parent_id' ");

$res = array();

while($row=$sql->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);
?>