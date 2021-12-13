<?php

// To connect to MySQL

$host = 'localhost';
$db_user_name = 'root';
$db_password = '';

$connect = new mysqli($host, $db_user_name, $db_password);

if($connect->connect_error) {
   // echo '<br>Can not connect<br>';    
    header('location: ../site_project/index.php');
} else {
   // echo '<br>You are connected<br>';
}

?>
