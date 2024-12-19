<?php
include 'config.php';

$nome = $_POST['nome'];
$email = $_POST['email'];
$senha = password_hash($_POST['senha'], PASSWORD_BCRYPT);
$tipo = $_POST['tipo_usuario'];

$sql = "INSERT INTO usuarios (nome, email, senha, tipo) VALUES ('$nome', '$email', '$senha', '$tipo')";
if ($conn->query($sql) === TRUE) {
    $id_usuario = $conn->insert_id;
    if ($tipo == 'aluno') {
        $curso = $_POST['curso'];
        $sql_aluno = "INSERT INTO alunos (id_usuario, curso) VALUES ('$id_usuario', '$curso')";
        $conn->query($sql_aluno);
    } elseif ($tipo == 'visitante') {
        $data_registro = date('Y-m-d');
        $sql_visitante = "INSERT INTO visitantes (id_usuario, data_registro) VALUES ('$id_usuario', '$data_registro')";
        $conn->query($sql_visitante);
    } elseif ($tipo == 'administrador') {
        $cargo = $_POST['cargo'];
        $formacao = $_POST['formacao'];
        $sql_administrador = "INSERT INTO administrador (id_usuario, cargo, formacao) VALUES ('$id_usuario', '$cargo', '$formacao')";
        $conn->query($sql_administrador);
    }
    echo "Usuário cadastrado com sucesso!";
} else {
    echo "Erro: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
