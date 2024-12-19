CREATE DATABASE ProjetoFinal;
USE ProjetoFinal;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(255),
    tipo ENUM('aluno', 'visitante', 'administrador')
);

CREATE TABLE administrador (
    id_usuario INT,
    cargo VARCHAR(500),
    formacao VARCHAR(225),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE alunos (
    id_usuario INT,
    curso VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE visitantes (
    id_usuario INT,
    data_registro DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descricao TEXT,
    criado_por INT,
    FOREIGN KEY (criado_por) REFERENCES usuarios(id)
);

CREATE TABLE colaboradores (
    id_projeto INT,
    id_usuario INT,
    PRIMARY KEY (id_projeto, id_usuario),
    FOREIGN KEY (id_projeto) REFERENCES projetos(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE comentarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_projeto INT,
    id_usuario INT,
    comentario TEXT,
    data_comentario DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_projeto) REFERENCES projetos(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE ImagemUsuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT, 
    caminho VARCHAR(500) NOT NULL, 
    descricao TEXT, 
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE imagens_projetos (
    id_projeto INT,
    id_imagem_usuario INT,
    PRIMARY KEY (id_projeto, id_imagem_usuario),
    FOREIGN KEY (id_projeto) REFERENCES projetos(id),
    FOREIGN KEY (id_imagem_usuario) REFERENCES ImagemUsuario(id)
);

CREATE TABLE administrador_projetos (
    id_administrador INT,
    id_projeto INT,
    PRIMARY KEY (id_administrador, id_projeto),
    FOREIGN KEY (id_administrador) REFERENCES administrador(id_usuario),
    FOREIGN KEY (id_projeto) REFERENCES projetos(id)
);
