<?php 
include "conn.php";

$products = mysqli_real_escape_string($conn, $_POST['products']);
$oid = mysqli_real_escape_string($conn, $_POST['oid']);

for($i = 0;$i < $products.length;$i++){
    $pid = $products[i]["p_id"];
    $sid = $products[i]["s_id"];
    $query = "INSERT INTO order_relation(o_id,p_id,s_id) VALUES('$oid','$pid','$sid')";
    $results = mysqli_query($conn, $query);
    if($results < 0){
        echo "An error occured";
    }
}
?>