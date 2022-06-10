<?php 
include "conn.php";

// $uid = mysqli_real_escape_string($conn, $_POST['u_id']);
// $pid = mysqli_real_escape_string($conn, $_POST['p_id']);

$pid = (int)$_POST['p_id'];
$uid = (int)$_POST['u_id'];
echo $pid;
echo "\n";
echo $uid;

$query = "DELETE FROM cart WHERE u_id='$uid' AND p_id='$pid'";

try{
    $results = mysqli_query($conn, $query);
}
catch(Exception $e){
    echo "Could not delete from cart";
    echo $e;
}


?>