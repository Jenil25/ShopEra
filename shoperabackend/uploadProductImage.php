<?php

include 'conn.php';

$p_id = (int)$_POST['p_id'];
$p_image = $_FILES["p_image"]["name"];
$tempname = $_FILES["p_image"]["tmp_name"];     
$folder = "image/".$p_image; 
$sql = "UPDATE product SET p_image = '$p_image' WHERE p_id = '$p_id'"; 
mysqli_query($conn, $sql); 
if (move_uploaded_file($tempname, $folder))  { 
    $msg = "Image uploaded successfully"; 
}
else{ 
    $msg = "Failed to upload image"; 
} 

echo $msg;

?>