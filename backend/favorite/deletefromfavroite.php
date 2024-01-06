<?php 
// ==========================================================
//  Copyright Reserved 2023 Radhi MIGHRI (Course Ecommerce)
// ==========================================================


include "../connect.php" ; 

$id = filterRequest("id") ;  

deleteData("favorite" , "favorite_id = $id"); 

?>