<?php

include "conn.php";

$s_id = mysqli_real_escape_string($conn, $_POST['shop_id']);

$sql = $conn->query("SELECT * FROM category WHERE category_id in 
                    ( SELECT p_category FROM product WHERE s_id = '$s_id' ) ");

$res = array();

while($row=$sql->fetch_assoc()){
    $res[] = $row;
}

echo json_encode($res);
?>