<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

if ($mysqli_connection->connect_errno) {
    echo 'Error de conexión: ' . $mysqli_connection->connect_error . '<br>';
    exit();
}

$query = "SELECT * FROM videogame";
$response = $mysqli_connection->query($query);

$i = 0;
$videogames = array();

while ($row = $response->fetch_assoc()) {
    $id = $row["id"];
    $videogame = $videogames[$i++]; 
    $videogame["videogame"] = $row;

    $response_developer = $mysqli_connection->query("SELECT developer_name FROM videogame_developer WHERE videogame_id = $id");

    while ($row_developer = $response_developer->fetch_row()) {
        $videogame["videogame"]["developer"][] = $row_developer;
    }

    $response_publisher = $mysqli_connection->query("SELECT publisher_name FROM videogame_publisher WHERE videogame_id = $id");

    while ($row_publisher = $response_publisher->fetch_row()) {
        $videogame["videogame"]["publisher"][] = $row_publisher;
    }

    $response_genre = $mysqli_connection->query("SELECT genre_name FROM videogame_genre WHERE videogame_id = $id");

    while ($row_genre = $response_genre->fetch_row()) {
        $videogame["videogame"]["genre"][] = $row_genre;
    }

    if (isset($row["score"])) {
        $query = "SELECT gameplay_score, graphics_score, art_score, sound_score, narrative_score, multiplayer_score FROM sections-score WHERE videogame_id = $id";
        $response_score = $mysqli_connection->query($query);
        $rowScore = $response_score->fetch_assoc();

        $videogame["videogame"]["scores"] = $row_score;
    }
}

echo json_encode(array("list" => $videogames));

$mysqli_connection->close();
