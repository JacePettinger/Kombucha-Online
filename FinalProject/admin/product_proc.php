<?php
// with files these are the following that is passed in the array
// $_FILES['name']['type']['size'];


// echo 'Hello World';
extract($_POST);

// print_r($_POST);
// print_r($_FILES);

$product_image_1 = $_FILES['product_image_1']['name'];

if($_FILES["product_image_1"]['size'] == 0){
     $product_image_1 = "notAvailable.jpg";
} else{
     move_uploaded_file($_FILES["product_image_1"]['tmp_name'], '../productImages/'.$_FILES["product_image_1"]['name']);
  }

$sql = "INSERT INTO php_final_project_db.products (product_name, product_description, "
        . "product_price, product_type, product_image"
        . " ) VALUES (?, ?, ?, ?, ?)";

require('../library/connect.php');
mysqli_select_db($connect, 'products');

$result = $connect->prepare($sql);
$result->bind_param("ssdss", $product_name, $product_description, $product_price, 
       $product_type, $product_image_1);

if($result->execute()) {
    echo 'Data Stored Sucessfully';
    echo '<br><br>';
    echo '<a href="productUpload.php">Upload Another Product</a>';
    echo '<br><br>';
    echo '<a href="../index.php">Return to Website</a>';
} else {
    echo 'An error occured in storing data';
}

$result->close();
$connect = NULL;