<?php
include 'config.php';

$termo = $_GET['termo'];
$sql = "SELECT id, nome FROM usuarios WHERE tipo != 'visitante' AND nome LIKE '%$termo%'";

$result = $conn->query($sql);
$usuarios = array();

while ($row = $result->fetch_assoc()) {
    $usuarios[] = $row;
}

echo json_encode($usuarios);

$conn->close();
?>
