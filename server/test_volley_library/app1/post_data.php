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

$insert_name = $_POST['name'];
$insert_password = $_POST['password'];
$insert_address = $_POST['address'];
$insert_email = $_POST['email'];
$insert_phone = $_POST['phone'];


$sql = "INSERT INTO user_data ( name,password,address,email,phone)VALUES
('$insert_name','$insert_password','$insert_address','$insert_email','$insert_phone')";

$result=mysqli_query($conn,$sql);


$sql_select="SELECT * FROM `user_data` WHERE `name`='$insert_name' ";
$result_select=mysqli_query($conn,$sql_select);

$row = mysqli_fetch_row($result_select);
$num_rows = mysqli_num_rows ( $result_select );

$name=$row[1];
$email=$row[4];
$address=$row[3];

$data=array("name"=>$name,"email"=>$email,"address"=>$address);
//$data=array("name"=>"Value 1","email"=>"Value 2","address"=>"Value 3");
echo json_encode($data);
?>