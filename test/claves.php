<?php

$claveOriginal = "1628";
$claveEncriptada = password_hash($claveOriginal, PASSWORD_BCRYPT);

var_dump($claveEncriptada);
?>