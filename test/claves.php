<?php

$claveOriginal = "1234";
$claveEncriptada = password_hash($claveOriginal, PASSWORD_BCRYPT);

var_dump($claveEncriptada);
?>