<?php 
// ==========================================================
//  Copyright Reserved 2023 Radhi MIGHRI (Course Ecommerce)
// ==========================================================

include "../connect.php" ; 

global $con;


$usersid = filterRequest("usersid");
$itemsid = filterRequest("itemsid");


$subquery = $con->prepare("SELECT cart_id FROM cart WHERE cart_usersid = :usersid AND cart_itemsid = :itemsid LIMIT 1"); //delete items with same id one by one
$subquery->bindParam(':usersid', $usersid, PDO::PARAM_INT);
$subquery->bindParam(':itemsid', $itemsid, PDO::PARAM_INT);

$subquery->execute();
$count = $subquery->rowCount();


     if ($count > 0) {
        // echo json_encode(array("success" => "success", "data" => $stmt));

         $cartId = $subquery->fetchColumn();
        deleteData("cart" , "cart_id  = $cartId");  

// echo $cartId;

    } else {
        echo json_encode(array("status" => "failure"));
    }
 


 
// deleteData("cart" , "cart_id  = (SELECT cart_id FROM cart WHERE cart_usersid = $usersid AND cart_itemsid = $itemsid LIMIT 1)");  //delete items with same id one by one
 ?>