<?php
include 'config.php';

// Simula o ID do usuário logado (substitua isto pelo ID real do usuário logado)
$criado_por = 1; // Por exemplo, o ID 1 é do usuário logado

$titulo = $_POST['titulo'];
$descricao = $_POST['descricao'];

$sql = "INSERT INTO projetos (titulo, descricao, criado_por) VALUES ('$titulo', '$descricao', '$criado_por')";
if ($conn->query($sql) === TRUE) {
    $id_projeto = $conn->insert_id;
    
    $colaboradores = json_decode($_POST['colaboradores']);
    foreach ($colaboradores as $colaborador) {
        $sql_colaborador = "INSERT INTO colaboradores (id_projeto, id_usuario) VALUES ('$id_projeto', '$colaborador')";
        $conn->query($sql_colaborador);
    }
    echo "Projeto cadastrado com sucesso!";
} else {
    echo "Erro: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
