-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: hwatendimento
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `atendimentosequipamento`
--

DROP TABLE IF EXISTS `atendimentosequipamento`;
/*!50001 DROP VIEW IF EXISTS `atendimentosequipamento`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `atendimentosequipamento` AS SELECT 
 1 AS `data`,
 1 AS `cliente`,
 1 AS `descricao`,
 1 AS `numero_serie`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `atendimentoscomfiltro`
--

DROP TABLE IF EXISTS `atendimentoscomfiltro`;
/*!50001 DROP VIEW IF EXISTS `atendimentoscomfiltro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `atendimentoscomfiltro` AS SELECT 
 1 AS `inicio`,
 1 AS `modelo`,
 1 AS `numero_serie`,
 1 AS `Cliente`,
 1 AS `Telefone`,
 1 AS `duracao`,
 1 AS `descricao`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `atendimentosequipamento`
--

/*!50001 DROP VIEW IF EXISTS `atendimentosequipamento`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `atendimentosequipamento` AS select `atendimento`.`criado_em` AS `data`,`cliente`.`nome` AS `cliente`,`atendimento`.`descricao` AS `descricao`,`equipamento`.`numero_serie` AS `numero_serie` from ((`equipamento` join `atendimento` on((`atendimento`.`equipamento_id` = `equipamento`.`id`))) join `cliente` on((`atendimento`.`cliente_id` = `cliente`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `atendimentoscomfiltro`
--

/*!50001 DROP VIEW IF EXISTS `atendimentoscomfiltro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `atendimentoscomfiltro` AS select `atendimento`.`data_hora_inicio` AS `inicio`,`equipamento`.`modelo` AS `modelo`,`equipamento`.`numero_serie` AS `numero_serie`,`cliente`.`nome` AS `Cliente`,`cliente`.`telefone` AS `Telefone`,time_format(timediff(`atendimento`.`data_hora_fim`,`atendimento`.`data_hora_fim`),'%H:%i') AS `duracao`,`atendimento`.`descricao` AS `descricao` from ((`cliente` join `atendimento` on((`atendimento`.`cliente_id` = `cliente`.`id`))) join `equipamento` on((`equipamento`.`id` = `atendimento`.`equipamento_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-04 10:47:31
