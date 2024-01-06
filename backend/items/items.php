<?php
// ==========================================================
//  Copyright Reserved 2023 Radhi MIGHRI (Course Ecommerce)
// ==========================================================


include "../connect.php";

 

 $categoryid = filterRequest("id");  

// // getAllData("itemsview", "categories_id = $categoryid");

$userid = filterRequest("usersid");

// echo "usersid : $userid";
// echo "categoryid : $categoryid";

// $categoryid = 1;

// getAllData("itemsview", "categories_id = $categoryid");

// $userid = 16;


try {
    $stmt = $con->prepare("SELECT items1view.*, 1 as favorite FROM items1view
    INNER JOIN favorite ON favorite.favorite_itemsid = items1view.items_id AND favorite.favorite_usersid = :userid
    WHERE categories_id = :categoryid
    UNION ALL
    SELECT *, 0 as favorite FROM items1view
    WHERE categories_id = :categoryid AND items_id NOT IN (
        SELECT items1view.items_id FROM items1view
        INNER JOIN favorite ON favorite.favorite_itemsid = items1view.items_id AND favorite.favorite_usersid = :userid
    )");

    $stmt->bindParam(':userid', $userid, PDO::PARAM_INT);
    $stmt->bindParam(':categoryid', $categoryid, PDO::PARAM_INT);
    $stmt->execute();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

 $count = $stmt->rowCount();
 
if ($count > 0) {
    echo json_encode(array("status" => "success", "data" => $data));
} else {
    echo json_encode(array("status" => "failure"));
}


} catch (PDOException $e) {
    // Handle the exception and display the error message
    echo "PDO Exception: " . $e->getMessage();
}


?>