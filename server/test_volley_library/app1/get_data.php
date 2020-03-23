<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "json_feed_db";

$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$user_id = $_POST['user_id'];

$sql_select="SELECT * FROM `user_data` WHERE `user_id`='$user_id' ";
$result_select=mysqli_query($conn,$sql_select);

$row = mysqli_fetch_row($result_select);
$num_rows = mysqli_num_rows ( $result_select );

$name=$row[1];
$email=$row[4];
$address=$row[3];

$data=array("name"=>$name,"email"=>$email,"address"=>$address);
//$data=array("name"=>"Value 1","email"=>"Value 2","address"=>"Value 3");
echo json_encode($data);
