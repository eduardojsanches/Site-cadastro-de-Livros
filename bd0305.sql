-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/05/2024 às 22:19
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd0305`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbautor`
--

CREATE TABLE `tbautor` (
  `codAutor` int(11) NOT NULL,
  `nomeAutor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbautor`
--

INSERT INTO `tbautor` (`codAutor`, `nomeAutor`) VALUES
(1, 'Machado de Assis'),
(2, 'Franz Kafka'),
(3, 'Clarice Lispector'),
(4, 'John Green'),
(5, 'George Orwell');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbgenero`
--

CREATE TABLE `tbgenero` (
  `codGenero` int(11) NOT NULL,
  `genero` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbgenero`
--

INSERT INTO `tbgenero` (`codGenero`, `genero`) VALUES
(1, 'Ação'),
(2, 'Fantasia'),
(3, 'Aventura'),
(4, 'Comédia'),
(5, 'Terror'),
(6, 'Conto');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tblivro`
--

CREATE TABLE `tblivro` (
  `codLivro` int(11) NOT NULL,
  `nomeLivro` varchar(50) NOT NULL,
  `codAutor` int(11) DEFAULT NULL,
  `codGenero` int(11) DEFAULT NULL,
  `anoLancamento` date DEFAULT NULL,
  `edicaoLivro` varchar(50) NOT NULL,
  `statusLivro` varchar(1) NOT NULL,
  `descricaoLivro` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tblivro`
--

INSERT INTO `tblivro` (`codLivro`, `nomeLivro`, `codAutor`, `codGenero`, `anoLancamento`, `edicaoLivro`, `statusLivro`, `descricaoLivro`) VALUES
(3, 'Metamorfose', 2, 5, '1989-06-06', 'Padrão', '1', ''),
(5, 'Um sopro de vida', 3, 6, '1999-07-06', 'Comemorativa', '1', ''),
(7, 'A culpa é das estrelas', 4, 4, '2012-05-15', 'Padrão', '1', ''),
(8, 'A revolução dos bixos', 5, 4, '1945-05-05', 'Padrão', '1', ''),
(9, 'O alienista', 1, 6, '1882-02-08', 'Padrão', '1', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbautor`
--
ALTER TABLE `tbautor`
  ADD PRIMARY KEY (`codAutor`);

--
-- Índices de tabela `tbgenero`
--
ALTER TABLE `tbgenero`
  ADD PRIMARY KEY (`codGenero`);

--
-- Índices de tabela `tblivro`
--
ALTER TABLE `tblivro`
  ADD PRIMARY KEY (`codLivro`),
  ADD KEY `fk_LivroAutor` (`codAutor`),
  ADD KEY `fk_LivroGenero` (`codGenero`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbautor`
--
ALTER TABLE `tbautor`
  MODIFY `codAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbgenero`
--
ALTER TABLE `tbgenero`
  MODIFY `codGenero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tblivro`
--
ALTER TABLE `tblivro`
  MODIFY `codLivro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tblivro`
--
ALTER TABLE `tblivro`
  ADD CONSTRAINT `fk_LivroAutor` FOREIGN KEY (`codAutor`) REFERENCES `tbautor` (`codAutor`),
  ADD CONSTRAINT `fk_LivroGenero` FOREIGN KEY (`codGenero`) REFERENCES `tbgenero` (`codGenero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
