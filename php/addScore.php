<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

if ($mysqli_connection->connect_errno) {
    echo 'Error de conexión: ' . $mysqli_connection->connect_error . '<br>';
    exit();
}

$videogame_id = $_GET["videogame_id"];
$scores[0] = $_GET["gameplay_score"];
$scores[1] = $_GET["graphics_score"];
$scores[2] = $_GET["art_score"];
$scores[3] = $_GET["sound_score"];
$narrative = NULL;
$multiplayer = NULL;

if ($_GET["narrative_score"] != FALSE) {
    $scores[4] = $_GET["narrative_score"];
    $narrative = $scores[4];
}

if ($_GET["multiplayer_score"] != FALSE) {
    $scores[5] = $_GET["multiplayer_score"];
    $multiplayer = $scores[5];
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
$stmt->bind_param("sffffff", $id, $scores[0], $scores[1], $scores[2], $scores[3], $narrative, $multiplayer);

if (!$stmt->execute()) {
    echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
}

$stmt->prepare("INSERT INTO videogame (score) VALUES (?) WHERE videogame_id = ?");
$stmt->bind_param("is", $score, $id);

if (!$stmt->execute()) {
    echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
}

$mysqli_connection->close();
