-- Criação da tabela Tipos de Usuários
CREATE TABLE Tipos_Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

-- Criação da tabela Usuários
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_usuario_id INT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    nif VARCHAR(255) NOT NULL,
    forma_pagamento_id INT,
    FOREIGN KEY (tipo_usuario_id) REFERENCES Tipos_Usuarios(id),
    FOREIGN KEY (forma_pagamento_id) REFERENCES Formas_Pagamento(id)
);

-- Criação da tabela Moradas
CREATE TABLE Moradas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    numero_porta VARCHAR(50),
    rua VARCHAR(255),
    codigo_postal VARCHAR(50),
    cidade VARCHAR(255),
    andar VARCHAR(50),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Criação da tabela Categorias
CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

-- Criação da tabela Produtos
CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    referencia VARCHAR(255) NOT NULL UNIQUE,
    custo_com_iva DECIMAL(10, 2) NOT NULL,
    custo_sem_iva DECIMAL(10, 2) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    fotourl VARCHAR(255),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id)
);

-- Criação da tabela Cesto de Compras
CREATE TABLE Cesto_Compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabela de relação entre Cesto de Compras e Produtos
CREATE TABLE Cesto_Produtos (
    cesto_id INT,
    produto_id INT,
    quantidade INT,
    PRIMARY KEY (cesto_id, produto_id),
    FOREIGN KEY (cesto_id) REFERENCES Cesto_Compras(id),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

-- Criação da tabela Formas de Pagamento
CREATE TABLE Formas_Pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    detalhe TEXT
);

-- Relacionamento entre Usuários e Formas de Pagamento
CREATE TABLE Usuario_Formas_Pagamento (
    usuario_id INT,
    forma_pagamento_id INT,
    PRIMARY KEY (usuario_id, forma_pagamento_id),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (forma_pagamento_id) REFERENCES Formas_Pagamento(id)
);

