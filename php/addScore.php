<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

if ($mysqli_connection->connect_errno) {
    echo 'Error de conexión: ' . $mysqli_connection->connect_error . '<br>';
    exit();
}

$videogame_id = $_GET["videogame_id"];
$scores[] = $_GET["gameplay_score"];
$scores[] = $_GET["graphics_score"];
$scores[] = $_GET["art_score"];
$scores[] = $_GET["sound_score"];

if (isset($_GET["narrative_score"])) {
    $scores[] = $_GET["narrative_score"];
}

if (isset($_GET["multiplayer_score"])) {
    $scores[] = $_GET["multiplayer_score"];
}

$count = 0;
$sum = 0;

while ($count < count($scores)) {
    $sum += $scores[$count++];
}

$avg_scores = $sum / $count;
$score = round($avg_scores * 10);

$stmt = $mysqli_connection->stmt_init();

$stmt->prepare("INSERT INTO sections-score VALUES (?, ?, ?, ?, ?, ?, ?)");
$stmt->bind_param("sffffff", $id, $scores[0], $scores[1], $scores[2], $scores[3], $scores[4], $scores[5]);

if (!$stmt->execute()) {
    echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
}

$stmt->prepare("INSERT INTO videogame (score) VALUES (?) WHERE videogame_id = ?");
$stmt->bind_param("is", $score, $id);

if (!$stmt->execute()) {
    echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
}

$mysqli_connection->close();
