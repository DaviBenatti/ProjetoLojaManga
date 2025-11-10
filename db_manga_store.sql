-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 09-Nov-2025 às 23:59
-- Versão do servidor: 5.6.13
-- versão do PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `db_manga_store`
--
CREATE DATABASE IF NOT EXISTS `db_manga_store` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_manga_store`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarAttackOnTitan`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 34; -- Total de volumes da série completa
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 36.90; -- Preço médio (ajuste se precisar)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Hajime Isayama';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Attack on Titan' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Attack on Titan', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarBerserk`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 42; -- Total de volumes atuais
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 44.90; -- Preço da sua tabela
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 2;       -- ID da JBC (confirme se é 2)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Kentaro Miura';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Berserk' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Berserk', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarBlackClover`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 34; -- Total de volumes atuais no Brasil
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 36.90; -- Preço médio (ajuste se precisar)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Yūki Tabata';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Black Clover' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Black Clover', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarBleachRemix`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 26; -- Bleach Remix tem 26 volumes
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 64.00; -- Preço do seu banco
    DECLARE v_estoque INT DEFAULT 50;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Tite Kubo';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Bleach Remix' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Bleach Remix', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarChainsawMan`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 16; -- Total de volumes atuais
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 33.00; -- Preço do seu banco
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Tatsuki Fujimoto';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Chainsaw Man' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Chainsaw Man', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarDandadan`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 16; -- Total de volumes atuais
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 36.90; -- Preço atual da Panini (confira)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Yukinobu Tatsu';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Dandadan' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Dandadan', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarDemonSlayer`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 23; -- Total de volumes da série completa
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 36.90; -- Preço médio (ajuste se precisar)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Koyoharu Gotouge';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Demon Slayer' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Demon Slayer', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarDragonBall`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 42; -- Total de volumes da série clássica
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 43.00; -- Preço da sua tabela
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Akira Toriyama';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Dragon Ball' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Dragon Ball', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarFairyTail`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 63; -- Total de volumes da série completa
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 34.90; -- Preço médio (ajuste se precisar)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 2;       -- ID da JBC (confirme se é 2)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Hiro Mashima';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Fairy Tail' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Fairy Tail', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarFullmetalAlchemist`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 27; -- Total de volumes da série completa
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 34.90; -- Preço médio (ajuste se precisar)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 2;       -- ID da JBC (confirme se é 2)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Hiromu Arakawa';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Fullmetal Alchemist' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Fullmetal Alchemist', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarHunterXHunter`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 37; -- Total de volumes atuais
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 43.00; -- Preço da sua tabela
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Yoshihiro Togashi';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Hunter x Hunter' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Hunter x Hunter', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarJojosBizarreAdventure`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 131; -- Total de volumes (Partes 1-8)
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 36.90; -- Preço médio (ajuste se precisar)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Hirohiko Araki';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE (Note o '' no nome)
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Jojo''s Bizarre Adventure' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (Note o '' no nome)
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Jojo''s Bizarre Adventure', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarJujutsuKaisen`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 26; -- Total de volumes atuais no Brasil
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 30.00; -- Preço da sua tabela
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Gege Akutami';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Jujutsu Kaisen' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Jujutsu Kaisen', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarMyHeroAcademia`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 39; -- Total de volumes atuais no Brasil
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 29.90; -- Preço que tínhamos no banco
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 2;       -- ID da JBC (confirme se é 2)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Kohei Horikoshi';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'My Hero Academia' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('My Hero Academia', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarNaruto`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 72; -- Total de volumes da série
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 49.90; -- Preço do "Naruto Gold"
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Masashi Kishimoto';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Naruto Gold' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Naruto Gold', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarOnePiece`()
BEGIN
    -- --- Configurações ---
    DECLARE v_max_volume INT DEFAULT 108; 
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 34.90;
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;
    DECLARE v_autor VARCHAR(150) DEFAULT 'Eiichiro Oda';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- AQUI ESTÁ A NOVA LÓGICA (MUITO MAIS SEGURA):
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'One Piece' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('One Piece', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarSevenDeadlySins`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 41; -- Total de volumes da série completa
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 34.90; -- Preço médio (ajuste se precisar)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 2;       -- ID da JBC (confirme se é 2)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Nakaba Suzuki';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'The Seven Deadly Sins' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('The Seven Deadly Sins', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarVagabond`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 37; -- Total de volumes atuais
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 49.90; -- Preço da sua tabela
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 4;       -- ID da Devir (confirme se é 4)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Takehiko Inoue';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Vagabond' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Vagabond', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarVanitas`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 11; -- Total de volumes atuais no Brasil
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 36.90; -- Preço médio (ajuste se precisar)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Jun Mochizuki';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Vanitas no Carte' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Vanitas no Carte', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AdicionarVinlandSaga`()
BEGIN
    -- --- Configurações (Ajuste se necessário) ---
    DECLARE v_max_volume INT DEFAULT 28; -- Total de volumes atuais
    DECLARE v_preco DECIMAL(10, 2) DEFAULT 36.90; -- Preço médio (ajuste se precisar)
    DECLARE v_estoque INT DEFAULT 0;
    DECLARE v_estoque_minimo INT DEFAULT 5;
    DECLARE v_fornecedor_id INT DEFAULT 1;       -- ID da Panini (confirme se é 1)
    DECLARE v_autor VARCHAR(150) DEFAULT 'Makoto Yukimura';
    DECLARE v_counter INT DEFAULT 1;
    
    WHILE v_counter <= v_max_volume DO
    
        -- 1. Verifica se o item JÁ EXISTE
        IF NOT EXISTS (SELECT 1 FROM mangas WHERE titulo = 'Vinland Saga' AND volume = v_counter) THEN
        
            -- 2. Se NÃO existir, faz um INSERT simples (usando sua coluna 'preco')
            INSERT INTO mangas (titulo, autor, volume, preco, quantidade_estoque, estoque_minimo, fornecedor_id_fk)
            VALUES ('Vinland Saga', v_autor, v_counter, v_preco, v_estoque, v_estoque_minimo, v_fornecedor_id);
            
        END IF;
        
        -- 3. Incrementa o contador
        SET v_counter = v_counter + 1;
        
    END WHILE;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE IF NOT EXISTS `fornecedores` (
  `fornecedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fornecedor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `fornecedores`
--

INSERT INTO `fornecedores` (`fornecedor_id`, `nome`, `telefone`, `email`) VALUES
(1, 'Panini', '(11) 91127-6420', 'contato@panini.com.br'),
(2, 'JBC', '(11) 98349-5495', 'contato@jbc.com.br'),
(3, 'NewPOP Editora', '(11) 95083-4241', 'contato@newpop.com.br'),
(4, 'Editora Devir', '(11) 92364-8580', 'contato@devir.com.br');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mangas`
--

CREATE TABLE IF NOT EXISTS `mangas` (
  `manga_id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `volume` int(11) DEFAULT NULL,
  `autor` varchar(150) DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade_estoque` int(11) NOT NULL DEFAULT '0',
  `estoque_minimo` int(11) NOT NULL DEFAULT '0',
  `fornecedor_id_fk` int(11) DEFAULT NULL,
  PRIMARY KEY (`manga_id`),
  KEY `fornecedor_id_fk` (`fornecedor_id_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=854 ;

--
-- Extraindo dados da tabela `mangas`
--

INSERT INTO `mangas` (`manga_id`, `titulo`, `volume`, `autor`, `preco`, `quantidade_estoque`, `estoque_minimo`, `fornecedor_id_fk`) VALUES
(1, 'One Piece', 1, 'Eiichiro Oda', '35.00', 50, 30, 1),
(2, 'Jujutsu Kaisen', 5, 'Gege Akutami', '30.00', 49, 30, 1),
(3, 'Chainsaw Man', 11, 'Tatsuki Fujimoto', '33.00', 5, 30, 2),
(4, 'One Piece', 4, 'Eiichiro Oda', '32.00', 50, 50, 1),
(5, 'Hunter X Hunter', 1, 'Yoshihiro Togashi', '43.00', 29, 50, 2),
(6, 'Dragon Ball', 3, 'Akira Toriyama', '43.00', 70, 50, 1),
(7, 'Bleach Remix', 1, 'Tite Kubo', '64.00', 50, 30, 1),
(8, 'Vagabond', 1, 'Takehiko Inoue', '34.36', 40, 30, 1),
(9, 'Vagabond', 2, 'Takehiko Inoue', '34.36', 50, 30, 1),
(10, 'One Piece', 2, 'Eiichiro Oda', '34.90', 50, 5, 1),
(11, 'One Piece', 3, 'Eiichiro Oda', '34.90', 50, 5, 1),
(12, 'One Piece', 5, 'Eiichiro Oda', '34.90', 50, 5, 1),
(13, 'One Piece', 6, 'Eiichiro Oda', '34.90', 50, 5, 1),
(14, 'One Piece', 7, 'Eiichiro Oda', '34.90', 50, 5, 1),
(15, 'One Piece', 8, 'Eiichiro Oda', '34.90', 50, 5, 1),
(16, 'One Piece', 9, 'Eiichiro Oda', '34.90', 50, 5, 1),
(17, 'One Piece', 10, 'Eiichiro Oda', '34.90', 50, 5, 1),
(18, 'One Piece', 11, 'Eiichiro Oda', '34.90', 50, 5, 1),
(19, 'One Piece', 12, 'Eiichiro Oda', '34.90', 50, 5, 1),
(20, 'One Piece', 13, 'Eiichiro Oda', '34.90', 50, 5, 1),
(21, 'One Piece', 14, 'Eiichiro Oda', '34.90', 50, 5, 1),
(22, 'One Piece', 15, 'Eiichiro Oda', '34.90', 50, 5, 1),
(23, 'One Piece', 16, 'Eiichiro Oda', '34.90', 50, 5, 1),
(24, 'One Piece', 17, 'Eiichiro Oda', '34.90', 50, 5, 1),
(25, 'One Piece', 18, 'Eiichiro Oda', '34.90', 50, 5, 1),
(26, 'One Piece', 19, 'Eiichiro Oda', '34.90', 50, 5, 1),
(27, 'One Piece', 20, 'Eiichiro Oda', '34.90', 50, 5, 1),
(28, 'One Piece', 21, 'Eiichiro Oda', '34.90', 50, 5, 1),
(29, 'One Piece', 22, 'Eiichiro Oda', '34.90', 50, 5, 1),
(30, 'One Piece', 23, 'Eiichiro Oda', '34.90', 50, 5, 1),
(31, 'One Piece', 24, 'Eiichiro Oda', '34.90', 50, 5, 1),
(32, 'One Piece', 25, 'Eiichiro Oda', '34.90', 50, 5, 1),
(33, 'One Piece', 26, 'Eiichiro Oda', '34.90', 50, 5, 1),
(34, 'One Piece', 27, 'Eiichiro Oda', '34.90', 50, 5, 1),
(35, 'One Piece', 28, 'Eiichiro Oda', '34.90', 50, 5, 1),
(36, 'One Piece', 29, 'Eiichiro Oda', '34.90', 50, 5, 1),
(37, 'One Piece', 30, 'Eiichiro Oda', '34.90', 50, 5, 1),
(38, 'One Piece', 31, 'Eiichiro Oda', '34.90', 50, 5, 1),
(39, 'One Piece', 32, 'Eiichiro Oda', '34.90', 50, 5, 1),
(40, 'One Piece', 33, 'Eiichiro Oda', '34.90', 50, 5, 1),
(41, 'One Piece', 34, 'Eiichiro Oda', '34.90', 50, 5, 1),
(42, 'One Piece', 35, 'Eiichiro Oda', '34.90', 50, 5, 1),
(43, 'One Piece', 36, 'Eiichiro Oda', '34.90', 50, 5, 1),
(44, 'One Piece', 37, 'Eiichiro Oda', '34.90', 50, 5, 1),
(45, 'One Piece', 38, 'Eiichiro Oda', '34.90', 50, 5, 1),
(46, 'One Piece', 39, 'Eiichiro Oda', '34.90', 50, 5, 1),
(47, 'One Piece', 40, 'Eiichiro Oda', '34.90', 50, 5, 1),
(48, 'One Piece', 41, 'Eiichiro Oda', '34.90', 50, 5, 1),
(49, 'One Piece', 42, 'Eiichiro Oda', '34.90', 50, 5, 1),
(50, 'One Piece', 43, 'Eiichiro Oda', '34.90', 50, 5, 1),
(51, 'One Piece', 44, 'Eiichiro Oda', '34.90', 50, 5, 1),
(52, 'One Piece', 45, 'Eiichiro Oda', '34.90', 50, 5, 1),
(53, 'One Piece', 46, 'Eiichiro Oda', '34.90', 50, 5, 1),
(54, 'One Piece', 47, 'Eiichiro Oda', '34.90', 50, 5, 1),
(55, 'One Piece', 48, 'Eiichiro Oda', '34.90', 50, 5, 1),
(56, 'One Piece', 49, 'Eiichiro Oda', '34.90', 50, 5, 1),
(57, 'One Piece', 50, 'Eiichiro Oda', '34.90', 50, 5, 1),
(58, 'One Piece', 51, 'Eiichiro Oda', '34.90', 50, 5, 1),
(59, 'One Piece', 52, 'Eiichiro Oda', '34.90', 50, 5, 1),
(60, 'One Piece', 53, 'Eiichiro Oda', '34.90', 50, 5, 1),
(61, 'One Piece', 54, 'Eiichiro Oda', '34.90', 50, 5, 1),
(62, 'One Piece', 55, 'Eiichiro Oda', '34.90', 50, 5, 1),
(63, 'One Piece', 56, 'Eiichiro Oda', '34.90', 50, 5, 1),
(64, 'One Piece', 57, 'Eiichiro Oda', '34.90', 50, 5, 1),
(65, 'One Piece', 58, 'Eiichiro Oda', '34.90', 50, 5, 1),
(66, 'One Piece', 59, 'Eiichiro Oda', '34.90', 50, 5, 1),
(67, 'One Piece', 60, 'Eiichiro Oda', '34.90', 50, 5, 1),
(68, 'One Piece', 61, 'Eiichiro Oda', '34.90', 50, 5, 1),
(69, 'One Piece', 62, 'Eiichiro Oda', '34.90', 50, 5, 1),
(70, 'One Piece', 63, 'Eiichiro Oda', '34.90', 50, 5, 1),
(71, 'One Piece', 64, 'Eiichiro Oda', '34.90', 50, 5, 1),
(72, 'One Piece', 65, 'Eiichiro Oda', '34.90', 50, 5, 1),
(73, 'One Piece', 66, 'Eiichiro Oda', '34.90', 50, 5, 1),
(74, 'One Piece', 67, 'Eiichiro Oda', '34.90', 50, 5, 1),
(75, 'One Piece', 68, 'Eiichiro Oda', '34.90', 50, 5, 1),
(76, 'One Piece', 69, 'Eiichiro Oda', '34.90', 50, 5, 1),
(77, 'One Piece', 70, 'Eiichiro Oda', '34.90', 50, 5, 1),
(78, 'One Piece', 71, 'Eiichiro Oda', '34.90', 50, 5, 1),
(79, 'One Piece', 72, 'Eiichiro Oda', '34.90', 50, 5, 1),
(80, 'One Piece', 73, 'Eiichiro Oda', '34.90', 50, 5, 1),
(81, 'One Piece', 74, 'Eiichiro Oda', '34.90', 50, 5, 1),
(82, 'One Piece', 75, 'Eiichiro Oda', '34.90', 50, 5, 1),
(83, 'One Piece', 76, 'Eiichiro Oda', '34.90', 50, 5, 1),
(84, 'One Piece', 77, 'Eiichiro Oda', '34.90', 50, 5, 1),
(85, 'One Piece', 78, 'Eiichiro Oda', '34.90', 50, 5, 1),
(86, 'One Piece', 79, 'Eiichiro Oda', '34.90', 50, 5, 1),
(87, 'One Piece', 80, 'Eiichiro Oda', '34.90', 50, 5, 1),
(88, 'One Piece', 81, 'Eiichiro Oda', '34.90', 50, 5, 1),
(89, 'One Piece', 82, 'Eiichiro Oda', '34.90', 50, 5, 1),
(90, 'One Piece', 83, 'Eiichiro Oda', '34.90', 50, 5, 1),
(91, 'One Piece', 84, 'Eiichiro Oda', '34.90', 50, 5, 1),
(92, 'One Piece', 85, 'Eiichiro Oda', '34.90', 50, 5, 1),
(93, 'One Piece', 86, 'Eiichiro Oda', '34.90', 50, 5, 1),
(94, 'One Piece', 87, 'Eiichiro Oda', '34.90', 50, 5, 1),
(95, 'One Piece', 88, 'Eiichiro Oda', '34.90', 50, 5, 1),
(96, 'One Piece', 89, 'Eiichiro Oda', '34.90', 50, 5, 1),
(97, 'One Piece', 90, 'Eiichiro Oda', '34.90', 50, 5, 1),
(98, 'One Piece', 91, 'Eiichiro Oda', '34.90', 50, 5, 1),
(99, 'One Piece', 92, 'Eiichiro Oda', '34.90', 50, 5, 1),
(100, 'One Piece', 93, 'Eiichiro Oda', '34.90', 50, 5, 1),
(101, 'One Piece', 94, 'Eiichiro Oda', '34.90', 50, 5, 1),
(102, 'One Piece', 95, 'Eiichiro Oda', '34.90', 50, 5, 1),
(103, 'One Piece', 96, 'Eiichiro Oda', '34.90', 50, 5, 1),
(104, 'One Piece', 97, 'Eiichiro Oda', '34.90', 50, 5, 1),
(105, 'One Piece', 98, 'Eiichiro Oda', '34.90', 50, 5, 1),
(106, 'One Piece', 99, 'Eiichiro Oda', '34.90', 50, 5, 1),
(107, 'One Piece', 100, 'Eiichiro Oda', '34.90', 50, 5, 1),
(108, 'One Piece', 101, 'Eiichiro Oda', '34.90', 50, 5, 1),
(109, 'One Piece', 102, 'Eiichiro Oda', '34.90', 50, 5, 1),
(110, 'One Piece', 103, 'Eiichiro Oda', '34.90', 50, 5, 1),
(111, 'One Piece', 104, 'Eiichiro Oda', '34.90', 50, 5, 1),
(112, 'One Piece', 105, 'Eiichiro Oda', '34.90', 50, 5, 1),
(113, 'One Piece', 106, 'Eiichiro Oda', '34.90', 50, 5, 1),
(114, 'One Piece', 107, 'Eiichiro Oda', '34.90', 50, 5, 1),
(115, 'One Piece', 108, 'Eiichiro Oda', '34.90', 50, 5, 1),
(116, 'Bleach Remix', 2, 'Tite Kubo', '64.00', 50, 5, 1),
(117, 'Bleach Remix', 3, 'Tite Kubo', '64.00', 50, 5, 1),
(118, 'Bleach Remix', 4, 'Tite Kubo', '64.00', 50, 5, 1),
(119, 'Bleach Remix', 5, 'Tite Kubo', '64.00', 50, 5, 1),
(120, 'Bleach Remix', 6, 'Tite Kubo', '64.00', 50, 5, 1),
(121, 'Bleach Remix', 7, 'Tite Kubo', '64.00', 50, 5, 1),
(122, 'Bleach Remix', 8, 'Tite Kubo', '64.00', 50, 5, 1),
(123, 'Bleach Remix', 9, 'Tite Kubo', '64.00', 50, 5, 1),
(124, 'Bleach Remix', 10, 'Tite Kubo', '64.00', 50, 5, 1),
(125, 'Bleach Remix', 11, 'Tite Kubo', '64.00', 50, 5, 1),
(126, 'Bleach Remix', 12, 'Tite Kubo', '64.00', 50, 5, 1),
(127, 'Bleach Remix', 13, 'Tite Kubo', '64.00', 50, 5, 1),
(128, 'Bleach Remix', 14, 'Tite Kubo', '64.00', 50, 5, 1),
(129, 'Bleach Remix', 15, 'Tite Kubo', '64.00', 50, 5, 1),
(130, 'Bleach Remix', 16, 'Tite Kubo', '64.00', 50, 5, 1),
(131, 'Bleach Remix', 17, 'Tite Kubo', '64.00', 50, 5, 1),
(132, 'Bleach Remix', 18, 'Tite Kubo', '64.00', 50, 5, 1),
(133, 'Bleach Remix', 19, 'Tite Kubo', '64.00', 50, 5, 1),
(134, 'Bleach Remix', 20, 'Tite Kubo', '64.00', 50, 5, 1),
(135, 'Bleach Remix', 21, 'Tite Kubo', '64.00', 50, 5, 1),
(136, 'Bleach Remix', 22, 'Tite Kubo', '64.00', 50, 5, 1),
(137, 'Bleach Remix', 23, 'Tite Kubo', '64.00', 50, 5, 1),
(138, 'Bleach Remix', 24, 'Tite Kubo', '64.00', 50, 5, 1),
(139, 'Bleach Remix', 25, 'Tite Kubo', '64.00', 50, 5, 1),
(140, 'Bleach Remix', 26, 'Tite Kubo', '64.00', 50, 5, 1),
(141, 'Chainsaw Man', 1, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(142, 'Chainsaw Man', 2, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(143, 'Chainsaw Man', 3, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(144, 'Chainsaw Man', 4, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(145, 'Chainsaw Man', 5, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(146, 'Chainsaw Man', 6, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(147, 'Chainsaw Man', 7, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(148, 'Chainsaw Man', 8, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(149, 'Chainsaw Man', 9, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(150, 'Chainsaw Man', 10, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(151, 'Chainsaw Man', 12, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(152, 'Chainsaw Man', 13, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(153, 'Chainsaw Man', 14, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(154, 'Chainsaw Man', 15, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(155, 'Chainsaw Man', 16, 'Tatsuki Fujimoto', '33.00', 0, 5, 1),
(156, 'Dandadan', 1, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(157, 'Dandadan', 2, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(158, 'Dandadan', 3, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(159, 'Dandadan', 4, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(160, 'Dandadan', 5, 'Yukinobu Tatsu', '36.90', 50, 5, 1),
(161, 'Dandadan', 6, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(162, 'Dandadan', 7, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(163, 'Dandadan', 8, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(164, 'Dandadan', 9, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(165, 'Dandadan', 10, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(166, 'Dandadan', 11, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(167, 'Dandadan', 12, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(168, 'Dandadan', 13, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(169, 'Dandadan', 14, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(170, 'Dandadan', 15, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(171, 'Dandadan', 16, 'Yukinobu Tatsu', '36.90', 0, 5, 1),
(172, 'Naruto Gold', 1, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(173, 'Naruto Gold', 2, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(174, 'Naruto Gold', 3, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(175, 'Naruto Gold', 4, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(176, 'Naruto Gold', 5, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(177, 'Naruto Gold', 6, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(178, 'Naruto Gold', 7, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(179, 'Naruto Gold', 8, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(180, 'Naruto Gold', 9, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(181, 'Naruto Gold', 10, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(182, 'Naruto Gold', 11, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(183, 'Naruto Gold', 12, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(184, 'Naruto Gold', 13, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(185, 'Naruto Gold', 14, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(186, 'Naruto Gold', 15, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(187, 'Naruto Gold', 16, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(188, 'Naruto Gold', 17, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(189, 'Naruto Gold', 18, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(190, 'Naruto Gold', 19, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(191, 'Naruto Gold', 20, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(192, 'Naruto Gold', 21, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(193, 'Naruto Gold', 22, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(194, 'Naruto Gold', 23, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(195, 'Naruto Gold', 24, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(196, 'Naruto Gold', 25, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(197, 'Naruto Gold', 26, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(198, 'Naruto Gold', 27, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(199, 'Naruto Gold', 28, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(200, 'Naruto Gold', 29, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(201, 'Naruto Gold', 30, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(202, 'Naruto Gold', 31, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(203, 'Naruto Gold', 32, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(204, 'Naruto Gold', 33, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(205, 'Naruto Gold', 34, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(206, 'Naruto Gold', 35, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(207, 'Naruto Gold', 36, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(208, 'Naruto Gold', 37, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(209, 'Naruto Gold', 38, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(210, 'Naruto Gold', 39, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(211, 'Naruto Gold', 40, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(212, 'Naruto Gold', 41, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(213, 'Naruto Gold', 42, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(214, 'Naruto Gold', 43, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(215, 'Naruto Gold', 44, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(216, 'Naruto Gold', 45, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(217, 'Naruto Gold', 46, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(218, 'Naruto Gold', 47, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(219, 'Naruto Gold', 48, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(220, 'Naruto Gold', 49, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(221, 'Naruto Gold', 50, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(222, 'Naruto Gold', 51, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(223, 'Naruto Gold', 52, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(224, 'Naruto Gold', 53, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(225, 'Naruto Gold', 54, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(226, 'Naruto Gold', 55, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(227, 'Naruto Gold', 56, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(228, 'Naruto Gold', 57, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(229, 'Naruto Gold', 58, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(230, 'Naruto Gold', 59, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(231, 'Naruto Gold', 60, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(232, 'Naruto Gold', 61, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(233, 'Naruto Gold', 62, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(234, 'Naruto Gold', 63, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(235, 'Naruto Gold', 64, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(236, 'Naruto Gold', 65, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(237, 'Naruto Gold', 66, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(238, 'Naruto Gold', 67, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(239, 'Naruto Gold', 68, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(240, 'Naruto Gold', 69, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(241, 'Naruto Gold', 70, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(242, 'Naruto Gold', 71, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(243, 'Naruto Gold', 72, 'Masashi Kishimoto', '49.90', 0, 5, 1),
(244, 'Dragon Ball', 1, 'Akira Toriyama', '43.00', 0, 5, 1),
(245, 'Dragon Ball', 2, 'Akira Toriyama', '43.00', 0, 5, 1),
(246, 'Dragon Ball', 4, 'Akira Toriyama', '43.00', 0, 5, 1),
(247, 'Dragon Ball', 5, 'Akira Toriyama', '43.00', 0, 5, 1),
(248, 'Dragon Ball', 6, 'Akira Toriyama', '43.00', 0, 5, 1),
(249, 'Dragon Ball', 7, 'Akira Toriyama', '43.00', 0, 5, 1),
(250, 'Dragon Ball', 8, 'Akira Toriyama', '43.00', 0, 5, 1),
(251, 'Dragon Ball', 9, 'Akira Toriyama', '43.00', 0, 5, 1),
(252, 'Dragon Ball', 10, 'Akira Toriyama', '43.00', 0, 5, 1),
(253, 'Dragon Ball', 11, 'Akira Toriyama', '43.00', 0, 5, 1),
(254, 'Dragon Ball', 12, 'Akira Toriyama', '43.00', 0, 5, 1),
(255, 'Dragon Ball', 13, 'Akira Toriyama', '43.00', 0, 5, 1),
(256, 'Dragon Ball', 14, 'Akira Toriyama', '43.00', 0, 5, 1),
(257, 'Dragon Ball', 15, 'Akira Toriyama', '43.00', 0, 5, 1),
(258, 'Dragon Ball', 16, 'Akira Toriyama', '43.00', 0, 5, 1),
(259, 'Dragon Ball', 17, 'Akira Toriyama', '43.00', 0, 5, 1),
(260, 'Dragon Ball', 18, 'Akira Toriyama', '43.00', 0, 5, 1),
(261, 'Dragon Ball', 19, 'Akira Toriyama', '43.00', 0, 5, 1),
(262, 'Dragon Ball', 20, 'Akira Toriyama', '43.00', 0, 5, 1),
(263, 'Dragon Ball', 21, 'Akira Toriyama', '43.00', 0, 5, 1),
(264, 'Dragon Ball', 22, 'Akira Toriyama', '43.00', 0, 5, 1),
(265, 'Dragon Ball', 23, 'Akira Toriyama', '43.00', 0, 5, 1),
(266, 'Dragon Ball', 24, 'Akira Toriyama', '43.00', 0, 5, 1),
(267, 'Dragon Ball', 25, 'Akira Toriyama', '43.00', 0, 5, 1),
(268, 'Dragon Ball', 26, 'Akira Toriyama', '43.00', 0, 5, 1),
(269, 'Dragon Ball', 27, 'Akira Toriyama', '43.00', 0, 5, 1),
(270, 'Dragon Ball', 28, 'Akira Toriyama', '43.00', 0, 5, 1),
(271, 'Dragon Ball', 29, 'Akira Toriyama', '43.00', 0, 5, 1),
(272, 'Dragon Ball', 30, 'Akira Toriyama', '43.00', 0, 5, 1),
(273, 'Dragon Ball', 31, 'Akira Toriyama', '43.00', 0, 5, 1),
(274, 'Dragon Ball', 32, 'Akira Toriyama', '43.00', 0, 5, 1),
(275, 'Dragon Ball', 33, 'Akira Toriyama', '43.00', 0, 5, 1),
(276, 'Dragon Ball', 34, 'Akira Toriyama', '43.00', 0, 5, 1),
(277, 'Dragon Ball', 35, 'Akira Toriyama', '43.00', 0, 5, 1),
(278, 'Dragon Ball', 36, 'Akira Toriyama', '43.00', 0, 5, 1),
(279, 'Dragon Ball', 37, 'Akira Toriyama', '43.00', 0, 5, 1),
(280, 'Dragon Ball', 38, 'Akira Toriyama', '43.00', 0, 5, 1),
(281, 'Dragon Ball', 39, 'Akira Toriyama', '43.00', 0, 5, 1),
(282, 'Dragon Ball', 40, 'Akira Toriyama', '43.00', 0, 5, 1),
(283, 'Dragon Ball', 41, 'Akira Toriyama', '43.00', 0, 5, 1),
(284, 'Dragon Ball', 42, 'Akira Toriyama', '43.00', 0, 5, 1),
(285, 'Hunter x Hunter', 2, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(286, 'Hunter x Hunter', 3, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(287, 'Hunter x Hunter', 4, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(288, 'Hunter x Hunter', 5, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(289, 'Hunter x Hunter', 6, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(290, 'Hunter x Hunter', 7, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(291, 'Hunter x Hunter', 8, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(292, 'Hunter x Hunter', 9, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(293, 'Hunter x Hunter', 10, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(294, 'Hunter x Hunter', 11, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(295, 'Hunter x Hunter', 12, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(296, 'Hunter x Hunter', 13, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(297, 'Hunter x Hunter', 14, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(298, 'Hunter x Hunter', 15, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(299, 'Hunter x Hunter', 16, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(300, 'Hunter x Hunter', 17, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(301, 'Hunter x Hunter', 18, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(302, 'Hunter x Hunter', 19, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(303, 'Hunter x Hunter', 20, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(304, 'Hunter x Hunter', 21, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(305, 'Hunter x Hunter', 22, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(306, 'Hunter x Hunter', 23, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(307, 'Hunter x Hunter', 24, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(308, 'Hunter x Hunter', 25, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(309, 'Hunter x Hunter', 26, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(310, 'Hunter x Hunter', 27, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(311, 'Hunter x Hunter', 28, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(312, 'Hunter x Hunter', 29, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(313, 'Hunter x Hunter', 30, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(314, 'Hunter x Hunter', 31, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(315, 'Hunter x Hunter', 32, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(316, 'Hunter x Hunter', 33, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(317, 'Hunter x Hunter', 34, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(318, 'Hunter x Hunter', 35, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(319, 'Hunter x Hunter', 36, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(320, 'Hunter x Hunter', 37, 'Yoshihiro Togashi', '43.00', 0, 5, 1),
(321, 'Jujutsu Kaisen', 1, 'Gege Akutami', '30.00', 0, 5, 1),
(322, 'Jujutsu Kaisen', 2, 'Gege Akutami', '30.00', 0, 5, 1),
(323, 'Jujutsu Kaisen', 3, 'Gege Akutami', '30.00', 0, 5, 1),
(324, 'Jujutsu Kaisen', 4, 'Gege Akutami', '30.00', 0, 5, 1),
(325, 'Jujutsu Kaisen', 6, 'Gege Akutami', '30.00', 0, 5, 1),
(326, 'Jujutsu Kaisen', 7, 'Gege Akutami', '30.00', 0, 5, 1),
(327, 'Jujutsu Kaisen', 8, 'Gege Akutami', '30.00', 0, 5, 1),
(328, 'Jujutsu Kaisen', 9, 'Gege Akutami', '30.00', 0, 5, 1),
(329, 'Jujutsu Kaisen', 10, 'Gege Akutami', '30.00', 0, 5, 1),
(330, 'Jujutsu Kaisen', 11, 'Gege Akutami', '30.00', 0, 5, 1),
(331, 'Jujutsu Kaisen', 12, 'Gege Akutami', '30.00', 0, 5, 1),
(332, 'Jujutsu Kaisen', 13, 'Gege Akutami', '30.00', 0, 5, 1),
(333, 'Jujutsu Kaisen', 14, 'Gege Akutami', '30.00', 0, 5, 1),
(334, 'Jujutsu Kaisen', 15, 'Gege Akutami', '30.00', 0, 5, 1),
(335, 'Jujutsu Kaisen', 16, 'Gege Akutami', '30.00', 0, 5, 1),
(336, 'Jujutsu Kaisen', 17, 'Gege Akutami', '30.00', 0, 5, 1),
(337, 'Jujutsu Kaisen', 18, 'Gege Akutami', '30.00', 0, 5, 1),
(338, 'Jujutsu Kaisen', 19, 'Gege Akutami', '30.00', 0, 5, 1),
(339, 'Jujutsu Kaisen', 20, 'Gege Akutami', '30.00', 0, 5, 1),
(340, 'Jujutsu Kaisen', 21, 'Gege Akutami', '30.00', 0, 5, 1),
(341, 'Jujutsu Kaisen', 22, 'Gege Akutami', '30.00', 0, 5, 1),
(342, 'Jujutsu Kaisen', 23, 'Gege Akutami', '30.00', 0, 5, 1),
(343, 'Jujutsu Kaisen', 24, 'Gege Akutami', '30.00', 0, 5, 1),
(344, 'Jujutsu Kaisen', 25, 'Gege Akutami', '30.00', 0, 5, 1),
(345, 'Jujutsu Kaisen', 26, 'Gege Akutami', '30.00', 0, 5, 1),
(346, 'Black Clover', 1, 'Y?ki Tabata', '36.90', 0, 5, 1),
(347, 'Black Clover', 2, 'Y?ki Tabata', '36.90', 0, 5, 1),
(348, 'Black Clover', 3, 'Y?ki Tabata', '36.90', 0, 5, 1),
(349, 'Black Clover', 4, 'Y?ki Tabata', '36.90', 0, 5, 1),
(350, 'Black Clover', 5, 'Y?ki Tabata', '36.90', 0, 5, 1),
(351, 'Black Clover', 6, 'Y?ki Tabata', '36.90', 0, 5, 1),
(352, 'Black Clover', 7, 'Y?ki Tabata', '36.90', 49, 5, 1),
(353, 'Black Clover', 8, 'Y?ki Tabata', '36.90', 0, 5, 1),
(354, 'Black Clover', 9, 'Y?ki Tabata', '36.90', 0, 5, 1),
(355, 'Black Clover', 10, 'Y?ki Tabata', '36.90', 0, 5, 1),
(356, 'Black Clover', 11, 'Y?ki Tabata', '36.90', 0, 5, 1),
(357, 'Black Clover', 12, 'Y?ki Tabata', '36.90', 0, 5, 1),
(358, 'Black Clover', 13, 'Y?ki Tabata', '36.90', 0, 5, 1),
(359, 'Black Clover', 14, 'Y?ki Tabata', '36.90', 0, 5, 1),
(360, 'Black Clover', 15, 'Y?ki Tabata', '36.90', 0, 5, 1),
(361, 'Black Clover', 16, 'Y?ki Tabata', '36.90', 0, 5, 1),
(362, 'Black Clover', 17, 'Y?ki Tabata', '36.90', 0, 5, 1),
(363, 'Black Clover', 18, 'Y?ki Tabata', '36.90', 0, 5, 1),
(364, 'Black Clover', 19, 'Y?ki Tabata', '36.90', 0, 5, 1),
(365, 'Black Clover', 20, 'Y?ki Tabata', '36.90', 0, 5, 1),
(366, 'Black Clover', 21, 'Y?ki Tabata', '36.90', 0, 5, 1),
(367, 'Black Clover', 22, 'Y?ki Tabata', '36.90', 0, 5, 1),
(368, 'Black Clover', 23, 'Y?ki Tabata', '36.90', 0, 5, 1),
(369, 'Black Clover', 24, 'Y?ki Tabata', '36.90', 0, 5, 1),
(370, 'Black Clover', 25, 'Y?ki Tabata', '36.90', 0, 5, 1),
(371, 'Black Clover', 26, 'Y?ki Tabata', '36.90', 0, 5, 1),
(372, 'Black Clover', 27, 'Y?ki Tabata', '36.90', 0, 5, 1),
(373, 'Black Clover', 28, 'Y?ki Tabata', '36.90', 0, 5, 1),
(374, 'Black Clover', 29, 'Y?ki Tabata', '36.90', 0, 5, 1),
(375, 'Black Clover', 30, 'Y?ki Tabata', '36.90', 0, 5, 1),
(376, 'Black Clover', 31, 'Y?ki Tabata', '36.90', 0, 5, 1),
(377, 'Black Clover', 32, 'Y?ki Tabata', '36.90', 0, 5, 1),
(378, 'Black Clover', 33, 'Y?ki Tabata', '36.90', 0, 5, 1),
(379, 'Black Clover', 34, 'Y?ki Tabata', '36.90', 0, 5, 1),
(380, 'Demon Slayer', 1, 'Koyoharu Gotouge', '36.90', 50, 5, 1),
(381, 'Demon Slayer', 2, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(382, 'Demon Slayer', 3, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(383, 'Demon Slayer', 4, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(384, 'Demon Slayer', 5, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(385, 'Demon Slayer', 6, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(386, 'Demon Slayer', 7, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(387, 'Demon Slayer', 8, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(388, 'Demon Slayer', 9, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(389, 'Demon Slayer', 10, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(390, 'Demon Slayer', 11, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(391, 'Demon Slayer', 12, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(392, 'Demon Slayer', 13, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(393, 'Demon Slayer', 14, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(394, 'Demon Slayer', 15, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(395, 'Demon Slayer', 16, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(396, 'Demon Slayer', 17, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(397, 'Demon Slayer', 18, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(398, 'Demon Slayer', 19, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(399, 'Demon Slayer', 20, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(400, 'Demon Slayer', 21, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(401, 'Demon Slayer', 22, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(402, 'Demon Slayer', 23, 'Koyoharu Gotouge', '36.90', 0, 5, 1),
(403, 'My Hero Academia', 1, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(404, 'My Hero Academia', 2, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(405, 'My Hero Academia', 3, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(406, 'My Hero Academia', 4, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(407, 'My Hero Academia', 5, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(408, 'My Hero Academia', 6, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(409, 'My Hero Academia', 7, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(410, 'My Hero Academia', 8, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(411, 'My Hero Academia', 9, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(412, 'My Hero Academia', 10, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(413, 'My Hero Academia', 11, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(414, 'My Hero Academia', 12, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(415, 'My Hero Academia', 13, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(416, 'My Hero Academia', 14, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(417, 'My Hero Academia', 15, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(418, 'My Hero Academia', 16, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(419, 'My Hero Academia', 17, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(420, 'My Hero Academia', 18, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(421, 'My Hero Academia', 19, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(422, 'My Hero Academia', 20, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(423, 'My Hero Academia', 21, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(424, 'My Hero Academia', 22, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(425, 'My Hero Academia', 23, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(426, 'My Hero Academia', 24, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(427, 'My Hero Academia', 25, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(428, 'My Hero Academia', 26, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(429, 'My Hero Academia', 27, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(430, 'My Hero Academia', 28, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(431, 'My Hero Academia', 29, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(432, 'My Hero Academia', 30, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(433, 'My Hero Academia', 31, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(434, 'My Hero Academia', 32, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(435, 'My Hero Academia', 33, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(436, 'My Hero Academia', 34, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(437, 'My Hero Academia', 35, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(438, 'My Hero Academia', 36, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(439, 'My Hero Academia', 37, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(440, 'My Hero Academia', 38, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(441, 'My Hero Academia', 39, 'Kohei Horikoshi', '29.90', 0, 5, 2),
(442, 'Attack on Titan', 1, 'Hajime Isayama', '36.90', 0, 5, 1),
(443, 'Attack on Titan', 2, 'Hajime Isayama', '36.90', 0, 5, 1),
(444, 'Attack on Titan', 3, 'Hajime Isayama', '36.90', 0, 5, 1),
(445, 'Attack on Titan', 4, 'Hajime Isayama', '36.90', 0, 5, 1),
(446, 'Attack on Titan', 5, 'Hajime Isayama', '36.90', 0, 5, 1),
(447, 'Attack on Titan', 6, 'Hajime Isayama', '36.90', 0, 5, 1),
(448, 'Attack on Titan', 7, 'Hajime Isayama', '36.90', 0, 5, 1),
(449, 'Attack on Titan', 8, 'Hajime Isayama', '36.90', 0, 5, 1),
(450, 'Attack on Titan', 9, 'Hajime Isayama', '36.90', 0, 5, 1),
(451, 'Attack on Titan', 10, 'Hajime Isayama', '36.90', 0, 5, 1),
(452, 'Attack on Titan', 11, 'Hajime Isayama', '36.90', 0, 5, 1),
(453, 'Attack on Titan', 12, 'Hajime Isayama', '36.90', 0, 5, 1),
(454, 'Attack on Titan', 13, 'Hajime Isayama', '36.90', 0, 5, 1),
(455, 'Attack on Titan', 14, 'Hajime Isayama', '36.90', 0, 5, 1),
(456, 'Attack on Titan', 15, 'Hajime Isayama', '36.90', 0, 5, 1),
(457, 'Attack on Titan', 16, 'Hajime Isayama', '36.90', 0, 5, 1),
(458, 'Attack on Titan', 17, 'Hajime Isayama', '36.90', 0, 5, 1),
(459, 'Attack on Titan', 18, 'Hajime Isayama', '36.90', 0, 5, 1),
(460, 'Attack on Titan', 19, 'Hajime Isayama', '36.90', 0, 5, 1),
(461, 'Attack on Titan', 20, 'Hajime Isayama', '36.90', 0, 5, 1),
(462, 'Attack on Titan', 21, 'Hajime Isayama', '36.90', 0, 5, 1),
(463, 'Attack on Titan', 22, 'Hajime Isayama', '36.90', 0, 5, 1),
(464, 'Attack on Titan', 23, 'Hajime Isayama', '36.90', 0, 5, 1),
(465, 'Attack on Titan', 24, 'Hajime Isayama', '36.90', 0, 5, 1),
(466, 'Attack on Titan', 25, 'Hajime Isayama', '36.90', 0, 5, 1),
(467, 'Attack on Titan', 26, 'Hajime Isayama', '36.90', 50, 5, 1),
(468, 'Attack on Titan', 27, 'Hajime Isayama', '36.90', 50, 5, 1),
(469, 'Attack on Titan', 28, 'Hajime Isayama', '36.90', 49, 5, 1),
(470, 'Attack on Titan', 29, 'Hajime Isayama', '36.90', 0, 5, 1),
(471, 'Attack on Titan', 30, 'Hajime Isayama', '36.90', 0, 5, 1),
(472, 'Attack on Titan', 31, 'Hajime Isayama', '36.90', 0, 5, 1),
(473, 'Attack on Titan', 32, 'Hajime Isayama', '36.90', 0, 5, 1),
(474, 'Attack on Titan', 33, 'Hajime Isayama', '36.90', 50, 5, 1),
(475, 'Attack on Titan', 34, 'Hajime Isayama', '36.90', 50, 5, 1),
(476, 'Vagabond', 3, 'Takehiko Inoue', '49.90', 0, 5, 4),
(477, 'Vagabond', 4, 'Takehiko Inoue', '49.90', 0, 5, 4),
(478, 'Vagabond', 5, 'Takehiko Inoue', '49.90', 0, 5, 4),
(479, 'Vagabond', 6, 'Takehiko Inoue', '49.90', 0, 5, 4),
(480, 'Vagabond', 7, 'Takehiko Inoue', '49.90', 0, 5, 4),
(481, 'Vagabond', 8, 'Takehiko Inoue', '49.90', 0, 5, 4),
(482, 'Vagabond', 9, 'Takehiko Inoue', '49.90', 0, 5, 4),
(483, 'Vagabond', 10, 'Takehiko Inoue', '49.90', 0, 5, 4),
(484, 'Vagabond', 11, 'Takehiko Inoue', '49.90', 0, 5, 4),
(485, 'Vagabond', 12, 'Takehiko Inoue', '49.90', 0, 5, 4),
(486, 'Vagabond', 13, 'Takehiko Inoue', '49.90', 0, 5, 4),
(487, 'Vagabond', 14, 'Takehiko Inoue', '49.90', 0, 5, 4),
(488, 'Vagabond', 15, 'Takehiko Inoue', '49.90', 0, 5, 4),
(489, 'Vagabond', 16, 'Takehiko Inoue', '49.90', 0, 5, 4),
(490, 'Vagabond', 17, 'Takehiko Inoue', '49.90', 0, 5, 4),
(491, 'Vagabond', 18, 'Takehiko Inoue', '49.90', 0, 5, 4),
(492, 'Vagabond', 19, 'Takehiko Inoue', '49.90', 0, 5, 4),
(493, 'Vagabond', 20, 'Takehiko Inoue', '49.90', 0, 5, 4),
(494, 'Vagabond', 21, 'Takehiko Inoue', '49.90', 0, 5, 4),
(495, 'Vagabond', 22, 'Takehiko Inoue', '49.90', 0, 5, 4),
(496, 'Vagabond', 23, 'Takehiko Inoue', '49.90', 0, 5, 4),
(497, 'Vagabond', 24, 'Takehiko Inoue', '49.90', 0, 5, 4),
(498, 'Vagabond', 25, 'Takehiko Inoue', '49.90', 0, 5, 4),
(499, 'Vagabond', 26, 'Takehiko Inoue', '49.90', 0, 5, 4),
(500, 'Vagabond', 27, 'Takehiko Inoue', '49.90', 0, 5, 4),
(501, 'Vagabond', 28, 'Takehiko Inoue', '49.90', 0, 5, 4),
(502, 'Vagabond', 29, 'Takehiko Inoue', '49.90', 0, 5, 4),
(503, 'Vagabond', 30, 'Takehiko Inoue', '49.90', 0, 5, 4),
(504, 'Vagabond', 31, 'Takehiko Inoue', '49.90', 0, 5, 4),
(505, 'Vagabond', 32, 'Takehiko Inoue', '49.90', 0, 5, 4),
(506, 'Vagabond', 33, 'Takehiko Inoue', '49.90', 0, 5, 4),
(507, 'Vagabond', 34, 'Takehiko Inoue', '49.90', 0, 5, 4),
(508, 'Vagabond', 35, 'Takehiko Inoue', '49.90', 0, 5, 4),
(509, 'Vagabond', 36, 'Takehiko Inoue', '49.90', 0, 5, 4),
(510, 'Vagabond', 37, 'Takehiko Inoue', '49.90', 0, 5, 4),
(511, 'Vinland Saga', 1, 'Makoto Yukimura', '36.90', 0, 5, 1),
(512, 'Vinland Saga', 2, 'Makoto Yukimura', '36.90', 0, 5, 1),
(513, 'Vinland Saga', 3, 'Makoto Yukimura', '36.90', 0, 5, 1),
(514, 'Vinland Saga', 4, 'Makoto Yukimura', '36.90', 0, 5, 1),
(515, 'Vinland Saga', 5, 'Makoto Yukimura', '36.90', 0, 5, 1),
(516, 'Vinland Saga', 6, 'Makoto Yukimura', '36.90', 0, 5, 1),
(517, 'Vinland Saga', 7, 'Makoto Yukimura', '36.90', 0, 5, 1),
(518, 'Vinland Saga', 8, 'Makoto Yukimura', '36.90', 0, 5, 1),
(519, 'Vinland Saga', 9, 'Makoto Yukimura', '36.90', 0, 5, 1),
(520, 'Vinland Saga', 10, 'Makoto Yukimura', '36.90', 0, 5, 1),
(521, 'Vinland Saga', 11, 'Makoto Yukimura', '36.90', 0, 5, 1),
(522, 'Vinland Saga', 12, 'Makoto Yukimura', '36.90', 0, 5, 1),
(523, 'Vinland Saga', 13, 'Makoto Yukimura', '36.90', 0, 5, 1),
(524, 'Vinland Saga', 14, 'Makoto Yukimura', '36.90', 0, 5, 1),
(525, 'Vinland Saga', 15, 'Makoto Yukimura', '36.90', 0, 5, 1),
(526, 'Vinland Saga', 16, 'Makoto Yukimura', '36.90', 0, 5, 1),
(527, 'Vinland Saga', 17, 'Makoto Yukimura', '36.90', 0, 5, 1),
(528, 'Vinland Saga', 18, 'Makoto Yukimura', '36.90', 0, 5, 1),
(529, 'Vinland Saga', 19, 'Makoto Yukimura', '36.90', 0, 5, 1),
(530, 'Vinland Saga', 20, 'Makoto Yukimura', '36.90', 0, 5, 1),
(531, 'Vinland Saga', 21, 'Makoto Yukimura', '36.90', 0, 5, 1),
(532, 'Vinland Saga', 22, 'Makoto Yukimura', '36.90', 0, 5, 1),
(533, 'Vinland Saga', 23, 'Makoto Yukimura', '36.90', 0, 5, 1),
(534, 'Vinland Saga', 24, 'Makoto Yukimura', '36.90', 0, 5, 1),
(535, 'Vinland Saga', 25, 'Makoto Yukimura', '36.90', 0, 5, 1),
(536, 'Vinland Saga', 26, 'Makoto Yukimura', '36.90', 0, 5, 1),
(537, 'Vinland Saga', 27, 'Makoto Yukimura', '36.90', 0, 5, 1),
(538, 'Vinland Saga', 28, 'Makoto Yukimura', '36.90', 0, 5, 1),
(539, 'Berserk', 1, 'Kentaro Miura', '44.90', 0, 5, 2),
(540, 'Berserk', 2, 'Kentaro Miura', '44.90', 0, 5, 2),
(541, 'Berserk', 3, 'Kentaro Miura', '44.90', 0, 5, 2),
(542, 'Berserk', 4, 'Kentaro Miura', '44.90', 0, 5, 2),
(543, 'Berserk', 5, 'Kentaro Miura', '44.90', 0, 5, 2),
(544, 'Berserk', 6, 'Kentaro Miura', '44.90', 50, 5, 2),
(545, 'Berserk', 7, 'Kentaro Miura', '44.90', 0, 5, 2),
(546, 'Berserk', 8, 'Kentaro Miura', '44.90', 0, 5, 2),
(547, 'Berserk', 9, 'Kentaro Miura', '44.90', 0, 5, 2),
(548, 'Berserk', 10, 'Kentaro Miura', '44.90', 0, 5, 2),
(549, 'Berserk', 11, 'Kentaro Miura', '44.90', 0, 5, 2),
(550, 'Berserk', 12, 'Kentaro Miura', '44.90', 0, 5, 2),
(551, 'Berserk', 13, 'Kentaro Miura', '44.90', 0, 5, 2),
(552, 'Berserk', 14, 'Kentaro Miura', '44.90', 0, 5, 2),
(553, 'Berserk', 15, 'Kentaro Miura', '44.90', 0, 5, 2),
(554, 'Berserk', 16, 'Kentaro Miura', '44.90', 0, 5, 2),
(555, 'Berserk', 17, 'Kentaro Miura', '44.90', 0, 5, 2),
(556, 'Berserk', 18, 'Kentaro Miura', '44.90', 0, 5, 2),
(557, 'Berserk', 19, 'Kentaro Miura', '44.90', 0, 5, 2),
(558, 'Berserk', 20, 'Kentaro Miura', '44.90', 0, 5, 2),
(559, 'Berserk', 21, 'Kentaro Miura', '44.90', 0, 5, 2),
(560, 'Berserk', 22, 'Kentaro Miura', '44.90', 0, 5, 2),
(561, 'Berserk', 23, 'Kentaro Miura', '44.90', 0, 5, 2),
(562, 'Berserk', 24, 'Kentaro Miura', '44.90', 0, 5, 2),
(563, 'Berserk', 25, 'Kentaro Miura', '44.90', 0, 5, 2),
(564, 'Berserk', 26, 'Kentaro Miura', '44.90', 0, 5, 2),
(565, 'Berserk', 27, 'Kentaro Miura', '44.90', 0, 5, 2),
(566, 'Berserk', 28, 'Kentaro Miura', '44.90', 0, 5, 2),
(567, 'Berserk', 29, 'Kentaro Miura', '44.90', 0, 5, 2),
(568, 'Berserk', 30, 'Kentaro Miura', '44.90', 0, 5, 2),
(569, 'Berserk', 31, 'Kentaro Miura', '44.90', 0, 5, 2),
(570, 'Berserk', 32, 'Kentaro Miura', '44.90', 0, 5, 2),
(571, 'Berserk', 33, 'Kentaro Miura', '44.90', 0, 5, 2),
(572, 'Berserk', 34, 'Kentaro Miura', '44.90', 0, 5, 2),
(573, 'Berserk', 35, 'Kentaro Miura', '44.90', 0, 5, 2),
(574, 'Berserk', 36, 'Kentaro Miura', '44.90', 0, 5, 2),
(575, 'Berserk', 37, 'Kentaro Miura', '44.90', 0, 5, 2),
(576, 'Berserk', 38, 'Kentaro Miura', '44.90', 0, 5, 2),
(577, 'Berserk', 39, 'Kentaro Miura', '44.90', 0, 5, 2),
(578, 'Berserk', 40, 'Kentaro Miura', '44.90', 0, 5, 2),
(579, 'Berserk', 41, 'Kentaro Miura', '44.90', 0, 5, 2),
(580, 'Berserk', 42, 'Kentaro Miura', '44.90', 0, 5, 2),
(581, 'Fairy Tail', 1, 'Hiro Mashima', '34.90', 0, 5, 2),
(582, 'Fairy Tail', 2, 'Hiro Mashima', '34.90', 0, 5, 2),
(583, 'Fairy Tail', 3, 'Hiro Mashima', '34.90', 0, 5, 2),
(584, 'Fairy Tail', 4, 'Hiro Mashima', '34.90', 0, 5, 2),
(585, 'Fairy Tail', 5, 'Hiro Mashima', '34.90', 0, 5, 2),
(586, 'Fairy Tail', 6, 'Hiro Mashima', '34.90', 0, 5, 2),
(587, 'Fairy Tail', 7, 'Hiro Mashima', '34.90', 0, 5, 2),
(588, 'Fairy Tail', 8, 'Hiro Mashima', '34.90', 0, 5, 2),
(589, 'Fairy Tail', 9, 'Hiro Mashima', '34.90', 0, 5, 2),
(590, 'Fairy Tail', 10, 'Hiro Mashima', '34.90', 0, 5, 2),
(591, 'Fairy Tail', 11, 'Hiro Mashima', '34.90', 0, 5, 2),
(592, 'Fairy Tail', 12, 'Hiro Mashima', '34.90', 0, 5, 2),
(593, 'Fairy Tail', 13, 'Hiro Mashima', '34.90', 0, 5, 2),
(594, 'Fairy Tail', 14, 'Hiro Mashima', '34.90', 0, 5, 2),
(595, 'Fairy Tail', 15, 'Hiro Mashima', '34.90', 0, 5, 2),
(596, 'Fairy Tail', 16, 'Hiro Mashima', '34.90', 0, 5, 2),
(597, 'Fairy Tail', 17, 'Hiro Mashima', '34.90', 0, 5, 2),
(598, 'Fairy Tail', 18, 'Hiro Mashima', '34.90', 0, 5, 2),
(599, 'Fairy Tail', 19, 'Hiro Mashima', '34.90', 0, 5, 2),
(600, 'Fairy Tail', 20, 'Hiro Mashima', '34.90', 0, 5, 2),
(601, 'Fairy Tail', 21, 'Hiro Mashima', '34.90', 0, 5, 2),
(602, 'Fairy Tail', 22, 'Hiro Mashima', '34.90', 0, 5, 2),
(603, 'Fairy Tail', 23, 'Hiro Mashima', '34.90', 0, 5, 2),
(604, 'Fairy Tail', 24, 'Hiro Mashima', '34.90', 0, 5, 2),
(605, 'Fairy Tail', 25, 'Hiro Mashima', '34.90', 0, 5, 2),
(606, 'Fairy Tail', 26, 'Hiro Mashima', '34.90', 0, 5, 2),
(607, 'Fairy Tail', 27, 'Hiro Mashima', '34.90', 0, 5, 2),
(608, 'Fairy Tail', 28, 'Hiro Mashima', '34.90', 0, 5, 2),
(609, 'Fairy Tail', 29, 'Hiro Mashima', '34.90', 0, 5, 2),
(610, 'Fairy Tail', 30, 'Hiro Mashima', '34.90', 0, 5, 2),
(611, 'Fairy Tail', 31, 'Hiro Mashima', '34.90', 0, 5, 2),
(612, 'Fairy Tail', 32, 'Hiro Mashima', '34.90', 0, 5, 2),
(613, 'Fairy Tail', 33, 'Hiro Mashima', '34.90', 0, 5, 2),
(614, 'Fairy Tail', 34, 'Hiro Mashima', '34.90', 0, 5, 2),
(615, 'Fairy Tail', 35, 'Hiro Mashima', '34.90', 0, 5, 2),
(616, 'Fairy Tail', 36, 'Hiro Mashima', '34.90', 0, 5, 2),
(617, 'Fairy Tail', 37, 'Hiro Mashima', '34.90', 0, 5, 2),
(618, 'Fairy Tail', 38, 'Hiro Mashima', '34.90', 0, 5, 2),
(619, 'Fairy Tail', 39, 'Hiro Mashima', '34.90', 0, 5, 2),
(620, 'Fairy Tail', 40, 'Hiro Mashima', '34.90', 0, 5, 2),
(621, 'Fairy Tail', 41, 'Hiro Mashima', '34.90', 0, 5, 2),
(622, 'Fairy Tail', 42, 'Hiro Mashima', '34.90', 0, 5, 2),
(623, 'Fairy Tail', 43, 'Hiro Mashima', '34.90', 0, 5, 2),
(624, 'Fairy Tail', 44, 'Hiro Mashima', '34.90', 0, 5, 2),
(625, 'Fairy Tail', 45, 'Hiro Mashima', '34.90', 0, 5, 2),
(626, 'Fairy Tail', 46, 'Hiro Mashima', '34.90', 0, 5, 2),
(627, 'Fairy Tail', 47, 'Hiro Mashima', '34.90', 0, 5, 2),
(628, 'Fairy Tail', 48, 'Hiro Mashima', '34.90', 0, 5, 2),
(629, 'Fairy Tail', 49, 'Hiro Mashima', '34.90', 0, 5, 2),
(630, 'Fairy Tail', 50, 'Hiro Mashima', '34.90', 0, 5, 2),
(631, 'Fairy Tail', 51, 'Hiro Mashima', '34.90', 0, 5, 2),
(632, 'Fairy Tail', 52, 'Hiro Mashima', '34.90', 0, 5, 2),
(633, 'Fairy Tail', 53, 'Hiro Mashima', '34.90', 0, 5, 2),
(634, 'Fairy Tail', 54, 'Hiro Mashima', '34.90', 0, 5, 2),
(635, 'Fairy Tail', 55, 'Hiro Mashima', '34.90', 0, 5, 2),
(636, 'Fairy Tail', 56, 'Hiro Mashima', '34.90', 0, 5, 2),
(637, 'Fairy Tail', 57, 'Hiro Mashima', '34.90', 0, 5, 2),
(638, 'Fairy Tail', 58, 'Hiro Mashima', '34.90', 0, 5, 2),
(639, 'Fairy Tail', 59, 'Hiro Mashima', '34.90', 0, 5, 2),
(640, 'Fairy Tail', 60, 'Hiro Mashima', '34.90', 0, 5, 2),
(641, 'Fairy Tail', 61, 'Hiro Mashima', '34.90', 0, 5, 2),
(642, 'Fairy Tail', 62, 'Hiro Mashima', '34.90', 0, 5, 2),
(643, 'Fairy Tail', 63, 'Hiro Mashima', '34.90', 0, 5, 2),
(644, 'The Seven Deadly Sins', 1, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(645, 'The Seven Deadly Sins', 2, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(646, 'The Seven Deadly Sins', 3, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(647, 'The Seven Deadly Sins', 4, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(648, 'The Seven Deadly Sins', 5, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(649, 'The Seven Deadly Sins', 6, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(650, 'The Seven Deadly Sins', 7, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(651, 'The Seven Deadly Sins', 8, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(652, 'The Seven Deadly Sins', 9, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(653, 'The Seven Deadly Sins', 10, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(654, 'The Seven Deadly Sins', 11, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(655, 'The Seven Deadly Sins', 12, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(656, 'The Seven Deadly Sins', 13, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(657, 'The Seven Deadly Sins', 14, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(658, 'The Seven Deadly Sins', 15, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(659, 'The Seven Deadly Sins', 16, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(660, 'The Seven Deadly Sins', 17, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(661, 'The Seven Deadly Sins', 18, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(662, 'The Seven Deadly Sins', 19, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(663, 'The Seven Deadly Sins', 20, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(664, 'The Seven Deadly Sins', 21, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(665, 'The Seven Deadly Sins', 22, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(666, 'The Seven Deadly Sins', 23, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(667, 'The Seven Deadly Sins', 24, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(668, 'The Seven Deadly Sins', 25, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(669, 'The Seven Deadly Sins', 26, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(670, 'The Seven Deadly Sins', 27, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(671, 'The Seven Deadly Sins', 28, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(672, 'The Seven Deadly Sins', 29, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(673, 'The Seven Deadly Sins', 30, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(674, 'The Seven Deadly Sins', 31, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(675, 'The Seven Deadly Sins', 32, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(676, 'The Seven Deadly Sins', 33, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(677, 'The Seven Deadly Sins', 34, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(678, 'The Seven Deadly Sins', 35, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(679, 'The Seven Deadly Sins', 36, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(680, 'The Seven Deadly Sins', 37, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(681, 'The Seven Deadly Sins', 38, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(682, 'The Seven Deadly Sins', 39, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(683, 'The Seven Deadly Sins', 40, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(684, 'The Seven Deadly Sins', 41, 'Nakaba Suzuki', '34.90', 0, 5, 2),
(685, 'Vanitas no Carte', 1, 'Jun Mochizuki', '36.90', 0, 5, 1),
(686, 'Vanitas no Carte', 2, 'Jun Mochizuki', '36.90', 0, 5, 1),
(687, 'Vanitas no Carte', 3, 'Jun Mochizuki', '36.90', 0, 5, 1),
(688, 'Vanitas no Carte', 4, 'Jun Mochizuki', '36.90', 0, 5, 1),
(689, 'Vanitas no Carte', 5, 'Jun Mochizuki', '36.90', 0, 5, 1),
(690, 'Vanitas no Carte', 6, 'Jun Mochizuki', '36.90', 0, 5, 1),
(691, 'Vanitas no Carte', 7, 'Jun Mochizuki', '36.90', 0, 5, 1),
(692, 'Vanitas no Carte', 8, 'Jun Mochizuki', '36.90', 0, 5, 1),
(693, 'Vanitas no Carte', 9, 'Jun Mochizuki', '36.90', 0, 5, 1),
(694, 'Vanitas no Carte', 10, 'Jun Mochizuki', '36.90', 0, 5, 1),
(695, 'Vanitas no Carte', 11, 'Jun Mochizuki', '36.90', 0, 5, 1),
(696, 'Jojo''s Bizarre Adventure', 1, 'Hirohiko Araki', '36.90', 0, 5, 1),
(697, 'Jojo''s Bizarre Adventure', 2, 'Hirohiko Araki', '36.90', 0, 5, 1),
(698, 'Jojo''s Bizarre Adventure', 3, 'Hirohiko Araki', '36.90', 0, 5, 1),
(699, 'Jojo''s Bizarre Adventure', 4, 'Hirohiko Araki', '36.90', 0, 5, 1),
(700, 'Jojo''s Bizarre Adventure', 5, 'Hirohiko Araki', '36.90', 0, 5, 1),
(701, 'Jojo''s Bizarre Adventure', 6, 'Hirohiko Araki', '36.90', 0, 5, 1),
(702, 'Jojo''s Bizarre Adventure', 7, 'Hirohiko Araki', '36.90', 0, 5, 1),
(703, 'Jojo''s Bizarre Adventure', 8, 'Hirohiko Araki', '36.90', 0, 5, 1),
(704, 'Jojo''s Bizarre Adventure', 9, 'Hirohiko Araki', '36.90', 0, 5, 1),
(705, 'Jojo''s Bizarre Adventure', 10, 'Hirohiko Araki', '36.90', 0, 5, 1),
(706, 'Jojo''s Bizarre Adventure', 11, 'Hirohiko Araki', '36.90', 0, 5, 1),
(707, 'Jojo''s Bizarre Adventure', 12, 'Hirohiko Araki', '36.90', 0, 5, 1),
(708, 'Jojo''s Bizarre Adventure', 13, 'Hirohiko Araki', '36.90', 0, 5, 1),
(709, 'Jojo''s Bizarre Adventure', 14, 'Hirohiko Araki', '36.90', 0, 5, 1),
(710, 'Jojo''s Bizarre Adventure', 15, 'Hirohiko Araki', '36.90', 0, 5, 1),
(711, 'Jojo''s Bizarre Adventure', 16, 'Hirohiko Araki', '36.90', 0, 5, 1),
(712, 'Jojo''s Bizarre Adventure', 17, 'Hirohiko Araki', '36.90', 0, 5, 1),
(713, 'Jojo''s Bizarre Adventure', 18, 'Hirohiko Araki', '36.90', 0, 5, 1),
(714, 'Jojo''s Bizarre Adventure', 19, 'Hirohiko Araki', '36.90', 0, 5, 1),
(715, 'Jojo''s Bizarre Adventure', 20, 'Hirohiko Araki', '36.90', 0, 5, 1),
(716, 'Jojo''s Bizarre Adventure', 21, 'Hirohiko Araki', '36.90', 0, 5, 1),
(717, 'Jojo''s Bizarre Adventure', 22, 'Hirohiko Araki', '36.90', 0, 5, 1),
(718, 'Jojo''s Bizarre Adventure', 23, 'Hirohiko Araki', '36.90', 0, 5, 1),
(719, 'Jojo''s Bizarre Adventure', 24, 'Hirohiko Araki', '36.90', 0, 5, 1),
(720, 'Jojo''s Bizarre Adventure', 25, 'Hirohiko Araki', '36.90', 0, 5, 1),
(721, 'Jojo''s Bizarre Adventure', 26, 'Hirohiko Araki', '36.90', 0, 5, 1),
(722, 'Jojo''s Bizarre Adventure', 27, 'Hirohiko Araki', '36.90', 0, 5, 1),
(723, 'Jojo''s Bizarre Adventure', 28, 'Hirohiko Araki', '36.90', 0, 5, 1),
(724, 'Jojo''s Bizarre Adventure', 29, 'Hirohiko Araki', '36.90', 0, 5, 1),
(725, 'Jojo''s Bizarre Adventure', 30, 'Hirohiko Araki', '36.90', 0, 5, 1),
(726, 'Jojo''s Bizarre Adventure', 31, 'Hirohiko Araki', '36.90', 0, 5, 1),
(727, 'Jojo''s Bizarre Adventure', 32, 'Hirohiko Araki', '36.90', 0, 5, 1),
(728, 'Jojo''s Bizarre Adventure', 33, 'Hirohiko Araki', '36.90', 0, 5, 1),
(729, 'Jojo''s Bizarre Adventure', 34, 'Hirohiko Araki', '36.90', 0, 5, 1),
(730, 'Jojo''s Bizarre Adventure', 35, 'Hirohiko Araki', '36.90', 0, 5, 1),
(731, 'Jojo''s Bizarre Adventure', 36, 'Hirohiko Araki', '36.90', 0, 5, 1),
(732, 'Jojo''s Bizarre Adventure', 37, 'Hirohiko Araki', '36.90', 0, 5, 1),
(733, 'Jojo''s Bizarre Adventure', 38, 'Hirohiko Araki', '36.90', 0, 5, 1),
(734, 'Jojo''s Bizarre Adventure', 39, 'Hirohiko Araki', '36.90', 0, 5, 1),
(735, 'Jojo''s Bizarre Adventure', 40, 'Hirohiko Araki', '36.90', 0, 5, 1),
(736, 'Jojo''s Bizarre Adventure', 41, 'Hirohiko Araki', '36.90', 0, 5, 1),
(737, 'Jojo''s Bizarre Adventure', 42, 'Hirohiko Araki', '36.90', 0, 5, 1),
(738, 'Jojo''s Bizarre Adventure', 43, 'Hirohiko Araki', '36.90', 0, 5, 1),
(739, 'Jojo''s Bizarre Adventure', 44, 'Hirohiko Araki', '36.90', 0, 5, 1),
(740, 'Jojo''s Bizarre Adventure', 45, 'Hirohiko Araki', '36.90', 0, 5, 1),
(741, 'Jojo''s Bizarre Adventure', 46, 'Hirohiko Araki', '36.90', 0, 5, 1),
(742, 'Jojo''s Bizarre Adventure', 47, 'Hirohiko Araki', '36.90', 0, 5, 1),
(743, 'Jojo''s Bizarre Adventure', 48, 'Hirohiko Araki', '36.90', 0, 5, 1),
(744, 'Jojo''s Bizarre Adventure', 49, 'Hirohiko Araki', '36.90', 0, 5, 1),
(745, 'Jojo''s Bizarre Adventure', 50, 'Hirohiko Araki', '36.90', 0, 5, 1),
(746, 'Jojo''s Bizarre Adventure', 51, 'Hirohiko Araki', '36.90', 0, 5, 1),
(747, 'Jojo''s Bizarre Adventure', 52, 'Hirohiko Araki', '36.90', 0, 5, 1),
(748, 'Jojo''s Bizarre Adventure', 53, 'Hirohiko Araki', '36.90', 0, 5, 1),
(749, 'Jojo''s Bizarre Adventure', 54, 'Hirohiko Araki', '36.90', 0, 5, 1),
(750, 'Jojo''s Bizarre Adventure', 55, 'Hirohiko Araki', '36.90', 0, 5, 1),
(751, 'Jojo''s Bizarre Adventure', 56, 'Hirohiko Araki', '36.90', 0, 5, 1),
(752, 'Jojo''s Bizarre Adventure', 57, 'Hirohiko Araki', '36.90', 0, 5, 1),
(753, 'Jojo''s Bizarre Adventure', 58, 'Hirohiko Araki', '36.90', 0, 5, 1),
(754, 'Jojo''s Bizarre Adventure', 59, 'Hirohiko Araki', '36.90', 0, 5, 1),
(755, 'Jojo''s Bizarre Adventure', 60, 'Hirohiko Araki', '36.90', 0, 5, 1),
(756, 'Jojo''s Bizarre Adventure', 61, 'Hirohiko Araki', '36.90', 0, 5, 1),
(757, 'Jojo''s Bizarre Adventure', 62, 'Hirohiko Araki', '36.90', 0, 5, 1),
(758, 'Jojo''s Bizarre Adventure', 63, 'Hirohiko Araki', '36.90', 0, 5, 1),
(759, 'Jojo''s Bizarre Adventure', 64, 'Hirohiko Araki', '36.90', 0, 5, 1),
(760, 'Jojo''s Bizarre Adventure', 65, 'Hirohiko Araki', '36.90', 0, 5, 1),
(761, 'Jojo''s Bizarre Adventure', 66, 'Hirohiko Araki', '36.90', 0, 5, 1),
(762, 'Jojo''s Bizarre Adventure', 67, 'Hirohiko Araki', '36.90', 0, 5, 1),
(763, 'Jojo''s Bizarre Adventure', 68, 'Hirohiko Araki', '36.90', 0, 5, 1),
(764, 'Jojo''s Bizarre Adventure', 69, 'Hirohiko Araki', '36.90', 0, 5, 1),
(765, 'Jojo''s Bizarre Adventure', 70, 'Hirohiko Araki', '36.90', 0, 5, 1),
(766, 'Jojo''s Bizarre Adventure', 71, 'Hirohiko Araki', '36.90', 0, 5, 1),
(767, 'Jojo''s Bizarre Adventure', 72, 'Hirohiko Araki', '36.90', 0, 5, 1),
(768, 'Jojo''s Bizarre Adventure', 73, 'Hirohiko Araki', '36.90', 0, 5, 1),
(769, 'Jojo''s Bizarre Adventure', 74, 'Hirohiko Araki', '36.90', 0, 5, 1),
(770, 'Jojo''s Bizarre Adventure', 75, 'Hirohiko Araki', '36.90', 0, 5, 1),
(771, 'Jojo''s Bizarre Adventure', 76, 'Hirohiko Araki', '36.90', 0, 5, 1),
(772, 'Jojo''s Bizarre Adventure', 77, 'Hirohiko Araki', '36.90', 0, 5, 1),
(773, 'Jojo''s Bizarre Adventure', 78, 'Hirohiko Araki', '36.90', 0, 5, 1),
(774, 'Jojo''s Bizarre Adventure', 79, 'Hirohiko Araki', '36.90', 0, 5, 1),
(775, 'Jojo''s Bizarre Adventure', 80, 'Hirohiko Araki', '36.90', 0, 5, 1),
(776, 'Jojo''s Bizarre Adventure', 81, 'Hirohiko Araki', '36.90', 0, 5, 1),
(777, 'Jojo''s Bizarre Adventure', 82, 'Hirohiko Araki', '36.90', 0, 5, 1),
(778, 'Jojo''s Bizarre Adventure', 83, 'Hirohiko Araki', '36.90', 0, 5, 1),
(779, 'Jojo''s Bizarre Adventure', 84, 'Hirohiko Araki', '36.90', 0, 5, 1),
(780, 'Jojo''s Bizarre Adventure', 85, 'Hirohiko Araki', '36.90', 0, 5, 1),
(781, 'Jojo''s Bizarre Adventure', 86, 'Hirohiko Araki', '36.90', 0, 5, 1),
(782, 'Jojo''s Bizarre Adventure', 87, 'Hirohiko Araki', '36.90', 0, 5, 1),
(783, 'Jojo''s Bizarre Adventure', 88, 'Hirohiko Araki', '36.90', 0, 5, 1),
(784, 'Jojo''s Bizarre Adventure', 89, 'Hirohiko Araki', '36.90', 0, 5, 1),
(785, 'Jojo''s Bizarre Adventure', 90, 'Hirohiko Araki', '36.90', 0, 5, 1),
(786, 'Jojo''s Bizarre Adventure', 91, 'Hirohiko Araki', '36.90', 0, 5, 1),
(787, 'Jojo''s Bizarre Adventure', 92, 'Hirohiko Araki', '36.90', 0, 5, 1),
(788, 'Jojo''s Bizarre Adventure', 93, 'Hirohiko Araki', '36.90', 0, 5, 1),
(789, 'Jojo''s Bizarre Adventure', 94, 'Hirohiko Araki', '36.90', 0, 5, 1),
(790, 'Jojo''s Bizarre Adventure', 95, 'Hirohiko Araki', '36.90', 0, 5, 1),
(791, 'Jojo''s Bizarre Adventure', 96, 'Hirohiko Araki', '36.90', 0, 5, 1),
(792, 'Jojo''s Bizarre Adventure', 97, 'Hirohiko Araki', '36.90', 0, 5, 1),
(793, 'Jojo''s Bizarre Adventure', 98, 'Hirohiko Araki', '36.90', 0, 5, 1),
(794, 'Jojo''s Bizarre Adventure', 99, 'Hirohiko Araki', '36.90', 0, 5, 1),
(795, 'Jojo''s Bizarre Adventure', 100, 'Hirohiko Araki', '36.90', 0, 5, 1),
(796, 'Jojo''s Bizarre Adventure', 101, 'Hirohiko Araki', '36.90', 0, 5, 1),
(797, 'Jojo''s Bizarre Adventure', 102, 'Hirohiko Araki', '36.90', 0, 5, 1),
(798, 'Jojo''s Bizarre Adventure', 103, 'Hirohiko Araki', '36.90', 0, 5, 1),
(799, 'Jojo''s Bizarre Adventure', 104, 'Hirohiko Araki', '36.90', 0, 5, 1),
(800, 'Jojo''s Bizarre Adventure', 105, 'Hirohiko Araki', '36.90', 0, 5, 1),
(801, 'Jojo''s Bizarre Adventure', 106, 'Hirohiko Araki', '36.90', 0, 5, 1),
(802, 'Jojo''s Bizarre Adventure', 107, 'Hirohiko Araki', '36.90', 0, 5, 1);
INSERT INTO `mangas` (`manga_id`, `titulo`, `volume`, `autor`, `preco`, `quantidade_estoque`, `estoque_minimo`, `fornecedor_id_fk`) VALUES
(803, 'Jojo''s Bizarre Adventure', 108, 'Hirohiko Araki', '36.90', 0, 5, 1),
(804, 'Jojo''s Bizarre Adventure', 109, 'Hirohiko Araki', '36.90', 0, 5, 1),
(805, 'Jojo''s Bizarre Adventure', 110, 'Hirohiko Araki', '36.90', 0, 5, 1),
(806, 'Jojo''s Bizarre Adventure', 111, 'Hirohiko Araki', '36.90', 0, 5, 1),
(807, 'Jojo''s Bizarre Adventure', 112, 'Hirohiko Araki', '36.90', 0, 5, 1),
(808, 'Jojo''s Bizarre Adventure', 113, 'Hirohiko Araki', '36.90', 0, 5, 1),
(809, 'Jojo''s Bizarre Adventure', 114, 'Hirohiko Araki', '36.90', 0, 5, 1),
(810, 'Jojo''s Bizarre Adventure', 115, 'Hirohiko Araki', '36.90', 0, 5, 1),
(811, 'Jojo''s Bizarre Adventure', 116, 'Hirohiko Araki', '36.90', 0, 5, 1),
(812, 'Jojo''s Bizarre Adventure', 117, 'Hirohiko Araki', '36.90', 0, 5, 1),
(813, 'Jojo''s Bizarre Adventure', 118, 'Hirohiko Araki', '36.90', 0, 5, 1),
(814, 'Jojo''s Bizarre Adventure', 119, 'Hirohiko Araki', '36.90', 0, 5, 1),
(815, 'Jojo''s Bizarre Adventure', 120, 'Hirohiko Araki', '36.90', 0, 5, 1),
(816, 'Jojo''s Bizarre Adventure', 121, 'Hirohiko Araki', '36.90', 0, 5, 1),
(817, 'Jojo''s Bizarre Adventure', 122, 'Hirohiko Araki', '36.90', 0, 5, 1),
(818, 'Jojo''s Bizarre Adventure', 123, 'Hirohiko Araki', '36.90', 0, 5, 1),
(819, 'Jojo''s Bizarre Adventure', 124, 'Hirohiko Araki', '36.90', 0, 5, 1),
(820, 'Jojo''s Bizarre Adventure', 125, 'Hirohiko Araki', '36.90', 0, 5, 1),
(821, 'Jojo''s Bizarre Adventure', 126, 'Hirohiko Araki', '36.90', 0, 5, 1),
(822, 'Jojo''s Bizarre Adventure', 127, 'Hirohiko Araki', '36.90', 0, 5, 1),
(823, 'Jojo''s Bizarre Adventure', 128, 'Hirohiko Araki', '36.90', 0, 5, 1),
(824, 'Jojo''s Bizarre Adventure', 129, 'Hirohiko Araki', '36.90', 0, 5, 1),
(825, 'Jojo''s Bizarre Adventure', 130, 'Hirohiko Araki', '36.90', 0, 5, 1),
(826, 'Jojo''s Bizarre Adventure', 131, 'Hirohiko Araki', '36.90', 0, 5, 1),
(827, 'Fullmetal Alchemist', 1, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(828, 'Fullmetal Alchemist', 2, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(829, 'Fullmetal Alchemist', 3, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(830, 'Fullmetal Alchemist', 4, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(831, 'Fullmetal Alchemist', 5, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(832, 'Fullmetal Alchemist', 6, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(833, 'Fullmetal Alchemist', 7, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(834, 'Fullmetal Alchemist', 8, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(835, 'Fullmetal Alchemist', 9, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(836, 'Fullmetal Alchemist', 10, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(837, 'Fullmetal Alchemist', 11, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(838, 'Fullmetal Alchemist', 12, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(839, 'Fullmetal Alchemist', 13, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(840, 'Fullmetal Alchemist', 14, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(841, 'Fullmetal Alchemist', 15, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(842, 'Fullmetal Alchemist', 16, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(843, 'Fullmetal Alchemist', 17, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(844, 'Fullmetal Alchemist', 18, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(845, 'Fullmetal Alchemist', 19, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(846, 'Fullmetal Alchemist', 20, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(847, 'Fullmetal Alchemist', 21, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(848, 'Fullmetal Alchemist', 22, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(849, 'Fullmetal Alchemist', 23, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(850, 'Fullmetal Alchemist', 24, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(851, 'Fullmetal Alchemist', 25, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(852, 'Fullmetal Alchemist', 26, 'Hiromu Arakawa', '34.90', 0, 5, 2),
(853, 'Fullmetal Alchemist', 27, 'Hiromu Arakawa', '34.90', 0, 5, 2);

--
-- Acionadores `mangas`
--
DROP TRIGGER IF EXISTS `trg_check_estoque_before_update`;
DELIMITER //
CREATE TRIGGER `trg_check_estoque_before_update` BEFORE UPDATE ON `mangas`
 FOR EACH ROW BEGIN
    -- NEW.quantidade_estoque é o valor APÓS o update
    IF NEW.quantidade_estoque < 0 THEN
        -- Se for negativo, gera um erro customizado
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO: O estoque não pode ficar negativo.';
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE IF NOT EXISTS `vendas` (
  `venda_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_venda` datetime DEFAULT CURRENT_TIMESTAMP,
  `valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`venda_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`venda_id`, `data_venda`, `valor_total`) VALUES
(1, '2025-11-09 15:50:02', '385.00'),
(3, '2025-11-09 16:51:32', '108.00'),
(4, '2025-11-09 19:57:25', '136.80');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_itens`
--

CREATE TABLE IF NOT EXISTS `venda_itens` (
  `venda_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `venda_id_fk` int(11) DEFAULT NULL,
  `manga_id_fk` int(11) DEFAULT NULL,
  `quantidade_vendida` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`venda_item_id`),
  KEY `venda_id_fk` (`venda_id_fk`),
  KEY `manga_id_fk` (`manga_id_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `venda_itens`
--

INSERT INTO `venda_itens` (`venda_item_id`, `venda_id_fk`, `manga_id_fk`, `quantidade_vendida`, `preco_unitario`) VALUES
(1, 1, 1, 11, '35.00'),
(3, 3, 3, 1, '33.00'),
(4, 3, 5, 1, '43.00'),
(5, 3, 4, 1, '32.00'),
(6, 4, 3, 1, '33.00'),
(7, 4, 2, 1, '30.00'),
(8, 4, 352, 1, '36.90'),
(9, 4, 469, 1, '36.90');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `mangas`
--
ALTER TABLE `mangas`
  ADD CONSTRAINT `mangas_ibfk_1` FOREIGN KEY (`fornecedor_id_fk`) REFERENCES `fornecedores` (`fornecedor_id`);

--
-- Limitadores para a tabela `venda_itens`
--
ALTER TABLE `venda_itens`
  ADD CONSTRAINT `venda_itens_ibfk_1` FOREIGN KEY (`venda_id_fk`) REFERENCES `vendas` (`venda_id`),
  ADD CONSTRAINT `venda_itens_ibfk_2` FOREIGN KEY (`manga_id_fk`) REFERENCES `mangas` (`manga_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
