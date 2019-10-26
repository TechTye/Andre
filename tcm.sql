-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 26-Out-2019 às 03:57
-- Versão do servidor: 5.7.26-log
-- versão do PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `tcm`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `cod_agenda` int(11) NOT NULL,
  `horario` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `cod_carrinho` int(11) NOT NULL,
  `cliente_carrinho` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `sobrenome` varchar(50) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `senha` varchar(32) NOT NULL,
  `nivel` int(1) NOT NULL,
  `dta_nasc` date NOT NULL,
  `dta_acesso` datetime NOT NULL,
  `fotoUsuario` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE `comentario` (
  `cliente` int(11) NOT NULL,
  `cod_comentario` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `data_cometario` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE `compra` (
  `cod_compra` int(11) NOT NULL,
  `carrinho` int(11) NOT NULL,
  `data_compra` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `cod_departamento` int(11) NOT NULL,
  `nome_departamento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `departamento`
--

INSERT INTO `departamento` (`cod_departamento`, `nome_departamento`) VALUES
(1, 'plastica'),
(2, 'massagem');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_cliente`
--

CREATE TABLE `endereco_cliente` (
  `cliente` int(11) NOT NULL,
  `cod_endereco` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `tipo_de_logradouro` varchar(7) NOT NULL,
  `numero` mediumint(9) NOT NULL,
  `cep` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_funcionario`
--

CREATE TABLE `endereco_funcionario` (
  `funcionario` int(11) NOT NULL,
  `cod_endereco_funcionario` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `tipo_de_logradouro` varchar(8) NOT NULL,
  `numero` mediumint(9) NOT NULL,
  `cep` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cod_funcionario` int(11) NOT NULL,
  `departamento` int(11) NOT NULL,
  `nome_funcionario` varchar(30) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  `inicio_carga_horaria` time NOT NULL,
  `final_carga_horaria` time NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `descricao_funcionario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_carrinho`
--

CREATE TABLE `item_carrinho` (
  `cod_item` int(11) NOT NULL,
  `plano` int(11) NOT NULL,
  `carrinho` int(11) NOT NULL,
  `qtd` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `cod_pagamento` int(11) NOT NULL,
  `compra` int(11) NOT NULL,
  `tipo_pagamento` int(11) NOT NULL,
  `situacao` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

CREATE TABLE `plano` (
  `cod_plano` int(11) NOT NULL,
  `agenda` int(11) NOT NULL,
  `funcionario` int(11) NOT NULL,
  `nome_plano` varchar(50) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `promocao` decimal(10,2) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `relacionamento_comentario_plano`
--

CREATE TABLE `relacionamento_comentario_plano` (
  `cod_plano_plano` int(11) NOT NULL,
  `cod_comentario_comentario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_cliente`
--

CREATE TABLE `telefone_cliente` (
  `cliente` int(11) NOT NULL,
  `cod_telefone` int(11) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `tipo_de_telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone_funcionario`
--

CREATE TABLE `telefone_funcionario` (
  `funcionario` int(11) NOT NULL,
  `cod_telefone_funcionario` int(11) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `tipo_de_telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pagamento`
--

CREATE TABLE `tipo_pagamento` (
  `cod_tipo_pagamento` int(11) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`cod_agenda`);

--
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`cod_carrinho`,`cliente_carrinho`) USING BTREE,
  ADD KEY `cliente_carrinho` (`cliente_carrinho`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices para tabela `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`cod_comentario`,`cliente`) USING BTREE,
  ADD KEY `cliente` (`cliente`);

--
-- Índices para tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`cod_compra`,`carrinho`) USING BTREE,
  ADD KEY `carrinho` (`carrinho`) USING BTREE;

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`cod_departamento`);

--
-- Índices para tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD PRIMARY KEY (`cod_endereco`,`cliente`) USING BTREE,
  ADD UNIQUE KEY `cliente_2` (`cliente`),
  ADD KEY `cliente` (`cliente`);

--
-- Índices para tabela `endereco_funcionario`
--
ALTER TABLE `endereco_funcionario`
  ADD PRIMARY KEY (`cod_endereco_funcionario`,`funcionario`) USING BTREE,
  ADD UNIQUE KEY `funcionario_2` (`funcionario`),
  ADD KEY `funcionario` (`funcionario`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cod_funcionario`,`departamento`) USING BTREE,
  ADD KEY `departamento` (`departamento`);

--
-- Índices para tabela `item_carrinho`
--
ALTER TABLE `item_carrinho`
  ADD PRIMARY KEY (`cod_item`,`plano`,`carrinho`) USING BTREE,
  ADD KEY `plano` (`plano`),
  ADD KEY `carrinho` (`carrinho`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`cod_pagamento`,`compra`) USING BTREE,
  ADD KEY `compra` (`compra`),
  ADD KEY `tipo_pagamento` (`tipo_pagamento`);

--
-- Índices para tabela `plano`
--
ALTER TABLE `plano`
  ADD PRIMARY KEY (`cod_plano`,`agenda`) USING BTREE,
  ADD KEY `agenda` (`agenda`);

--
-- Índices para tabela `relacionamento_comentario_plano`
--
ALTER TABLE `relacionamento_comentario_plano`
  ADD PRIMARY KEY (`cod_plano_plano`,`cod_comentario_comentario`) USING BTREE,
  ADD KEY `cod_plano_plano` (`cod_plano_plano`),
  ADD KEY `cod_comentario_comentario` (`cod_comentario_comentario`);

--
-- Índices para tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  ADD PRIMARY KEY (`cod_telefone`,`cliente`) USING BTREE,
  ADD KEY `cliente` (`cliente`);

--
-- Índices para tabela `telefone_funcionario`
--
ALTER TABLE `telefone_funcionario`
  ADD PRIMARY KEY (`cod_telefone_funcionario`,`funcionario`) USING BTREE,
  ADD KEY `funcionario` (`funcionario`);

--
-- Índices para tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  ADD PRIMARY KEY (`cod_tipo_pagamento`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `cod_agenda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `cod_carrinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cod_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comentario`
--
ALTER TABLE `comentario`
  MODIFY `cod_comentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `cod_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `cod_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  MODIFY `cod_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco_funcionario`
--
ALTER TABLE `endereco_funcionario`
  MODIFY `cod_endereco_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `cod_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item_carrinho`
--
ALTER TABLE `item_carrinho`
  MODIFY `cod_item` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `cod_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `plano`
--
ALTER TABLE `plano`
  MODIFY `cod_plano` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  MODIFY `cod_telefone` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `telefone_funcionario`
--
ALTER TABLE `telefone_funcionario`
  MODIFY `cod_telefone_funcionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_pagamento`
--
ALTER TABLE `tipo_pagamento`
  MODIFY `cod_tipo_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `fk_cliente_carrinho` FOREIGN KEY (`cliente_carrinho`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_carrinho` FOREIGN KEY (`carrinho`) REFERENCES `carrinho` (`cod_carrinho`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `endereco_cliente`
--
ALTER TABLE `endereco_cliente`
  ADD CONSTRAINT `fk_endereco_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `endereco_funcionario`
--
ALTER TABLE `endereco_funcionario`
  ADD CONSTRAINT `fk_endereco_funcionario` FOREIGN KEY (`funcionario`) REFERENCES `funcionario` (`cod_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_departamento` FOREIGN KEY (`departamento`) REFERENCES `departamento` (`cod_departamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `item_carrinho`
--
ALTER TABLE `item_carrinho`
  ADD CONSTRAINT `fk_item_carrinho` FOREIGN KEY (`carrinho`) REFERENCES `carrinho` (`cod_carrinho`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_item_plano` FOREIGN KEY (`plano`) REFERENCES `plano` (`cod_plano`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `fk_compra_pagamento` FOREIGN KEY (`compra`) REFERENCES `compra` (`cod_compra`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tipo_pagamento` FOREIGN KEY (`tipo_pagamento`) REFERENCES `tipo_pagamento` (`cod_tipo_pagamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `plano`
--
ALTER TABLE `plano`
  ADD CONSTRAINT `fk_plano_agenda` FOREIGN KEY (`agenda`) REFERENCES `agenda` (`cod_agenda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `relacionamento_comentario_plano`
--
ALTER TABLE `relacionamento_comentario_plano`
  ADD CONSTRAINT `fk_comentario_associacao` FOREIGN KEY (`cod_comentario_comentario`) REFERENCES `comentario` (`cod_comentario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_plano_associacao` FOREIGN KEY (`cod_plano_plano`) REFERENCES `plano` (`cod_plano`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `telefone_cliente`
--
ALTER TABLE `telefone_cliente`
  ADD CONSTRAINT `fk_telefone_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`cod_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `telefone_funcionario`
--
ALTER TABLE `telefone_funcionario`
  ADD CONSTRAINT `fk_telefone_funcionario` FOREIGN KEY (`funcionario`) REFERENCES `funcionario` (`cod_funcionario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
