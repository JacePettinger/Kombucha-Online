<body>
    <div id="container">
        <header>
            <!-- Image  being use for background is in this header -->
            <div class="sign_in">
                <?php
                IF (ISSET($_SESSION['admin']) AND $_SESSION['admin'] == 'admin') {
                    echo '<h3>Welcome ' . $_SESSION['fname'] . '</h3>';
                    echo '<button type="submit" class="btn btn-primary"><a href="log_out.php" style="color: black;">Log Out</a></button>';
                    echo '<br><a href="admin/index.php">Go To Admin Page</a>';
                } ELSE {
                    echo '<!-- The log in form starts here -->
                <form method="post" action="library/signin_proc.php">
                <div class="mb-3" style="padding: 10px;">
                <input type="email" class="form-control" name="email_one" placeholder="Email">
                </div>
                <div class="mb-3" style="padding: 10px;">
                <input type="password" class="form-control" name="password" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-primary">Log In</button>
                </form>
                <a href="sign_up.php" style="color: black;">Sign Up</a>
                <!-- The log in form ends here --> ';
                }
                ?>
            </div>
        </header>