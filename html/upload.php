<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 0;
$FileType = pathinfo($target_file,PATHINFO_EXTENSION);

if ($_FILES["fileToUpload"]["size"] > 500000000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 1;
}
// Allow certain file formats
if ( $FileType != "pcap" ) {
    echo "Sorry, only PCAP file are allowed.";
    $uploadOk = 1;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 1) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
	echo "/usr/share/nginx/html/$target_file";
	$output = shell_exec("/usr/share/nginx/html/ps_analyzer_all -i /usr/share/nginx/html/$target_file -v 1");
	echo "<pre>$output</pre>";
    } else {
        echo "Sorry, there was an error uploading your file.";
	$output = shell_exec("cat /var/log/nginx/error.log");
	echo "<pre>$output</pre>";
    }
}
?>
