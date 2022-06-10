<?php

include "../conn.php";

$shop_id = $_POST["shop_id"];
$product_name = $_POST["product_name"];
$product_category = $_POST["product_category"];
$product_cp = $_POST["product_cp"];
$product_sp = $_POST["product_sp"];
$product_desc = $_POST["product_desc"];

if(empty($shop_id)){
    echo "SHOP ID IS EMPTY";
}
else if(empty($product_name)){
    echo "PRODUCT NAME IS EMPTY";
}
else if(empty($product_category)){
    echo "PRODUCT CATEGORY IS EMPTY";
}
else if(empty($product_cp)){
    echo "PRODUCT CP IS EMPTY";
}
else if(empty($product_sp)){
    echo "PRODUCT SP IS EMPTY";
}
else if(empty($product_desc)){
    echo "PRODUCT DESCRIPTION IS EMPTY";
}
else{
    $query = "INSERT INTO product (s_id, p_name, p_category, cp, sp, p_description) VALUES ($shop_id,'$product_name',$product_category,'$product_cp','$product_sp','$product_desc')";
   
    $results = mysqli_query($conn, $query);
    
    if($results == 0){
        echo "DATA IS NOT ENTERED PLEASE RESUBMIT THE FORM";
    }
    else{
        echo "DATA ENTERED SUCCESSFULLY";
    }
}

?>