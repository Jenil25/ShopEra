<?php 
include "conn.php";
// REGISTER USER

$email_id = mysqli_real_escape_string($conn, $_POST['u_email']);
$name = mysqli_real_escape_string($conn, $_POST['name']);
        $query = "INSERT INTO user(u_email,u_name) VALUES('$email_id','$name')";
    $results = mysqli_query($conn, $query);
    if($results>0)
    {
        echo "user added successfully";
    }
    


    
    
    ?>