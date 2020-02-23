<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

if ($mysqli_connection->connect_errno) {
    echo 'Error de conexión: ' . $mysqli_connection->connect_error . '<br>';
    exit();
}

$id = $_GET["id"];

$stmt->prepare("DELETE FROM videogame WHERE id = ?");
$stmt->bind_result($id);

if (!$stmt->execute()) {
    echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
}

$mysqli_connection->close();
