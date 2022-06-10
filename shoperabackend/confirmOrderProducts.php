<?php 
include "conn.php";

$oid = (int)mysqli_real_escape_string($conn, $_POST['oid']);
$pid = mysqli_real_escape_string($conn, $_POST['pid']);
$sid = mysqli_real_escape_string($conn, $_POST['sid']);

$query = "INSERT INTO order_relation ( o_id, p_id, s_id ) VALUES ( $oid, $pid, $sid )";

// foreach($products as $product)
// {
//     $pid = $product['p_id'];
//     $sid = $product['s_id'];
//     $quantity = 0;
//     $quantity = $product['quantity'];
//     $query = "INSERT INTO order_relation VALUES ( $oid, $pid, $sid )";
// }
    $results = mysqli_query($conn, $query);
    if($results >0)
    {
        echo 1;
    }
    else{
        echo 0;
    }
    
    
    ?>