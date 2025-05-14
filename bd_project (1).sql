-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/05/2025 às 15:20
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_project`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `cpf` int(16) NOT NULL,
  `rm` int(16) DEFAULT NULL,
  `nome` varchar(266) DEFAULT NULL,
  `turmas_id` int(26) DEFAULT NULL,
  `projetos_id` int(26) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`cpf`, `rm`, `nome`, `turmas_id`, `projetos_id`) VALUES
(1112, 8251, 'Ana Souza', 5, 9),
(1231, 9490, 'Daniela Torres', 2, 9),
(1234, 4689, 'João Silva', 3, 7),
(1265, 2939, 'Marcelo Gonçalves', 5, 7),
(2223, 4376, 'Luiza Martins', 4, 1),
(2342, 3249, 'Renata Barros', 2, 3),
(3213, 2947, 'Henrique Lopes', 6, 6),
(3335, 5047, 'Gabriel Almeida', 7, 8),
(4445, 7293, 'Bruno Santos', 6, 8),
(4564, 8495, 'Lucas Rocha', 3, 1),
(5435, 6943, 'André Monteiro', 6, 1),
(5556, 7389, 'Carlos Pereira', 7, 3),
(6546, 9128, 'Juliana Araújo', 1, 8),
(6667, 3738, 'Rafaela Costa', 5, 3),
(7778, 5672, 'Carla Mendes', 3, 5),
(7897, 7385, 'Camila Freitas', 4, 5),
(8889, 4732, 'Pedro Henrique', 1, 7),
(8907, 2837, 'Patrícia Ribeiro', 7, 9),
(9876, 1902, 'Maria Oliveira', 1, 5),
(9998, 3758, 'Fernanda Lima', 2, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `cursos_id` int(11) NOT NULL,
  `nomes` varchar(88) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`cursos_id`, `nomes`) VALUES
(1, 'Engenharia de Software'),
(2, 'Gestão de Projetos'),
(3, 'Marketing Digital'),
(4, 'Ciência de Dados'),
(5, 'Administração');

-- --------------------------------------------------------

--
-- Estrutura para tabela `projetos`
--

CREATE TABLE `projetos` (
  `projetos_id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `projetos`
--

INSERT INTO `projetos` (`projetos_id`, `titulo`) VALUES
(1, 'Projeto de Energia Solar'),
(2, 'Robótica Avançada'),
(3, 'Desenvolvimento de Aplicativos'),
(4, 'Plataforma de E-commerce'),
(5, 'Análise de Big Data'),
(6, 'Sistema de Gestão Escolar'),
(7, 'Automação Residencial'),
(8, 'Monitoramento Ambiental'),
(9, 'Reconhecimento Facial');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `turmas_id` int(11) NOT NULL,
  `serie` int(11) DEFAULT NULL,
  `cursos_id` int(11) DEFAULT NULL,
  `projetos_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`turmas_id`, `serie`, `cursos_id`, `projetos_id`) VALUES
(1, 2, 4, 7),
(2, 1, 3, 6),
(3, 1, 2, 5),
(4, 3, 4, 1),
(5, 3, 1, 3),
(6, 2, 2, 8),
(7, 4, 5, 9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turnos`
--

CREATE TABLE `turnos` (
  `turnos_id` int(11) NOT NULL,
  `periodo` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turnos`
--

INSERT INTO `turnos` (`turnos_id`, `periodo`) VALUES
(1, 'Noite'),
(2, 'Madru'),
(3, 'Manhã'),
(4, 'Tarde');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `turmas_id` (`turmas_id`),
  ADD KEY `projetos_id` (`projetos_id`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`cursos_id`);

--
-- Índices de tabela `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`projetos_id`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`turmas_id`),
  ADD KEY `cursos_id` (`cursos_id`),
  ADD KEY `projetos_id` (`projetos_id`);
  ADD KEY 'turnos_id' ('turnos_id');

--
-- Índices de tabela `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`turnos_id`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`turmas_id`) REFERENCES `turmas` (`turmas_id`),
  ADD CONSTRAINT `alunos_ibfk_2` FOREIGN KEY (`projetos_id`) REFERENCES `projetos` (`projetos_id`);

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`cursos_id`),
  ADD CONSTRAINT `turmas_ibfk_2` FOREIGN KEY (`projetos_id`) REFERENCES `projetos` (`projetos_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
