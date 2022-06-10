<?php

include "../conn.php";

$shop_name = $_POST["shop_name"];
$shop_address = $_POST["shop_address"];
$shop_owner_name = $_POST["shop_owner_name"];
$shop_desc = $_POST["shop_desc"];
$shop_number = $_POST["shop_number"];
$shop_email = $_POST["shop_email"];
$shop_image = $_POST["shop_image"];
$shop_map_link = $_POST["shop_map_link"];
$shop_referal = $_POST["shop_referal"];


if(empty($shop_name)){
    echo "SHOP NAME IS EMPTY";
}
else if(empty($shop_address)){
    echo "SHOP ADDRESS IS EMPTY";
}
else if(empty($shop_owner_name)){
    echo "SHOP OWNER NAME IS EMPTY";
}
else if(empty($shop_desc)){
    echo "SHOP DESCRIPTION IS EMPTY";
}
else if(empty($shop_number)){
    echo "SHOP NUMBER IS EMPTY";
}
else if(empty($shop_email)){
    echo "SHOP EMAIL IS EMPTY";
}
else if(empty($shop_image)){
    echo "SHOP IMAGE IS EMPTY";
}
else if(empty($shop_map_link)){
    echo "SHOP MAP LINK IS EMPTY";
}
else if(empty($shop_referal)){
    echo "SHOP REFERAL IS EMPTY";
}
else{
    $query = "INSERT INTO shop (s_name, s_address, s_owner_name, s_description, s_number, s_email, s_image, s_map_link, r_code) VALUES ('$shop_name','$shop_address','$shop_owner_name','$shop_desc','$shop_number','$shop_email','$shop_image','$shop_map_link','$shop_referal')";
   
    $results = mysqli_query($conn, $query);
    
    if($results == 0){
        echo "DATA IS NOT ENTERED PLEASE RESUBMIT THE FORM";
    }
    else{
        echo "DATA ENTERED SUCCESSFULLY";
    }
}

?>