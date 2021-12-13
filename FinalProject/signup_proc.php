<?php

// Process, Validate, and create users along with

if (!isset($_POST['submit'])) {
    echo 'Nothing Here';
} else {
    //  Here for error checking
    /*
      print('<pre>');
      print_r($_POST);
      print('<pre>');
     */

    extract($_POST);

    $lname = addslashes($lname);
    $address = htmlspecialchars($address);
    $zip = filter_var($zip, FILTER_SANITIZE_NUMBER_INT);

    $email_one = filter_var($email_one, FILTER_SANITIZE_EMAIL);
    $email_two = filter_var($email_two, FILTER_SANITIZE_EMAIL);

    if ($email_one == $email_two) {
        // echo 'Emails match<br>';
    }

    if ($password_one == $password_two) {
        //  echo 'passwords match<br>';
        $password_one = password_hash($password_two, PASSWORD_DEFAULT);
    }

    // echo "$fname --- $lname --- $address --- $city --- $zip --- $email_one --- $password_one";
    $email_one = strtolower($email_one);
    $query = "INSERT INTO project_db.users "
            . "(fname, lname, address, city, state, zip, email, password)"
            . "VALUES ('$fname', '$lname', '$address', '$city', '$state', "
            . "'$zip', '$email_one', '$password_one')";

    require_once ('library/connect.php'); // connecting
    mysqli_select_db($connect, 'project_db');
    $sql = mysqli_query($connect, $query);

    if (!$sql) {
        echo "<script> alert('Sorry, something went wrong sup1);";
       // echo "window.location = ('../site_project/index.php');";
        echo "</script>";
    } else {
      //  header("location: ../index.php");
        echo "<script> alert('Welcome New User.');";
        echo "window.location = ('../FinalProject/index.php');";
        echo "</script>";
    }

//clearing open connection and resetting variables
    $_POST = Null;
    $sql = Null;

// close($connect);
    $connect = Null;
}
?>