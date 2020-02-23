<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

if ($mysqli_connection->connect_errno) {
    echo 'Error de conexión: ' . $mysqli_connection->connect_error . '<br>';
    exit();
}

$id = $_GET["id"];

$query = "SELECT * FROM videogame WHERE id = $id";
$response = $mysqli_connection->query($query);
$row = $response->fetch_assoc();
$videogame[] = $row;

$response_developer = $mysqli_connection->query("SELECT developer_name FROM videogame_developer WHERE videogame_id = $id");

while ($row_developer = $response_developer->fetch_row()) {
    $videogame["developer"][] = $row_developer;
}

$response_publisher = $mysqli_connection->query("SELECT publisher_name FROM videogame_publisher WHERE videogame_id = $id");

while ($row_publisher = $response_publisher->fetch_row()) {
    $videogame["publisher"][] = $row_publisher;
}

$response_genre = $mysqli_connection->query("SELECT genre_name FROM videogame_genre WHERE videogame_id = $id");

while ($row_genre = $response_genre->fetch_row()) {
    $videogame["genre"][] = $row_genre;
}

if (isset($row["score"])) {
    $query = "SELECT * FROM sections-score WHERE videogame_id = " . $row["id"];
    $response2 = $mysqli_connection->query($query);
    $row2 = $response2->fetch_assoc();

    $videogame["score"] = $row2;
}

echo json_encode(array("videogame" => $videogame));

$mysqli_connection->close();
