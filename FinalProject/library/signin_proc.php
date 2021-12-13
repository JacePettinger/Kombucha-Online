<?php

// this is to process the users log in and calidate the UN and PW
/*
print('<pre>');
print_r($_POST);
print('</pre>');
*/
require('session.php');
extract($_POST);

$email = filter_var($email_one, FILTER_SANITIZE_EMAIL); 
$email = strtolower($email);
 
$sql = "SELECT * FROM php_final_project_db.users WHERE email = '$email' ";

// Getting connection script
require_once('connect.php');
$result = mysqli_query($connect, $sql);

if (!$result) {
    echo "<script> alert('Sorry. Something went wrong')";
    echo "window.location = '../index.php';";
    echo "</script>";
} else {
     if (!mysqli_num_rows($result) === 1) {
        echo "<script> alert('Sorry. Something went wrong.');";
        echo "window.location = '../index.php';";
        echo "</script>";
    } else {
        while ($row = mysqli_fetch_assoc($result)) {
            if (!password_verify($password, $row['password'])) {
                echo "<script> alert('Sorry. Something went wrong');";
                echo "window.location = '../index.php';";
                echo "</script>";
            } else {
                // Session starts here
              echo $row['fname'];
              $_SESSION['admin'] = 'admin';
              $_SESSION['fname'] = $row['fname'];
              
              header('location: ../admin/index.php');
            }
        }
    }
}
?>
