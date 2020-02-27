<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

$mysqli_connection->set_charset("utf8mb4");

if ($mysqli_connection->connect_errno) {
    echo 'Error de conexión: ' . $mysqli_connection->connect_error . '<br>';
    exit();
}

$name = $_POST["name"];

if (!isset($name)) {
    exit();
}

$genre = $_POST["genre"];
$developer = $_POST["developer"];
$publisher = $_POST["publisher"];
$platform = $_POST["platform"];
$rating = $_POST["rating"];
$image = $_POST["image"];

if (!isset($rating)) {
    $rating = NULL;
}

if (!empty($image)) {
    $image = "img/videogames/" . $image;
} else {
    $image = "img/videogames/no-image-min.png";
}

$id = "VG-" . uniqid();
$since_date = date("Y-m-d");

$stmt = $mysqli_connection->stmt_init();

$stmt->prepare("INSERT INTO videogame (id, name, rating, image, sinceDate) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("ssiss", $id, $name, $rating, $image, $since_date);

if (!$stmt->execute()) {
    echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
    exit();
}

if (!empty($genre)) {
    for ($i = 0; $i < count($genre); $i++) {
        $stmt->prepare("INSERT INTO videogame_genre VALUES (?, ?)");
        $stmt->bind_param("ss", $id, $genre[$i]);

        if (!$stmt->execute()) {
            echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
        }
    }
}

if (!empty($developer)) {
    for ($i = 0; $i < count($developer); $i++) {
        $developer_name = $developer[$i];

        $stmt->prepare("SELECT * FROM developer WHERE name = ?");
        $stmt->bind_param("s", $developer_name);
        $stmt->execute();

        $response = $stmt->get_result();

        if ($row = $response->fetch_row() === NULL) {
            $stmt->prepare("INSERT INTO developer VALUES (?)");
            $stmt->bind_param("s", $developer_name);

            if (!$stmt->execute()) {
                echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
            }
        }

        $stmt->prepare("INSERT INTO videogame_developer VALUES (?, ?)");
        $stmt->bind_param("ss", $id, $developer_name);

        if (!$stmt->execute()) {
            echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
        }
    }
}

if (!empty($publisher)) {
    for ($i = 0; $i < count($publisher); $i++) {
        $publisher_name = $publisher[$i];

        $stmt->prepare("SELECT * FROM publisher WHERE name = ?");
        $stmt->bind_param("s", $publisher_name);
        $stmt->execute();

        $response = $stmt->get_result();

        if ($row = $response->fetch_row() === NULL) {
            $stmt->prepare("INSERT INTO publisher VALUES (?)");
            $stmt->bind_param("s", $publisher_name);

            if (!$stmt->execute()) {
                echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
            }
        }

        $stmt->prepare("INSERT INTO videogame_publisher VALUES (?, ?)");
        $stmt->bind_param("ss", $id, $publisher_name);

        if (!$stmt->execute()) {
            echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
        }
    }
}

if (!empty($platform)) {
    for ($i = 0; $i < count($platform); $i++) {
        $platform_name = $platform[$i];

        $stmt->prepare("SELECT * FROM platform WHERE name = ?");
        $stmt->bind_param("s", $platform_name);
        $stmt->execute();

        $response = $stmt->get_result();

        if ($row = $response->fetch_row() === NULL) {
            $stmt->prepare("INSERT INTO platform VALUES (?)");
            $stmt->bind_param("s", $platform_name);

            if (!$stmt->execute()) {
                echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
            }
        }

        $stmt->prepare("INSERT INTO videogame_platform VALUES (?, ?)");
        $stmt->bind_param("ss", $id, $platform_name);

        if (!$stmt->execute()) {
            echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
        }
    }
}

echo $id;

$mysqli_connection->close();