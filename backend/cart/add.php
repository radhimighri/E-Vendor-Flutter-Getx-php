<?php

// ==========================================================
//  Copyright Reserved 2023 Radhi MIGHRI (Course Ecommerce)
// ==========================================================

include "../connect.php";


$usersid = filterRequest("usersid");
$itemsid = filterRequest("itemsid");


$count  = getData("cart", "cart_itemsid = $itemsid AND cart_usersid = $usersid" ,null  , false );


$data = array(
    "cart_usersid" =>  $usersid,
    "cart_itemsid" =>  $itemsid
);

insertData("cart", $data);
 

    // Mysql 

    // PHP 

    ?>