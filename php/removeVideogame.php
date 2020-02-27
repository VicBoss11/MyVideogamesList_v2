<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

$mysqli_connection->set_charset("utf8mb4");

if ($mysqli_connection->connect_errno) {
    echo 'Error de conexión: ' . $mysqli_connection->connect_error . '<br>';
    exit();
}

$id = $_GET["id"];

$stmt = $mysqli_connection->stmt_init();
$stmt->prepare("DELETE FROM videogame WHERE id = ?");
$stmt->bind_param('s', $id);

if (!$stmt->execute()) {
    echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
}

$mysqli_connection->close();
