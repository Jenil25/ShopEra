<?php 
include "conn.php";

$uid = (int)mysqli_real_escape_string($conn, $_POST['uid']);
$contact_no = mysqli_real_escape_string($conn, $_POST['contact_no']);
$address = mysqli_real_escape_string($conn, $_POST['address']);

    $query = "UPDATE user SET u_mobile = '$contact_no', u_address = '$address' WHERE u_id = $uid";
    $results = mysqli_query($conn, $query);
    echo "contactno=".$contact_no;
    echo "<br>";
    echo "uid=".$uid;
    echo "<br>";
    echo "address=".$address;
    if($results >0)
    {
        echo 1;
    }
    else{
        echo 0;
    }
    
    
    ?>