<?php 
include "conn.php";

$dpid = (int)mysqli_real_escape_string($conn, $_POST['dpid']);
$contact_no = mysqli_real_escape_string($conn, $_POST['contact_no']);
$address = mysqli_real_escape_string($conn, $_POST['address']);

    $query = "UPDATE delivery SET dp_number = '$contact_no', dp_address = '$address' WHERE dp_id = $dpid";
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