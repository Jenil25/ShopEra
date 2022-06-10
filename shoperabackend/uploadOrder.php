<?php 
include "conn.php";

$u_id = mysqli_real_escape_string($conn, $_POST['u_id']);
$datetime = mysqli_real_escape_string($conn, $_POST['datetime']);
$amount = mysqli_real_escape_string($conn, $_POST['amount']);

$query = "INSERT INTO order_index(u_id,o_datetime,o_amount) VALUES('$u_id','$datetime','$amount')";
$results = mysqli_query($conn, $query);
if($results>0)
{
    $oidquery="SELECT o_id FROM order_index WHERE u_id = '$u_id' AND o_datetime = '$datetime' AND amount = '$amount'";
    
    $sql = $conn->query($oidquery);

    $res = array();

    while($row=$sql->fetch_assoc()){
        $res[] = $row;
    }
    echo $res;
}


?>