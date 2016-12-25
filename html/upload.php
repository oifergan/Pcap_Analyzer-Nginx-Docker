<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
/*if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}*/
// Check if file already exists
//if (file_exists($target_file)) {
//    echo "Sorry, file already exists.";
//    $uploadOk = 0;
//}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 500000000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
if ( $imageFileType != "pcap" ) {
    echo "Sorry, only PCAP file are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.\r\n";
	echo "/usr/share/nginx/html/$target_file\r\n";
	$output = shell_exec(" ls -lart /usr/share/nginx/html/$target_file");
	echo "<pre>$output</pre>";
	$output = shell_exec("/usr/share/nginx/html/ps_analyzer_all -i /usr/share/nginx/html/$target_file");
	echo "<pre>$output</pre>";
	$output = shell_exec("cat /var/log/nginx/error.log");
	echo "<pre>$output</pre>";
    } else {
        echo "Sorry, there was an error uploading your file.";
	$output = shell_exec("cat /var/log/nginx/error.log");
	echo "<pre>$output</pre>";
	echo "<pre>$output</pre>";
    }
}
?>
