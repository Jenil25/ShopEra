<?php 
include "conn.php";

$pid = (int)$_POST['p_id'];
$uid = (int)$_POST['u_id'];
// echo $pid;
// echo "\n";
// echo $uid;

$query = "DELETE FROM favourite WHERE u_id='$uid' AND p_id='$pid'";

try{
    $results = mysqli_query($conn, $query);
}
catch(Exception $e){
    echo "Could not delete from cart";
    echo $e;
}


?>