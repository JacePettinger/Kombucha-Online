<?php

session_start();

IF(ISSET($_SESSION['admin']) AND $_SESSION['admin'] == 'admin'){
    echo '<h1>Hello Admin</h1>';

    echo '<a href="productUpload.php">Product Upload Form</a>' ;
    echo '<br><br>';
    echo '<a href="../index.php">Return to Website</a>';
} else {
    header('location: ../index.php');
}
