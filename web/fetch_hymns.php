<?php
include_once ('conf.php');
$sql = "CALL sp_get_hymns();";
$result = $conn->query($sql);
$array = array();
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
	$array[] = $row;
  }
 $json = array("Status" => 1, "Error" => false, "Message" => "Hymns", "Info" => $array);
} else {
 $json = array("Status" => 1, "Error" => false, "Message" => "No data returned", "Info" => "");
}

mysqli_close($conn);

header('Content-type: application/json');
echo json_encode($json);
?>
