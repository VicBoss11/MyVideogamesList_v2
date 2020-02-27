<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

$mysqli_connection->set_charset("utf8mb4");

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

if (!empty($_GET["narrative_score"])) {
    $scores[4] = $_GET["narrative_score"];
    $narrative = $scores[4];
}

if (!empty($_GET["multiplayer_score"])) {
    $scores[5] = $_GET["multiplayer_score"];
    $multiplayer = $scores[5];
}

$count = 0;
$sum = 0;

while ($count < count($scores)) {
    $sum += $scores[$count++];
}

$avg_scores = $sum / $count;
$score = round($avg_scores * 10, 0);

settype($score, "int");

$stmt = $mysqli_connection->stmt_init();

$stmt->prepare("SELECT * FROM videogame_scores WHERE videogame_id = ?");
$stmt->bind_param("s", $videogame_id);
$stmt->execute();

$response = $stmt->get_result();

if ($row = $response->fetch_row() == NULL) {
    $stmt->prepare("INSERT INTO videogame_scores VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("sdddddd", $videogame_id, $scores[0], $scores[1], $scores[2], $scores[3], $narrative, $multiplayer);

    if (!$stmt->execute()) {
        echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
    }
} else {
    $stmt->prepare("UPDATE videogame_scores "
        . "SET gameplay_score = ?, graphics_score = ?, art_score = ?, "
        . "sound_score = ?, narrative_score = ?, multiplayer_score = ? "
        . "WHERE videogame_id = ?");
    $stmt->bind_param("dddddds", $scores[0], $scores[1], $scores[2], $scores[3], $narrative, $multiplayer, $videogame_id);

    if (!$stmt->execute()) {
        echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
    }
}

$stmt->prepare("UPDATE videogame SET score = ? WHERE id = ?");
$stmt->bind_param("is", $score, $videogame_id);

if (!$stmt->execute()) {
    echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
}
