TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER trg_check_estoque_before_update\nBEFORE UPDATE ON mangas\nFOR EACH ROW\nBEGIN\n    -- NEW.quantidade_estoque é o valor APÓS o update\n    IF NEW.quantidade_estoque < 0 THEN\n        -- Se for negativo, gera um erro customizado\n        SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = \'ERRO: O estoque não pode ficar negativo.\';\n    END IF;\nEND'
sql_modes=1073741824
definers='root@localhost'
client_cs_names='utf8'
connection_cl_names='utf8_general_ci'
db_cl_names='latin1_swedish_ci'
