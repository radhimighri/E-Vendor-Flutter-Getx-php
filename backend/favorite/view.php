<?php

// ==========================================================
//  Copyright Reserved 2023 Radhi MIGHRI (Course Ecommerce)
// ==========================================================


include "../connect.php";


$id = filterRequest("id");


getAllData("myfavorite", "favorite_usersid = ?  ", array($id));

?>