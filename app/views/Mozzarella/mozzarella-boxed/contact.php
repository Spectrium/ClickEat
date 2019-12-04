<?php
	if(isset($_POST['name']))
		$name = $_POST['name'];
	if(isset($_POST['email']))
		$email = $_POST['email'];
	if(isset($_POST['message']))
		$message = $_POST['message'];	
	if(isset($_POST['sender']))
		$sender = $_POST['sender'];

	require 'Mailer.php';
	
	// email setup
	$from = "Mozzarella <supermail@domain.net>";
	// email to receive contact from
	$to = "your-email@domain.com";
	$subject = "Email sent from: ".$sender;
	$content = "<p>Name: ".$name."</p><p>Email: ".$email."</p><p>Message: ".$message."</p>";

	$mailer = new Mailer($from, $to, $subject, $content);
	// send mail
	$mailer->sendMail();
?>