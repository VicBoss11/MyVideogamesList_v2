<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

if ($mysqli_connection->connect_errno) {
    echo 'Error de conexión: ' . $mysqli_connection->connect_error . '<br>';
    exit();
}

$mysqli_connection->set_charset("utf8mb4");

$id = $_GET["id"];
$videogame = array();

$query = "SELECT * FROM videogame WHERE id = '$id'";
$response = $mysqli_connection->query($query);
$data = $response->fetch_assoc();

$query = "SELECT genre_name FROM videogame_genre WHERE videogame_id = '$id'";
$response_genre = $mysqli_connection->query($query);

$genre = array("genre" => array());
while ($row_genre = $response_genre->fetch_row()) {
    $genre["genre"] = array_merge($genre["genre"], $row_genre);
}

$query = "SELECT developer_name FROM videogame_developer WHERE videogame_id = '$id'";
$response_developer = $mysqli_connection->query($query);

$developer = array("developer" => array());
while ($row_developer = $response_developer->fetch_row()) {
    $developer["developer"] = array_merge($developer["developer"], $row_developer);
}

$query = "SELECT publisher_name FROM videogame_publisher WHERE videogame_id = '$id'";
$response_publisher = $mysqli_connection->query($query);

$publisher = array("publisher" => array());
while ($row_publisher = $response_publisher->fetch_row()) {
    $publisher["publisher"] = array_merge($publisher["publisher"], $row_publisher);
}

$query = "SELECT platform_name FROM videogame_platform WHERE videogame_id = '$id'";
$response_platform = $mysqli_connection->query($query);

$platform = array("platform" => array());
while ($row_platform = $response_platform->fetch_row()) {
    $platform["platform"] = array_merge($platform["platform"], $row_platform);
}

$score = array("score" => array());
if (isset($data["score"])) {
    $query = "SELECT gameplay_score, graphics_score, art_score, "
        . "sound_score, narrative_score, multiplayer_score "
        . "FROM videogame_scores WHERE videogame_id = '$id'";
    $response_score = $mysqli_connection->query($query);
    $row_score = $response_score->fetch_assoc();
    $score["score"] = array_merge($score["score"], $row_score);
}

$videogame = array_merge($data, $score, $genre, $developer, $publisher, $platform);

echo json_encode(array("videogame" => $videogame));

$mysqli_connection->close();
