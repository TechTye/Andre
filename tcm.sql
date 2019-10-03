-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 03-Out-2019 às 21:06
-- Versão do servidor: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tcm`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `cod_agenda` int(11) NOT NULL,
  `horario_agendado` datetime NOT NULL,
  `funcionario` int(11) NOT NULL,
  `plano` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `cod_carrinho` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `plano` int(11) NOT NULL,
  `horario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cod_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `nivel` int(1) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `dta_acesso` datetime NOT NULL,
  `dta_nasc` date NOT NULL,
  `senha` varchar(32) NOT NULL,
  `fotoCliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `cod_compra` int(11) NOT NULL,
  `carrinho` int(11) NOT NULL,
  `situacao` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dapartamento`
--

CREATE TABLE `dapartamento` (
  `cod_departamento` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `dapartamento`
--

INSERT INTO `dapartamento` (`cod_departamento`, `nome`) VALUES
(7, 'limpeza');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_cliente`
--

CREATE TABLE `endereco_cliente` (
  `cod_endereco` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `logradouro` varchar(70) NOT NULL,
  `numero` int(11) NOT NULL,
  `tipo_de_logradouro` varchar(2) NOT NULL,
  `cep` int(8) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_funcionario`
--

CREATE TABLE `endereco_funcionario` (
  `cod_endereco` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cidade` varchar(35) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `tipo_de_logradouro` varchar(2) NOT NULL,
  `cep` int(8) NOT NULL,
  `numero` int(15) NOT NULL,
  `funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `cod_funcionario` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `cargo_func` varchar(50) NOT NULL,
  `departamento` int(11) NOT NULL,
  `inicio_carga_hora` time NOT NULL,
  `fim_carga_hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `cod_pagamento` int(11) NOT NULL,
  `compras` int(11) NOT NULL,
  `desc_pagamento` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `planos`
--

CREATE TABLE `planos` (
  `cod_plano` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descricao` text NOT NULL,
  `funcionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `cod_telefone` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `telefone` int(13) NOT NULL,
  `tipo_de_telefone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_funcionario`
--

CREATE TABLE `telefone_funcionario` (
  `cod_telefone` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `tefone` int(15) NOT NULL,
  `tipo_de_telefone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`cod_agenda`),
  ADD UNIQUE KEY `horario_agendado` (`horario_agendado`),
  ADD KEY `plano` (`plano`),
  ADD KEY `funcionario` (`funcionario`);

--
-- Indexes for table `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`cod_carrinho`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `plano` (`plano`),
  ADD KEY `horario` (`horario`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`cod_compra`),
  ADD KEY `carrinho` (`carrinho`);

--
-- Indexes for table `dapartamento`
--
ALTER TABLE `dapartamento`
  ADD PRIMARY KEY (`cod_departamento`);

--
-- Indexes for table `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD PRIMARY KEY (`cod_endereco`) USING BTREE,
  ADD UNIQUE KEY `cliente` (`cliente`),
  ADD KEY `cod_cliente` (`cliente`);

--
-- Indexes for table `endereco_funcionario`
--
ALTER TABLE `endereco_funcionario`
  ADD PRIMARY KEY (`cod_endereco`),
  ADD UNIQUE KEY `funcionario_2` (`funcionario`),
  ADD KEY `funcionario` (`funcionario`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`cod_funcionario`),
  ADD KEY `departamento` (`departamento`);

--
-- Indexes for table `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`cod_pagamento`),
  ADD KEY `compras` (`compras`);

--
-- Indexes for table `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`cod_plano`),
  ADD KEY `funcionario` (`funcionario`);

--
-- Indexes for table `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`cod_telefone`),
  ADD KEY `cod_cliente` (`cliente`);

--
-- Indexes for table `telefone_funcionario`
--
ALTER TABLE `telefone_funcionario`
  ADD PRIMARY KEY (`cod_telefone`),
  ADD KEY `funcionario` (`funcionario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `cod_agenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `cod_carrinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `cod_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dapartamento`
--
ALTER TABLE `dapartamento`
  MODIFY `cod_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  MODIFY `cod_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `endereco_funcionario`
--
ALTER TABLE `endereco_funcionario`
  MODIFY `cod_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `cod_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `cod_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planos`
--
ALTER TABLE `planos`
  MODIFY `cod_plano` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telefone`
--
ALTER TABLE `telefone`
  MODIFY `cod_telefone` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `telefone_funcionario`
--
ALTER TABLE `telefone_funcionario`
  MODIFY `cod_telefone` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `fk_agenda_func` FOREIGN KEY (`funcionario`) REFERENCES `funcionarios` (`cod_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_agenda_plano` FOREIGN KEY (`plano`) REFERENCES `planos` (`cod_plano`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `fk_cliente_carrinho` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_horario_carrinho` FOREIGN KEY (`horario`) REFERENCES `agenda` (`cod_agenda`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_plano_carrinho` FOREIGN KEY (`plano`) REFERENCES `planos` (`cod_plano`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_carrinho_compras` FOREIGN KEY (`carrinho`) REFERENCES `carrinho` (`cod_carrinho`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD CONSTRAINT `fk_enderecoCliente` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `endereco_funcionario`
--
ALTER TABLE `endereco_funcionario`
  ADD CONSTRAINT `fk_endereco_func` FOREIGN KEY (`funcionario`) REFERENCES `funcionarios` (`cod_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `fk_departamento` FOREIGN KEY (`departamento`) REFERENCES `dapartamento` (`cod_departamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `fk_compra_cliente` FOREIGN KEY (`compras`) REFERENCES `compras` (`cod_compra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `planos`
--
ALTER TABLE `planos`
  ADD CONSTRAINT `fk_plano_func` FOREIGN KEY (`funcionario`) REFERENCES `funcionarios` (`cod_funcionario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `fk_tefoneCliente` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `telefone_funcionario`
--
ALTER TABLE `telefone_funcionario`
  ADD CONSTRAINT `fk_telefone_func` FOREIGN KEY (`funcionario`) REFERENCES `funcionarios` (`cod_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
