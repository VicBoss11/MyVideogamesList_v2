<?php

$mysqli_connection = new mysqli("localhost", "root", "", "myvideogameslist");

if ($mysqli_connection->connect_errno) {
    echo 'Error de conexión: ' . $mysqli_connection->connect_error . '<br>';
    exit();
}

$name = $_GET["name"];

if (isset($_GET["genre"])) {
    $genre = json_decode($_GET["genre"], TRUE);
}

if (isset($_GET["developer"])) {
    $developer = json_decode($_GET["developer"], TRUE);
}

if (isset($_GET["publisher"])) {
    $publisher = json_decode($_GET["publisher"], TRUE);
}

if (isset($_GET["platform"])) {
    $platform = json_decode($_GET["platform"], TRUE);
}

if (isset($_GET["rating"])) {
    $rating = $_GET["rating"];
} else {
    $rating = "";
}

$image = $_GET["image"];

$id = "VG-" . uniqid();
$since_date = date("Y-m-d");

$stmt = $mysqli_connection->stmt_init();

$stmt->prepare("INSERT INTO videogame VALUES (?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssissi", $id, $name, $rating, $image, $since_date, $score);

if (!$stmt->execute()) {
    echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
    exit();
}

if (isset($genre)) {
    for ($i = 0; $i < count($genre); $i++) {
        $stmt->prepare("INSERT INTO videogame_genre VALUES (?, ?)");
        $stmt->bind_param("ss", $id, $genre[$i]);

        if (!$stmt->execute()) {
            echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
        }
    }
}

if (isset($developer)) {
    for ($i = 0; $i < count($developer); $i++) {
        $developer_name = $developer[$i];

        $stmt->prepare("INSERT INTO videogame_developer VALUES (?, ?)");
        $stmt->bind_param("ss", $id, $developer_name);

        if (!$stmt->execute()) {
            echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
        }

        $response = $mysqli_connection->query("SELECT * FROM developer WHERE name = $developer_name");

        if (!$response->fetch_row()[0]) {
            $stmt->prepare("INSERT INTO developer VALUES (?)");
            $stmt->bind_param("s", $developer_name);

            if (!$stmt->execute()) {
                echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
            }
        }
    }
}

if (isset($publisher)) {
    for ($i = 0; $i < count($publisher); $i++) {
        $publisher_name = $publisher[$i];

        $stmt->prepare("INSERT INTO videogame_publisher VALUES (?, ?)");
        $stmt->bind_param("ss", $id, $publisher_name);

        if (!$stmt->execute()) {
            echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
        }

        $response = $mysqli_connection->query("SELECT * FROM publisher WHERE name = $publisher_name");

        if (!$response->fetch_row()[0]) {
            $stmt->prepare("INSERT INTO publisher VALUES (?)");
            $stmt->bind_param("s", $publisher_name);

            if (!$stmt->execute()) {
                echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
            }
        }
    }
}

if (isset($platform)) {
    for ($i = 0; $i < count($platform); $i++) {
        $platform_name = $platform[$i];

        $stmt->prepare("INSERT INTO videogame_platform VALUES (?, ?)");
        $stmt->bind_param("ss", $id, $platform_name);

        if (!$stmt->execute()) {
            echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
        }

        $response = $mysqli_connection->query("SELECT * FROM platform WHERE name = $platform_name");

        if (!$response->fetch_row()[0]) {
            $stmt->prepare("INSERT INTO platform VALUES (?)");
            $stmt->bind_param("s", $platform_name);

            if (!$stmt->execute()) {
                echo "Error al ejecutar la consulta: (" . $stmt->errno . ") " . $stmt->error;
            }
        }
    }
}

echo $id;

$mysqli_connection->close();
