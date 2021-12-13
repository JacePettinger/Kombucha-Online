<?php

echo '<div class="product_heading">Our Current Selection Of Ready to Drink Kombucha</div>';
echo '<br><br>';

function product_puller() {
    
    require 'connect.php';
    mysqli_select_db($connect, 'php_final_project_db');
    $query = "CALL select_first_four_kombucha";
    
    $result = mysqli_query($connect, $query);
    
    if(!$result){
        echo 'connection failed';
    } else {
        echo '<div class="row">';
        while ($row = mysqli_fetch_assoc($result)) {
          echo '<div class="product_list"><!--product listing-->
                <div class="product_image">';
          echo '<img src="productImages/'.$row['product_image'].'" class="product_img" alt="Product Picture" style="height:300px;">';
          echo '</div><div class="product_det">';
          echo '<h4>'.$row['product_name'].'</h4>';
          echo '<p>'.$row['product_description'].'</p>';
          echo '<p>Price: $'.$row['product_price'].'</p>';
          echo '</div>
            <label>Qty: </label>
             <input type="number" value="1" min="0" max="10" style="width: 50px"/>
             <button type="submit">Add To Cart</button>
            </div>';
        }
        echo '</div>';
        
    }
    $connect -> close();
    $query = Null;
}

product_puller();