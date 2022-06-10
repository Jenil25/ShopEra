<?php 
include "conn.php";

$sid = (int)mysqli_real_escape_string($conn, $_POST['sid']);
$contact_no = mysqli_real_escape_string($conn, $_POST['contact_no']);
$address = mysqli_real_escape_string($conn, $_POST['address']);

    $query = "UPDATE shop SET s_number = '$contact_no', s_address = '$address' WHERE s_id = $sid";
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