
-- =====================================================
-- PROJETO: JOGO DE RPG ONLINE
-- BANCO DE DADOS: RPG_ONLINE
-- SGBD: MICROSOFT SQL SERVER
-- =====================================================

-- 1. CRIACAO DO BANCO DE DADOS

CREATE DATABASE RPG_ONLINE;
GO

-- 2. SELECIONAR O BANCO DE DADOS

USE RPG_ONLINE;
GO

-- =====================================================
-- 3. CRIACAO DA TABELA USUARIOS
-- Um usuario pode possuir varios personagens.
-- =====================================================

CREATE TABLE USUARIOS (
    UsuarioId INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);
GO

-- =====================================================
-- 4. CRIACAO DA TABELA CLASSES
-- Uma classe pode pertencer a varios personagens.
-- =====================================================

CREATE TABLE CLASSES (
    ClasseId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(500)
);
GO

-- =====================================================
-- 5. CRIACAO DA TABELA PERSONAGENS
-- Cada personagem pertence a um usuario e uma classe.
-- =====================================================

CREATE TABLE PERSONAGENS (
    PersonagemId INT IDENTITY(1,1) PRIMARY KEY,
    NomePersonagem VARCHAR(100) NOT NULL,
    UsuarioId INT NOT NULL,
    ClasseId INT NOT NULL,

    CONSTRAINT FK_PERSONAGENS_USUARIOS
        FOREIGN KEY (UsuarioId)
        REFERENCES USUARIOS(UsuarioId),

    CONSTRAINT FK_PERSONAGENS_CLASSES
        FOREIGN KEY (ClasseId)
        REFERENCES CLASSES(ClasseId)
);
GO

-- =====================================================
-- 6. CRIACAO DA TABELA HABILIDADES
-- Armazena as habilidades disponiveis no jogo.
-- =====================================================

CREATE TABLE HABILIDADES (
    HabilidadeId INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);
GO

-- =====================================================
-- 7. CRIACAO DA TABELA CLASSES_HABILIDADES
-- Relacionamento N:N entre CLASSES e HABILIDADES.
-- Possui chave primaria composta.
-- =====================================================

CREATE TABLE CLASSES_HABILIDADES (
    ClasseId INT NOT NULL,
    HabilidadeId INT NOT NULL,

    CONSTRAINT PK_CLASSES_HABILIDADES
        PRIMARY KEY (ClasseId, HabilidadeId),

    CONSTRAINT FK_CLASSES_HABILIDADES_CLASSES
        FOREIGN KEY (ClasseId)
        REFERENCES CLASSES(ClasseId),

    CONSTRAINT FK_CLASSES_HABILIDADES_HABILIDADES
        FOREIGN KEY (HabilidadeId)
        REFERENCES HABILIDADES(HabilidadeId)
);
GO

-- =====================================================
-- 8. CONSULTAR AS TABELAS CRIADAS
-- =====================================================

SELECT * FROM USUARIOS;
SELECT * FROM PERSONAGENS;
SELECT * FROM CLASSES;
SELECT * FROM HABILIDADES;
SELECT * FROM CLASSES_HABILIDADES;
GO

-- =====================================================
-- FIM DO SCRIPT - RPG ONLINE
-- =====================================================
