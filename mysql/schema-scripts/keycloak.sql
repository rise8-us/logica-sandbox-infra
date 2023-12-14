-- MySQL dump 10.13  Distrib 8.0.27, for macos11.6 (x86_64)
--
-- Host: 127.0.0.1    Database: keycloak
-- ------------------------------------------------------
-- Server version	5.7.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `keycloak`
--

CREATE DATABASE  IF NOT EXISTS `keycloak` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `keycloak`;

CREATE USER keycloak@'%' IDENTIFIED BY 'keycloak';
GRANT ALL ON keycloak.* TO keycloak@'%';

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
                                      `ID` varchar(36) NOT NULL,
                                      `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
                                      `REALM_ID` varchar(255) DEFAULT NULL,
                                      `OPERATION_TYPE` varchar(255) DEFAULT NULL,
                                      `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
                                      `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
                                      `AUTH_USER_ID` varchar(255) DEFAULT NULL,
                                      `IP_ADDRESS` varchar(255) DEFAULT NULL,
                                      `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
                                      `REPRESENTATION` text,
                                      `ERROR` varchar(255) DEFAULT NULL,
                                      `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
                                      PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
                                     `POLICY_ID` varchar(36) NOT NULL,
                                     `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
                                     PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
                                     KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
                                     CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
                                     CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
INSERT INTO `ASSOCIATED_POLICY` VALUES ('ff0a0e08-266e-488f-beb5-2fe04275188e','79d4a3f6-7695-4882-96ac-9ee675b3e8c1');
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
                                            `ID` varchar(36) NOT NULL,
                                            `ALIAS` varchar(255) DEFAULT NULL,
                                            `AUTHENTICATOR` varchar(36) DEFAULT NULL,
                                            `REALM_ID` varchar(36) DEFAULT NULL,
                                            `FLOW_ID` varchar(36) DEFAULT NULL,
                                            `REQUIREMENT` int(11) DEFAULT NULL,
                                            `PRIORITY` int(11) DEFAULT NULL,
                                            `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
                                            `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
                                            `AUTH_CONFIG` varchar(36) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
                                            KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
                                            CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
                                            CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('03d4509e-f690-48a4-92dc-862c70d46a9a',NULL,'registration-user-creation','Development','ecd1b932-c1a2-49c1-8aae-77d2d308848a',0,20,_binary '\0',NULL,NULL),('0550fe72-a294-4dc0-86bc-dc83132a4995',NULL,NULL,'master','79de950e-0477-45e0-8bf3-71c61e721f55',2,20,_binary '','76347a6c-dbf6-48f3-926d-c5938d7e016e',NULL),('08601614-83f7-482f-a34c-050207377e70',NULL,NULL,'Development','12ad43db-4adf-4854-96cc-faaeddfb19ec',0,20,_binary '','e50db370-c012-43b2-a6be-66602fa309f9',NULL),('09a55916-d76c-4fe0-a58a-467e373a8fe1',NULL,'conditional-user-configured','Development','6d7f3f58-4808-4779-9449-d81ae72c7dbd',0,10,_binary '\0',NULL,NULL),('0add60c6-a9d7-4834-b205-93c47112a99c',NULL,'registration-profile-action','master','2b3932d1-8f6c-4e78-a7c8-d23a8e05230f',0,40,_binary '\0',NULL,NULL),('0bf227ae-7142-49f6-92c9-28fa3c33225c',NULL,'direct-grant-validate-password','Development','a5125d1c-7d2f-4003-a5ec-aed2bb454eb0',0,20,_binary '\0',NULL,NULL),('11d31921-9773-40b2-9251-32189a37cc3b',NULL,'conditional-user-configured','master','ad6640ba-2b29-496e-88a4-a426dd0d616d',0,10,_binary '\0',NULL,NULL),('124fc5b1-9763-452b-87cc-f6c738149c49',NULL,NULL,'master','6eefc0da-7608-4258-ae9c-5622e8d6e423',0,20,_binary '','79de950e-0477-45e0-8bf3-71c61e721f55',NULL),('1648526b-0178-44a9-b79b-dc73ec2b6a75',NULL,'reset-otp','Development','111f62b6-4a08-426d-ac9a-20564b57774f',0,20,_binary '\0',NULL,NULL),('1a819c87-f5e3-47ea-8f43-85d7a0262ceb',NULL,'auth-cookie','Development','edf01535-e5d0-406e-bacd-fbad9fe376c9',2,10,_binary '\0',NULL,NULL),('1c0122e6-1df4-4462-bf62-33ca4fd26b7d',NULL,'reset-otp','master','ad6640ba-2b29-496e-88a4-a426dd0d616d',0,20,_binary '\0',NULL,NULL),('1f77d379-7c52-4d0c-aab9-2186d3d0d8ec',NULL,NULL,'master','076dfcae-82b1-4e20-92e9-f3df7c3a07a1',0,20,_binary '','2c59b2f5-40d5-4d46-920c-dce890983e70',NULL),('2323d4fd-9637-46bf-aeb9-a21989311161',NULL,'client-secret-jwt','master','331abe46-cbc6-4f3f-b234-b7a13b359bfb',2,30,_binary '\0',NULL,NULL),('2424a738-b8fc-4e25-b4bd-37807d2a910e',NULL,NULL,'Development','c35412fc-3228-41f5-8d1d-de9f57c30315',1,20,_binary '','6d7f3f58-4808-4779-9449-d81ae72c7dbd',NULL),('266b96f2-4274-4c23-b601-edf048d7c5a5',NULL,NULL,'Development','8e040d01-be68-44d0-ab7f-cf9930c951f2',2,20,_binary '','12ad43db-4adf-4854-96cc-faaeddfb19ec',NULL),('2b411f88-29db-46ae-928e-907d5e98a236',NULL,'idp-username-password-form','Development','16173531-5673-4417-8408-118473dcfcf1',0,10,_binary '\0',NULL,NULL),('301921fc-26d1-4a59-a951-a5642510d5ae',NULL,'registration-profile-action','Development','ecd1b932-c1a2-49c1-8aae-77d2d308848a',0,40,_binary '\0',NULL,NULL),('36dacc39-893a-45a1-8ed8-b505e6666f4c',NULL,'conditional-user-configured','Development','ba827af6-1f49-4823-a2d5-65624f9aa225',0,10,_binary '\0',NULL,NULL),('3b900cd3-2f38-4a9e-8373-77ad23033d67',NULL,'direct-grant-validate-password','master','527111f0-56a7-4568-ba56-2ef990fafffc',0,20,_binary '\0',NULL,NULL),('3ea5596e-246c-40a3-aff0-c8cff2e334a7',NULL,'reset-password','master','b3005756-35cb-4be3-ac46-cc053df1260c',0,30,_binary '\0',NULL,NULL),('44086212-6a0f-48b6-b258-9b9114401e18',NULL,'registration-recaptcha-action','master','2b3932d1-8f6c-4e78-a7c8-d23a8e05230f',3,60,_binary '\0',NULL,NULL),('48588b61-2b51-4bc3-b3a3-7ac031254c57',NULL,'auth-otp-form','Development','6d7f3f58-4808-4779-9449-d81ae72c7dbd',0,20,_binary '\0',NULL,NULL),('4de31e1b-731b-4c38-be1d-ef8cef31d7a9',NULL,'no-cookie-redirect','Development','a70842e4-c734-4ec1-96bb-ddf88c64fd13',0,10,_binary '\0',NULL,NULL),('4fcba348-4607-4641-a2d6-1ba5b2ae4e68',NULL,'direct-grant-validate-otp','Development','ba827af6-1f49-4823-a2d5-65624f9aa225',0,20,_binary '\0',NULL,NULL),('4ff886f1-a595-4d68-a8af-39788fccecd7',NULL,'idp-review-profile','Development','e8a4b739-f07c-48d3-ae9b-4e751dbf7085',0,10,_binary '\0',NULL,'ed8125b0-d8a6-4a09-bcfd-7232ec3b21d8'),('512dabcf-5c74-448c-8c6b-ee518943e570',NULL,NULL,'master','a0c7d07a-0454-4b90-ad38-ce1608196883',2,30,_binary '','834be99d-98d8-4787-98de-ccc107410e93',NULL),('5202ef39-9652-4c2e-a357-7dcf4c141dfa',NULL,'auth-username-password-form','master','834be99d-98d8-4787-98de-ccc107410e93',0,10,_binary '\0',NULL,NULL),('55b0c21f-9587-43e8-8803-33721d00ec97',NULL,'auth-cookie','master','a0c7d07a-0454-4b90-ad38-ce1608196883',2,10,_binary '\0',NULL,NULL),('55bc9415-745a-4191-a65a-685b253d1a6e',NULL,'client-jwt','master','331abe46-cbc6-4f3f-b234-b7a13b359bfb',2,20,_binary '\0',NULL,NULL),('55d434f2-90fe-426c-a1bc-d2de3c5c1965',NULL,'registration-user-creation','master','2b3932d1-8f6c-4e78-a7c8-d23a8e05230f',0,20,_binary '\0',NULL,NULL),('567744e2-5048-486e-9cb5-40fa1e39cbac',NULL,'client-x509','Development','fcfdc299-627c-494e-ab63-300495f41200',2,40,_binary '\0',NULL,NULL),('5dbae8e1-ee85-4c09-b6d0-9c2c8f1ab057',NULL,NULL,'Development','a5125d1c-7d2f-4003-a5ec-aed2bb454eb0',1,30,_binary '','ba827af6-1f49-4823-a2d5-65624f9aa225',NULL),('5f6a7b9b-b619-4718-8f80-09910bb2045b',NULL,'conditional-user-configured','master','004c3e01-6cc8-487f-8f70-f641fe53fa49',0,10,_binary '\0',NULL,NULL),('61a68e79-31ff-4a21-8017-940dfd5f4204',NULL,'auth-spnego','master','a0c7d07a-0454-4b90-ad38-ce1608196883',3,20,_binary '\0',NULL,NULL),('61bc1faa-fef6-4e23-9332-ae7920dc305b',NULL,NULL,'Development','e50db370-c012-43b2-a6be-66602fa309f9',2,20,_binary '','16173531-5673-4417-8408-118473dcfcf1',NULL),('63043fba-d405-4547-a78a-3a48914eb5cd',NULL,'client-secret','master','331abe46-cbc6-4f3f-b234-b7a13b359bfb',2,10,_binary '\0',NULL,NULL),('697535e5-3056-493e-a95e-fadcad213bce',NULL,'idp-username-password-form','master','db1b6abb-0d78-4fa0-9674-1eec08460b49',0,10,_binary '\0',NULL,NULL),('6ad9786a-8a92-4af6-ba06-2d4273d02e68',NULL,'idp-review-profile','master','6eefc0da-7608-4258-ae9c-5622e8d6e423',0,10,_binary '\0',NULL,'498bfff8-37e2-41e4-ab91-9fd3a40f130d'),('6c4ec5cf-3760-45e1-af42-85109c5ad4bb',NULL,'conditional-user-configured','Development','111f62b6-4a08-426d-ac9a-20564b57774f',0,10,_binary '\0',NULL,NULL),('6d27859b-854c-48c0-b0d3-f121acc4516a',NULL,'basic-auth-otp','Development','2613f9f8-9024-4288-9702-4df8f55d3eed',3,20,_binary '\0',NULL,NULL),('6f2284d6-8715-46ef-908c-565f18dc9f72',NULL,'idp-confirm-link','Development','12ad43db-4adf-4854-96cc-faaeddfb19ec',0,10,_binary '\0',NULL,NULL),('73aff56b-d104-405a-9938-c05f7b38beb7',NULL,'reset-credential-email','master','b3005756-35cb-4be3-ac46-cc053df1260c',0,20,_binary '\0',NULL,NULL),('740320b9-794e-4593-a7d6-f1c130824d01',NULL,'auth-username-password-form','Development','c35412fc-3228-41f5-8d1d-de9f57c30315',0,10,_binary '\0',NULL,NULL),('78851a5a-cde9-4e49-852b-df3308f9832d',NULL,'basic-auth','Development','2613f9f8-9024-4288-9702-4df8f55d3eed',0,10,_binary '\0',NULL,NULL),('79181a11-532d-4774-b3de-7641c38d6c75',NULL,'client-jwt','Development','fcfdc299-627c-494e-ab63-300495f41200',2,20,_binary '\0',NULL,NULL),('79773526-8e27-42bb-bad4-d302c777ed27',NULL,'direct-grant-validate-username','Development','a5125d1c-7d2f-4003-a5ec-aed2bb454eb0',0,10,_binary '\0',NULL,NULL),('79e88fe8-a015-48a0-930e-70fbecf494cb',NULL,'idp-confirm-link','master','76347a6c-dbf6-48f3-926d-c5938d7e016e',0,10,_binary '\0',NULL,NULL),('7f5e2bea-ebd1-4b35-adcc-d20769ece6c1',NULL,NULL,'Development','edf01535-e5d0-406e-bacd-fbad9fe376c9',2,30,_binary '','c35412fc-3228-41f5-8d1d-de9f57c30315',NULL),('84da4546-a9e5-4d62-80d9-368594bb32c4',NULL,'identity-provider-redirector','master','a0c7d07a-0454-4b90-ad38-ce1608196883',2,25,_binary '\0',NULL,NULL),('8523f24f-3eee-4ff0-84bb-aeac2be3e961',NULL,'registration-password-action','Development','ecd1b932-c1a2-49c1-8aae-77d2d308848a',0,50,_binary '\0',NULL,NULL),('85d46de7-a67b-45cf-9c80-8ad3a81579a5',NULL,'identity-provider-redirector','Development','edf01535-e5d0-406e-bacd-fbad9fe376c9',2,25,_binary '\0',NULL,NULL),('89eb20d6-0637-4a97-8d3e-5578d6046ded',NULL,'registration-recaptcha-action','Development','ecd1b932-c1a2-49c1-8aae-77d2d308848a',3,60,_binary '\0',NULL,NULL),('8a7145e4-3b2d-47ac-8897-eed801aeec45',NULL,'direct-grant-validate-otp','master','2b2c0880-37ac-4e24-b842-99f4070539b6',0,20,_binary '\0',NULL,NULL),('8a83bf5e-0f06-4ec5-959e-a8fdead3c8f1',NULL,'conditional-user-configured','master','2b2c0880-37ac-4e24-b842-99f4070539b6',0,10,_binary '\0',NULL,NULL),('8fdf76e9-6cb6-49d1-b0d1-7a0d946e4f54',NULL,'auth-otp-form','master','004c3e01-6cc8-487f-8f70-f641fe53fa49',0,20,_binary '\0',NULL,NULL),('93385ebd-8f01-44b7-880a-392d6bc6891b',NULL,'client-secret','Development','fcfdc299-627c-494e-ab63-300495f41200',2,10,_binary '\0',NULL,NULL),('95425df7-fffb-4628-b831-ac4114aafe00',NULL,'basic-auth-otp','master','2c59b2f5-40d5-4d46-920c-dce890983e70',3,20,_binary '\0',NULL,NULL),('9973d010-691b-4172-b9cf-1c58ea3f7308',NULL,'reset-credentials-choose-user','Development','7251ae01-42c3-48a5-a302-2548e8b88eea',0,10,_binary '\0',NULL,NULL),('a0a32549-4255-4192-812b-e6dfb7b99917',NULL,NULL,'master','db1b6abb-0d78-4fa0-9674-1eec08460b49',1,20,_binary '','0bae2621-19d5-462b-ac02-5c43fd37f038',NULL),('a13c1b4e-8c92-4395-a747-411d0c032564',NULL,NULL,'Development','7251ae01-42c3-48a5-a302-2548e8b88eea',1,40,_binary '','111f62b6-4a08-426d-ac9a-20564b57774f',NULL),('a750f728-6f4e-42ff-9ae2-bebeae77e649',NULL,'http-basic-authenticator','Development','8fc6cad5-5f70-4b9f-b234-5c8696ef667c',0,10,_binary '\0',NULL,NULL),('a771601e-147f-4506-a7c5-3afc19ff9425',NULL,NULL,'master','b3005756-35cb-4be3-ac46-cc053df1260c',1,40,_binary '','ad6640ba-2b29-496e-88a4-a426dd0d616d',NULL),('a7cfd41b-8c7d-457a-90e3-13df1595acb0',NULL,'idp-create-user-if-unique','Development','8e040d01-be68-44d0-ab7f-cf9930c951f2',2,10,_binary '\0',NULL,'6cdddabb-6217-434e-b4de-b6c307976c9f'),('ac4badf6-2e2f-4ab7-a768-d7b2615cc987',NULL,NULL,'master','527111f0-56a7-4568-ba56-2ef990fafffc',1,30,_binary '','2b2c0880-37ac-4e24-b842-99f4070539b6',NULL),('b036add0-1345-44a6-b911-46973880ebb7',NULL,'idp-email-verification','Development','e50db370-c012-43b2-a6be-66602fa309f9',2,10,_binary '\0',NULL,NULL),('b0e0fb4e-942a-4627-8c8c-68dda7d742f9',NULL,'basic-auth','master','2c59b2f5-40d5-4d46-920c-dce890983e70',0,10,_binary '\0',NULL,NULL),('b378aaa8-099d-49e4-9f8f-beb6be4ab970',NULL,'direct-grant-validate-username','master','527111f0-56a7-4568-ba56-2ef990fafffc',0,10,_binary '\0',NULL,NULL),('ba85ce3a-6716-49c5-b28e-d405678381ea',NULL,'idp-create-user-if-unique','master','79de950e-0477-45e0-8bf3-71c61e721f55',2,10,_binary '\0',NULL,'0d6b12ef-3582-453d-93fb-0aa41503b857'),('bdde7575-b7a6-4a6f-8914-c12224383802',NULL,NULL,'master','76347a6c-dbf6-48f3-926d-c5938d7e016e',0,20,_binary '','12bdb7ce-a297-4bb0-86c0-f0fa49140d13',NULL),('bef101f2-c5bf-4704-9749-7d7eca64fd12',NULL,NULL,'Development','e8a4b739-f07c-48d3-ae9b-4e751dbf7085',0,20,_binary '','8e040d01-be68-44d0-ab7f-cf9930c951f2',NULL),('c05db091-26b8-4971-a510-d4abd1714b79',NULL,'idp-email-verification','master','12bdb7ce-a297-4bb0-86c0-f0fa49140d13',2,10,_binary '\0',NULL,NULL),('c27b4a89-2b79-48a9-9a71-37bc2ac7ef8f',NULL,'registration-password-action','master','2b3932d1-8f6c-4e78-a7c8-d23a8e05230f',0,50,_binary '\0',NULL,NULL),('c4956f32-2e59-4be9-913a-82911131c157',NULL,'registration-page-form','master','b5a14e95-a964-45a1-b7df-1c542dc30ace',0,10,_binary '','2b3932d1-8f6c-4e78-a7c8-d23a8e05230f',NULL),('c4c1cee0-4766-45dc-b94e-c4d42a31ceec',NULL,'registration-page-form','Development','673ab45f-b084-4a5b-90d5-7ec680f6a5ae',0,10,_binary '','ecd1b932-c1a2-49c1-8aae-77d2d308848a',NULL),('c5816dc9-d501-4498-a145-edb83e4a2fa7',NULL,NULL,'master','834be99d-98d8-4787-98de-ccc107410e93',1,20,_binary '','004c3e01-6cc8-487f-8f70-f641fe53fa49',NULL),('c5baa73f-0de5-4a13-8f35-ee54162dfef9',NULL,'auth-spnego','Development','2613f9f8-9024-4288-9702-4df8f55d3eed',3,30,_binary '\0',NULL,NULL),('c62be433-4c28-4d79-bd69-a886c6d97270',NULL,'docker-http-basic-authenticator','master','19522276-1536-4d10-af88-5ff93a04cf6a',0,10,_binary '\0',NULL,NULL),('cb94309f-d4f3-47f8-9b3a-0b2bc0c338b1',NULL,'docker-http-basic-authenticator','Development','8892faf4-be52-4d50-8b76-1cc35551ccef',0,10,_binary '\0',NULL,NULL),('d0166d72-2f42-4461-817d-5b4f937197bc',NULL,'reset-credentials-choose-user','master','b3005756-35cb-4be3-ac46-cc053df1260c',0,10,_binary '\0',NULL,NULL),('d582ec17-a744-42ff-b57d-3a71710b4b93',NULL,'reset-password','Development','7251ae01-42c3-48a5-a302-2548e8b88eea',0,30,_binary '\0',NULL,NULL),('d64c8037-0a98-4ac9-ac14-3f3486abaf85',NULL,NULL,'Development','16173531-5673-4417-8408-118473dcfcf1',1,20,_binary '','44142ce4-0e92-43ee-a6db-3bd2feef5aa3',NULL),('d6d0c6ce-8a36-440f-8595-a325f53a7bf1',NULL,'reset-credential-email','Development','7251ae01-42c3-48a5-a302-2548e8b88eea',0,20,_binary '\0',NULL,NULL),('ddb6366c-a374-4f1d-ac4d-ee4431110426',NULL,'auth-otp-form','master','0bae2621-19d5-462b-ac02-5c43fd37f038',0,20,_binary '\0',NULL,NULL),('e5fa8963-9f62-4fad-8747-e9ea5c63f537',NULL,'no-cookie-redirect','master','076dfcae-82b1-4e20-92e9-f3df7c3a07a1',0,10,_binary '\0',NULL,NULL),('e661a9fc-5c48-465d-ab60-019ca2fc5798',NULL,'auth-otp-form','Development','44142ce4-0e92-43ee-a6db-3bd2feef5aa3',0,20,_binary '\0',NULL,NULL),('eb97fcc6-5eda-457a-855e-165da019c130',NULL,'auth-spnego','master','2c59b2f5-40d5-4d46-920c-dce890983e70',3,30,_binary '\0',NULL,NULL),('ef4e9eef-51a4-4e2b-9cd5-fccc2d9082f2',NULL,'http-basic-authenticator','master','2af64e53-b6ab-4562-825e-04ec5ed3280e',0,10,_binary '\0',NULL,NULL),('f082b5fa-0692-411b-a705-7b9da999dcd4',NULL,'conditional-user-configured','Development','44142ce4-0e92-43ee-a6db-3bd2feef5aa3',0,10,_binary '\0',NULL,NULL),('f10437a5-7d5d-47bc-9aca-2ae0ae56ddd3',NULL,NULL,'master','12bdb7ce-a297-4bb0-86c0-f0fa49140d13',2,20,_binary '','db1b6abb-0d78-4fa0-9674-1eec08460b49',NULL),('f249b18c-48fe-4d33-b814-a1352436039b',NULL,NULL,'Development','a70842e4-c734-4ec1-96bb-ddf88c64fd13',0,20,_binary '','2613f9f8-9024-4288-9702-4df8f55d3eed',NULL),('f8f6501c-d27a-42a2-a57a-6499be2f172b',NULL,'client-x509','master','331abe46-cbc6-4f3f-b234-b7a13b359bfb',2,40,_binary '\0',NULL,NULL),('f92c4add-d12b-4802-b5ec-f0a5db9baae6',NULL,'client-secret-jwt','Development','fcfdc299-627c-494e-ab63-300495f41200',2,30,_binary '\0',NULL,NULL),('f9493300-0d0e-4358-8bb5-acf10c616460',NULL,'auth-spnego','Development','edf01535-e5d0-406e-bacd-fbad9fe376c9',3,20,_binary '\0',NULL,NULL),('fb3bea56-afc9-4c97-8c3a-ad9b58d7e0c2',NULL,'conditional-user-configured','master','0bae2621-19d5-462b-ac02-5c43fd37f038',0,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
                                       `ID` varchar(36) NOT NULL,
                                       `ALIAS` varchar(255) DEFAULT NULL,
                                       `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                       `REALM_ID` varchar(36) DEFAULT NULL,
                                       `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
                                       `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
                                       `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
                                       PRIMARY KEY (`ID`),
                                       KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
                                       CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('004c3e01-6cc8-487f-8f70-f641fe53fa49','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('076dfcae-82b1-4e20-92e9-f3df7c3a07a1','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('0bae2621-19d5-462b-ac02-5c43fd37f038','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('111f62b6-4a08-426d-ac9a-20564b57774f','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','Development','basic-flow',_binary '\0',_binary ''),('12ad43db-4adf-4854-96cc-faaeddfb19ec','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','Development','basic-flow',_binary '\0',_binary ''),('12bdb7ce-a297-4bb0-86c0-f0fa49140d13','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('16173531-5673-4417-8408-118473dcfcf1','Verify Existing Account by Re-authentication','Reauthentication of existing account','Development','basic-flow',_binary '\0',_binary ''),('19522276-1536-4d10-af88-5ff93a04cf6a','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('2613f9f8-9024-4288-9702-4df8f55d3eed','Authentication Options','Authentication options.','Development','basic-flow',_binary '\0',_binary ''),('2af64e53-b6ab-4562-825e-04ec5ed3280e','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('2b2c0880-37ac-4e24-b842-99f4070539b6','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('2b3932d1-8f6c-4e78-a7c8-d23a8e05230f','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('2c59b2f5-40d5-4d46-920c-dce890983e70','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('331abe46-cbc6-4f3f-b234-b7a13b359bfb','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('44142ce4-0e92-43ee-a6db-3bd2feef5aa3','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','Development','basic-flow',_binary '\0',_binary ''),('527111f0-56a7-4568-ba56-2ef990fafffc','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('673ab45f-b084-4a5b-90d5-7ec680f6a5ae','registration','registration flow','Development','basic-flow',_binary '',_binary ''),('6d7f3f58-4808-4779-9449-d81ae72c7dbd','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','Development','basic-flow',_binary '\0',_binary ''),('6eefc0da-7608-4258-ae9c-5622e8d6e423','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('7251ae01-42c3-48a5-a302-2548e8b88eea','reset credentials','Reset credentials for a user if they forgot their password or something','Development','basic-flow',_binary '',_binary ''),('76347a6c-dbf6-48f3-926d-c5938d7e016e','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('79de950e-0477-45e0-8bf3-71c61e721f55','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('834be99d-98d8-4787-98de-ccc107410e93','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('8892faf4-be52-4d50-8b76-1cc35551ccef','docker auth','Used by Docker clients to authenticate against the IDP','Development','basic-flow',_binary '',_binary ''),('8e040d01-be68-44d0-ab7f-cf9930c951f2','User creation or linking','Flow for the existing/non-existing user alternatives','Development','basic-flow',_binary '\0',_binary ''),('8fc6cad5-5f70-4b9f-b234-5c8696ef667c','saml ecp','SAML ECP Profile Authentication Flow','Development','basic-flow',_binary '',_binary ''),('a0c7d07a-0454-4b90-ad38-ce1608196883','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('a5125d1c-7d2f-4003-a5ec-aed2bb454eb0','direct grant','OpenID Connect Resource Owner Grant','Development','basic-flow',_binary '',_binary ''),('a70842e4-c734-4ec1-96bb-ddf88c64fd13','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','Development','basic-flow',_binary '',_binary ''),('ad6640ba-2b29-496e-88a4-a426dd0d616d','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('b3005756-35cb-4be3-ac46-cc053df1260c','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('b5a14e95-a964-45a1-b7df-1c542dc30ace','registration','registration flow','master','basic-flow',_binary '',_binary ''),('ba827af6-1f49-4823-a2d5-65624f9aa225','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','Development','basic-flow',_binary '\0',_binary ''),('c35412fc-3228-41f5-8d1d-de9f57c30315','forms','Username, password, otp and other auth forms.','Development','basic-flow',_binary '\0',_binary ''),('db1b6abb-0d78-4fa0-9674-1eec08460b49','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('e50db370-c012-43b2-a6be-66602fa309f9','Account verification options','Method with which to verity the existing account','Development','basic-flow',_binary '\0',_binary ''),('e8a4b739-f07c-48d3-ae9b-4e751dbf7085','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','Development','basic-flow',_binary '',_binary ''),('ecd1b932-c1a2-49c1-8aae-77d2d308848a','registration form','registration form','Development','form-flow',_binary '\0',_binary ''),('edf01535-e5d0-406e-bacd-fbad9fe376c9','browser','browser based authentication','Development','basic-flow',_binary '',_binary ''),('fcfdc299-627c-494e-ab63-300495f41200','clients','Base authentication for clients','Development','client-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
                                        `ID` varchar(36) NOT NULL,
                                        `ALIAS` varchar(255) DEFAULT NULL,
                                        `REALM_ID` varchar(36) DEFAULT NULL,
                                        PRIMARY KEY (`ID`),
                                        KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
                                        CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('0d6b12ef-3582-453d-93fb-0aa41503b857','create unique user config','master'),('498bfff8-37e2-41e4-ab91-9fd3a40f130d','review profile config','master'),('6cdddabb-6217-434e-b4de-b6c307976c9f','create unique user config','Development'),('ed8125b0-d8a6-4a09-bcfd-7232ec3b21d8','review profile config','Development');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
                                              `AUTHENTICATOR_ID` varchar(36) NOT NULL,
                                              `VALUE` longtext,
                                              `NAME` varchar(255) NOT NULL,
                                              PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('0d6b12ef-3582-453d-93fb-0aa41503b857','false','require.password.update.after.registration'),('498bfff8-37e2-41e4-ab91-9fd3a40f130d','missing','update.profile.on.first.login'),('6cdddabb-6217-434e-b4de-b6c307976c9f','false','require.password.update.after.registration'),('ed8125b0-d8a6-4a09-bcfd-7232ec3b21d8','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
                               `IDENTITY_PROVIDER` varchar(255) NOT NULL,
                               `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
                               `REALM_ID` varchar(36) NOT NULL,
                               `BROKER_USER_ID` varchar(255) DEFAULT NULL,
                               `BROKER_USERNAME` varchar(255) DEFAULT NULL,
                               `TOKEN` text,
                               `USER_ID` varchar(255) NOT NULL,
                               PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
                          `ID` varchar(36) NOT NULL,
                          `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                          `CLIENT_ID` varchar(255) DEFAULT NULL,
                          `NOT_BEFORE` int(11) DEFAULT NULL,
                          `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
                          `SECRET` varchar(255) DEFAULT NULL,
                          `BASE_URL` varchar(255) DEFAULT NULL,
                          `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
                          `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
                          `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
                          `REALM_ID` varchar(36) DEFAULT NULL,
                          `PROTOCOL` varchar(255) DEFAULT NULL,
                          `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
                          `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
                          `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
                          `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                          `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
                          `ROOT_URL` varchar(255) DEFAULT NULL,
                          `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                          `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
                          `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
                          `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                          `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
                          PRIMARY KEY (`ID`),
                          UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
                          KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0a01a21c-27ea-4580-a411-d37cdc6a34ba',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06',_binary '',_binary '\0','broker',0,_binary '\0','**********',NULL,_binary '\0',NULL,_binary '\0','Development','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('2d328edb-3511-4289-89d3-f77876b8ad24',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('321c27d5-f3c5-407a-9832-006a86070cc2',_binary '',_binary '\0','account-console',0,_binary '','**********','/realms/Development/account/',_binary '\0',NULL,_binary '\0','Development','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3a7b4987-7250-43cd-9967-8f9018d962e7',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('596372dd-e55d-4b73-b324-e18847c0d57f',_binary '',_binary '\0','security-admin-console',0,_binary '','**********','/admin/Development/console/',_binary '\0',NULL,_binary '\0','Development','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',_binary '',_binary '\0','account',0,_binary '\0','**********','/realms/Development/account/',_binary '\0',NULL,_binary '\0','Development','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('8bd89bf9-1cde-49ce-8b4e-270e13cf1a44',_binary '',_binary '\0','admin-cli',0,_binary '','**********',NULL,_binary '\0',NULL,_binary '\0','Development','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('962df3c7-34b6-49a6-977b-21e820d49d65',_binary '',_binary '\0','realm-management',0,_binary '\0','**********',NULL,_binary '',NULL,_binary '\0','Development','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9c21cc16-bf32-4420-8ab1-235022f00958',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '',_binary '\0','Development-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','Development Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b0aa1970-e558-4014-8f56-9086d2a6cebd',_binary '',_binary '','reference-auth',0,_binary '\0','593ada9c-b1dc-444f-a2e6-30cc4add8146','http://sandbox:8060/authorize',_binary '\0','http://sandbox:8060/*',_binary '\0','Development','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('dfeb885d-1411-41e3-98c7-f2532b11f386',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
                                     `CLIENT_ID` varchar(36) NOT NULL,
                                     `VALUE` varchar(4000) DEFAULT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     PRIMARY KEY (`CLIENT_ID`,`NAME`),
                                     KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
                                     CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('2d328edb-3511-4289-89d3-f77876b8ad24','S256','pkce.code.challenge.method'),('321c27d5-f3c5-407a-9832-006a86070cc2','S256','pkce.code.challenge.method'),('596372dd-e55d-4b73-b324-e18847c0d57f','S256','pkce.code.challenge.method'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','28800','access.token.lifespan'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','display.on.consent.screen'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','exclude.session.state.from.auth.response'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml.assertion.signature'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml.authnstatement'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml.client.signature'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml.encrypt'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml.force.post.binding'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml.multivalued.roles'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml.onetimeuse.condition'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml.server.signature'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml.server.signature.keyinfo.ext'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','saml_force_name_id_format'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','false','tls.client.certificate.bound.access.tokens'),('dfeb885d-1411-41e3-98c7-f2532b11f386','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
                                             `CLIENT_ID` varchar(36) NOT NULL,
                                             `FLOW_ID` varchar(36) DEFAULT NULL,
                                             `BINDING_NAME` varchar(255) NOT NULL,
                                             PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
                                         `ID` varchar(36) NOT NULL,
                                         `REALM_ID` varchar(36) NOT NULL,
                                         `TIMESTAMP` int(11) DEFAULT NULL,
                                         `EXPIRATION` int(11) DEFAULT NULL,
                                         `COUNT` int(11) DEFAULT NULL,
                                         `REMAINING_COUNT` int(11) DEFAULT NULL,
                                         PRIMARY KEY (`ID`),
                                         KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
                                         CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
                                             `CLIENT_ID` varchar(36) NOT NULL,
                                             `VALUE` int(11) DEFAULT NULL,
                                             `NAME` varchar(255) NOT NULL,
                                             PRIMARY KEY (`CLIENT_ID`,`NAME`),
                                             CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
                                `ID` varchar(36) NOT NULL,
                                `NAME` varchar(255) DEFAULT NULL,
                                `REALM_ID` varchar(36) DEFAULT NULL,
                                `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                `PROTOCOL` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`),
                                UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
                                KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('08548448-54c8-4072-98b9-e0f563e01c55','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('11c0fa93-71bc-4600-bcab-1faea41eb115','address','master','OpenID Connect built-in scope: address','openid-connect'),('25129e87-3873-4424-9b7e-df0d881e71ca','email','Development','OpenID Connect built-in scope: email','openid-connect'),('27eed4ff-e948-45f4-b154-3abbde982900','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('3f053da8-b1eb-45af-8ca3-82b97e572149','address','Development','OpenID Connect built-in scope: address','openid-connect'),('438a8bad-bdf3-4d35-95c6-1e5e48afb7ae','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('46b6b9ce-9ff9-403e-afe5-459d6b5777db','offline_access','Development','OpenID Connect built-in scope: offline_access','openid-connect'),('47b4034c-243c-44ba-804c-17298c802870','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('487de97b-50a1-4013-ba27-6ae576b4161e','role_list','master','SAML role list','saml'),('59b2cfa2-f364-46c7-bee2-66c7c01ab793','email','master','OpenID Connect built-in scope: email','openid-connect'),('5c3d190b-68c1-4fd1-8267-175b07ab2855','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('5df8afcc-6caa-48aa-8fc1-356b4bb62ff2','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7','microprofile-jwt','Development','Microprofile - JWT built-in scope','openid-connect'),('c745fc8f-e6f0-4993-b6e8-df4c0d15b09c','profile','Development','OpenID Connect built-in scope: profile','openid-connect'),('ea0af24d-22aa-4ba0-bd52-52a2ba30d2a9','role_list','Development','SAML role list','saml'),('f5f24bf7-1361-49f5-bb85-6b3b1e0923d5','web-origins','Development','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('f99f3aff-0cf3-449a-9e9c-858e126640f3','phone','Development','OpenID Connect built-in scope: phone','openid-connect'),('fb556c63-9a66-432b-b722-dc17474660b4','roles','Development','OpenID Connect scope for add user roles to the access token','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
                                           `SCOPE_ID` varchar(36) NOT NULL,
                                           `VALUE` varchar(2048) DEFAULT NULL,
                                           `NAME` varchar(255) NOT NULL,
                                           PRIMARY KEY (`SCOPE_ID`,`NAME`),
                                           KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
                                           CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('08548448-54c8-4072-98b9-e0f563e01c55','false','display.on.consent.screen'),('08548448-54c8-4072-98b9-e0f563e01c55','true','include.in.token.scope'),('11c0fa93-71bc-4600-bcab-1faea41eb115','${addressScopeConsentText}','consent.screen.text'),('11c0fa93-71bc-4600-bcab-1faea41eb115','true','display.on.consent.screen'),('11c0fa93-71bc-4600-bcab-1faea41eb115','true','include.in.token.scope'),('25129e87-3873-4424-9b7e-df0d881e71ca','${emailScopeConsentText}','consent.screen.text'),('25129e87-3873-4424-9b7e-df0d881e71ca','true','display.on.consent.screen'),('25129e87-3873-4424-9b7e-df0d881e71ca','true','include.in.token.scope'),('27eed4ff-e948-45f4-b154-3abbde982900','${profileScopeConsentText}','consent.screen.text'),('27eed4ff-e948-45f4-b154-3abbde982900','true','display.on.consent.screen'),('27eed4ff-e948-45f4-b154-3abbde982900','true','include.in.token.scope'),('3f053da8-b1eb-45af-8ca3-82b97e572149','${addressScopeConsentText}','consent.screen.text'),('3f053da8-b1eb-45af-8ca3-82b97e572149','true','display.on.consent.screen'),('3f053da8-b1eb-45af-8ca3-82b97e572149','true','include.in.token.scope'),('438a8bad-bdf3-4d35-95c6-1e5e48afb7ae','${phoneScopeConsentText}','consent.screen.text'),('438a8bad-bdf3-4d35-95c6-1e5e48afb7ae','true','display.on.consent.screen'),('438a8bad-bdf3-4d35-95c6-1e5e48afb7ae','true','include.in.token.scope'),('46b6b9ce-9ff9-403e-afe5-459d6b5777db','${offlineAccessScopeConsentText}','consent.screen.text'),('46b6b9ce-9ff9-403e-afe5-459d6b5777db','true','display.on.consent.screen'),('47b4034c-243c-44ba-804c-17298c802870','${rolesScopeConsentText}','consent.screen.text'),('47b4034c-243c-44ba-804c-17298c802870','true','display.on.consent.screen'),('47b4034c-243c-44ba-804c-17298c802870','false','include.in.token.scope'),('487de97b-50a1-4013-ba27-6ae576b4161e','${samlRoleListScopeConsentText}','consent.screen.text'),('487de97b-50a1-4013-ba27-6ae576b4161e','true','display.on.consent.screen'),('59b2cfa2-f364-46c7-bee2-66c7c01ab793','${emailScopeConsentText}','consent.screen.text'),('59b2cfa2-f364-46c7-bee2-66c7c01ab793','true','display.on.consent.screen'),('59b2cfa2-f364-46c7-bee2-66c7c01ab793','true','include.in.token.scope'),('5c3d190b-68c1-4fd1-8267-175b07ab2855','','consent.screen.text'),('5c3d190b-68c1-4fd1-8267-175b07ab2855','false','display.on.consent.screen'),('5c3d190b-68c1-4fd1-8267-175b07ab2855','false','include.in.token.scope'),('5df8afcc-6caa-48aa-8fc1-356b4bb62ff2','${offlineAccessScopeConsentText}','consent.screen.text'),('5df8afcc-6caa-48aa-8fc1-356b4bb62ff2','true','display.on.consent.screen'),('acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7','false','display.on.consent.screen'),('acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7','true','include.in.token.scope'),('c745fc8f-e6f0-4993-b6e8-df4c0d15b09c','${profileScopeConsentText}','consent.screen.text'),('c745fc8f-e6f0-4993-b6e8-df4c0d15b09c','true','display.on.consent.screen'),('c745fc8f-e6f0-4993-b6e8-df4c0d15b09c','true','include.in.token.scope'),('ea0af24d-22aa-4ba0-bd52-52a2ba30d2a9','${samlRoleListScopeConsentText}','consent.screen.text'),('ea0af24d-22aa-4ba0-bd52-52a2ba30d2a9','true','display.on.consent.screen'),('f5f24bf7-1361-49f5-bb85-6b3b1e0923d5','','consent.screen.text'),('f5f24bf7-1361-49f5-bb85-6b3b1e0923d5','false','display.on.consent.screen'),('f5f24bf7-1361-49f5-bb85-6b3b1e0923d5','false','include.in.token.scope'),('f99f3aff-0cf3-449a-9e9c-858e126640f3','${phoneScopeConsentText}','consent.screen.text'),('f99f3aff-0cf3-449a-9e9c-858e126640f3','true','display.on.consent.screen'),('f99f3aff-0cf3-449a-9e9c-858e126640f3','true','include.in.token.scope'),('fb556c63-9a66-432b-b722-dc17474660b4','${rolesScopeConsentText}','consent.screen.text'),('fb556c63-9a66-432b-b722-dc17474660b4','true','display.on.consent.screen'),('fb556c63-9a66-432b-b722-dc17474660b4','false','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
                                       `CLIENT_ID` varchar(255) NOT NULL,
                                       `SCOPE_ID` varchar(255) NOT NULL,
                                       `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
                                       PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
                                       KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
                                       KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0a01a21c-27ea-4580-a411-d37cdc6a34ba','08548448-54c8-4072-98b9-e0f563e01c55',_binary '\0'),('0a01a21c-27ea-4580-a411-d37cdc6a34ba','11c0fa93-71bc-4600-bcab-1faea41eb115',_binary '\0'),('0a01a21c-27ea-4580-a411-d37cdc6a34ba','27eed4ff-e948-45f4-b154-3abbde982900',_binary ''),('0a01a21c-27ea-4580-a411-d37cdc6a34ba','438a8bad-bdf3-4d35-95c6-1e5e48afb7ae',_binary '\0'),('0a01a21c-27ea-4580-a411-d37cdc6a34ba','47b4034c-243c-44ba-804c-17298c802870',_binary ''),('0a01a21c-27ea-4580-a411-d37cdc6a34ba','59b2cfa2-f364-46c7-bee2-66c7c01ab793',_binary ''),('0a01a21c-27ea-4580-a411-d37cdc6a34ba','5c3d190b-68c1-4fd1-8267-175b07ab2855',_binary ''),('0a01a21c-27ea-4580-a411-d37cdc6a34ba','5df8afcc-6caa-48aa-8fc1-356b4bb62ff2',_binary '\0'),('1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06','25129e87-3873-4424-9b7e-df0d881e71ca',_binary ''),('1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06','3f053da8-b1eb-45af-8ca3-82b97e572149',_binary '\0'),('1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06','46b6b9ce-9ff9-403e-afe5-459d6b5777db',_binary '\0'),('1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06','acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7',_binary '\0'),('1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06','c745fc8f-e6f0-4993-b6e8-df4c0d15b09c',_binary ''),('1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06','f5f24bf7-1361-49f5-bb85-6b3b1e0923d5',_binary ''),('1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06','f99f3aff-0cf3-449a-9e9c-858e126640f3',_binary '\0'),('1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06','fb556c63-9a66-432b-b722-dc17474660b4',_binary ''),('2d328edb-3511-4289-89d3-f77876b8ad24','08548448-54c8-4072-98b9-e0f563e01c55',_binary '\0'),('2d328edb-3511-4289-89d3-f77876b8ad24','11c0fa93-71bc-4600-bcab-1faea41eb115',_binary '\0'),('2d328edb-3511-4289-89d3-f77876b8ad24','27eed4ff-e948-45f4-b154-3abbde982900',_binary ''),('2d328edb-3511-4289-89d3-f77876b8ad24','438a8bad-bdf3-4d35-95c6-1e5e48afb7ae',_binary '\0'),('2d328edb-3511-4289-89d3-f77876b8ad24','47b4034c-243c-44ba-804c-17298c802870',_binary ''),('2d328edb-3511-4289-89d3-f77876b8ad24','59b2cfa2-f364-46c7-bee2-66c7c01ab793',_binary ''),('2d328edb-3511-4289-89d3-f77876b8ad24','5c3d190b-68c1-4fd1-8267-175b07ab2855',_binary ''),('2d328edb-3511-4289-89d3-f77876b8ad24','5df8afcc-6caa-48aa-8fc1-356b4bb62ff2',_binary '\0'),('321c27d5-f3c5-407a-9832-006a86070cc2','25129e87-3873-4424-9b7e-df0d881e71ca',_binary ''),('321c27d5-f3c5-407a-9832-006a86070cc2','3f053da8-b1eb-45af-8ca3-82b97e572149',_binary '\0'),('321c27d5-f3c5-407a-9832-006a86070cc2','46b6b9ce-9ff9-403e-afe5-459d6b5777db',_binary '\0'),('321c27d5-f3c5-407a-9832-006a86070cc2','acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7',_binary '\0'),('321c27d5-f3c5-407a-9832-006a86070cc2','c745fc8f-e6f0-4993-b6e8-df4c0d15b09c',_binary ''),('321c27d5-f3c5-407a-9832-006a86070cc2','f5f24bf7-1361-49f5-bb85-6b3b1e0923d5',_binary ''),('321c27d5-f3c5-407a-9832-006a86070cc2','f99f3aff-0cf3-449a-9e9c-858e126640f3',_binary '\0'),('321c27d5-f3c5-407a-9832-006a86070cc2','fb556c63-9a66-432b-b722-dc17474660b4',_binary ''),('3a7b4987-7250-43cd-9967-8f9018d962e7','08548448-54c8-4072-98b9-e0f563e01c55',_binary '\0'),('3a7b4987-7250-43cd-9967-8f9018d962e7','11c0fa93-71bc-4600-bcab-1faea41eb115',_binary '\0'),('3a7b4987-7250-43cd-9967-8f9018d962e7','27eed4ff-e948-45f4-b154-3abbde982900',_binary ''),('3a7b4987-7250-43cd-9967-8f9018d962e7','438a8bad-bdf3-4d35-95c6-1e5e48afb7ae',_binary '\0'),('3a7b4987-7250-43cd-9967-8f9018d962e7','47b4034c-243c-44ba-804c-17298c802870',_binary ''),('3a7b4987-7250-43cd-9967-8f9018d962e7','59b2cfa2-f364-46c7-bee2-66c7c01ab793',_binary ''),('3a7b4987-7250-43cd-9967-8f9018d962e7','5c3d190b-68c1-4fd1-8267-175b07ab2855',_binary ''),('3a7b4987-7250-43cd-9967-8f9018d962e7','5df8afcc-6caa-48aa-8fc1-356b4bb62ff2',_binary '\0'),('596372dd-e55d-4b73-b324-e18847c0d57f','25129e87-3873-4424-9b7e-df0d881e71ca',_binary ''),('596372dd-e55d-4b73-b324-e18847c0d57f','3f053da8-b1eb-45af-8ca3-82b97e572149',_binary '\0'),('596372dd-e55d-4b73-b324-e18847c0d57f','46b6b9ce-9ff9-403e-afe5-459d6b5777db',_binary '\0'),('596372dd-e55d-4b73-b324-e18847c0d57f','acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7',_binary '\0'),('596372dd-e55d-4b73-b324-e18847c0d57f','c745fc8f-e6f0-4993-b6e8-df4c0d15b09c',_binary ''),('596372dd-e55d-4b73-b324-e18847c0d57f','f5f24bf7-1361-49f5-bb85-6b3b1e0923d5',_binary ''),('596372dd-e55d-4b73-b324-e18847c0d57f','f99f3aff-0cf3-449a-9e9c-858e126640f3',_binary '\0'),('596372dd-e55d-4b73-b324-e18847c0d57f','fb556c63-9a66-432b-b722-dc17474660b4',_binary ''),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb','25129e87-3873-4424-9b7e-df0d881e71ca',_binary ''),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb','3f053da8-b1eb-45af-8ca3-82b97e572149',_binary '\0'),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb','46b6b9ce-9ff9-403e-afe5-459d6b5777db',_binary '\0'),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb','acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7',_binary '\0'),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb','c745fc8f-e6f0-4993-b6e8-df4c0d15b09c',_binary ''),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb','f5f24bf7-1361-49f5-bb85-6b3b1e0923d5',_binary ''),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb','f99f3aff-0cf3-449a-9e9c-858e126640f3',_binary '\0'),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb','fb556c63-9a66-432b-b722-dc17474660b4',_binary ''),('8bd89bf9-1cde-49ce-8b4e-270e13cf1a44','25129e87-3873-4424-9b7e-df0d881e71ca',_binary ''),('8bd89bf9-1cde-49ce-8b4e-270e13cf1a44','3f053da8-b1eb-45af-8ca3-82b97e572149',_binary '\0'),('8bd89bf9-1cde-49ce-8b4e-270e13cf1a44','46b6b9ce-9ff9-403e-afe5-459d6b5777db',_binary '\0'),('8bd89bf9-1cde-49ce-8b4e-270e13cf1a44','acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7',_binary '\0'),('8bd89bf9-1cde-49ce-8b4e-270e13cf1a44','c745fc8f-e6f0-4993-b6e8-df4c0d15b09c',_binary ''),('8bd89bf9-1cde-49ce-8b4e-270e13cf1a44','f5f24bf7-1361-49f5-bb85-6b3b1e0923d5',_binary ''),('8bd89bf9-1cde-49ce-8b4e-270e13cf1a44','f99f3aff-0cf3-449a-9e9c-858e126640f3',_binary '\0'),('8bd89bf9-1cde-49ce-8b4e-270e13cf1a44','fb556c63-9a66-432b-b722-dc17474660b4',_binary ''),('962df3c7-34b6-49a6-977b-21e820d49d65','25129e87-3873-4424-9b7e-df0d881e71ca',_binary ''),('962df3c7-34b6-49a6-977b-21e820d49d65','3f053da8-b1eb-45af-8ca3-82b97e572149',_binary '\0'),('962df3c7-34b6-49a6-977b-21e820d49d65','46b6b9ce-9ff9-403e-afe5-459d6b5777db',_binary '\0'),('962df3c7-34b6-49a6-977b-21e820d49d65','acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7',_binary '\0'),('962df3c7-34b6-49a6-977b-21e820d49d65','c745fc8f-e6f0-4993-b6e8-df4c0d15b09c',_binary ''),('962df3c7-34b6-49a6-977b-21e820d49d65','f5f24bf7-1361-49f5-bb85-6b3b1e0923d5',_binary ''),('962df3c7-34b6-49a6-977b-21e820d49d65','f99f3aff-0cf3-449a-9e9c-858e126640f3',_binary '\0'),('962df3c7-34b6-49a6-977b-21e820d49d65','fb556c63-9a66-432b-b722-dc17474660b4',_binary ''),('9c21cc16-bf32-4420-8ab1-235022f00958','08548448-54c8-4072-98b9-e0f563e01c55',_binary '\0'),('9c21cc16-bf32-4420-8ab1-235022f00958','11c0fa93-71bc-4600-bcab-1faea41eb115',_binary '\0'),('9c21cc16-bf32-4420-8ab1-235022f00958','27eed4ff-e948-45f4-b154-3abbde982900',_binary ''),('9c21cc16-bf32-4420-8ab1-235022f00958','438a8bad-bdf3-4d35-95c6-1e5e48afb7ae',_binary '\0'),('9c21cc16-bf32-4420-8ab1-235022f00958','47b4034c-243c-44ba-804c-17298c802870',_binary ''),('9c21cc16-bf32-4420-8ab1-235022f00958','59b2cfa2-f364-46c7-bee2-66c7c01ab793',_binary ''),('9c21cc16-bf32-4420-8ab1-235022f00958','5c3d190b-68c1-4fd1-8267-175b07ab2855',_binary ''),('9c21cc16-bf32-4420-8ab1-235022f00958','5df8afcc-6caa-48aa-8fc1-356b4bb62ff2',_binary '\0'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','25129e87-3873-4424-9b7e-df0d881e71ca',_binary ''),('b0aa1970-e558-4014-8f56-9086d2a6cebd','3f053da8-b1eb-45af-8ca3-82b97e572149',_binary '\0'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','46b6b9ce-9ff9-403e-afe5-459d6b5777db',_binary '\0'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7',_binary '\0'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','c745fc8f-e6f0-4993-b6e8-df4c0d15b09c',_binary ''),('b0aa1970-e558-4014-8f56-9086d2a6cebd','f5f24bf7-1361-49f5-bb85-6b3b1e0923d5',_binary ''),('b0aa1970-e558-4014-8f56-9086d2a6cebd','f99f3aff-0cf3-449a-9e9c-858e126640f3',_binary '\0'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','fb556c63-9a66-432b-b722-dc17474660b4',_binary ''),('dfeb885d-1411-41e3-98c7-f2532b11f386','08548448-54c8-4072-98b9-e0f563e01c55',_binary '\0'),('dfeb885d-1411-41e3-98c7-f2532b11f386','11c0fa93-71bc-4600-bcab-1faea41eb115',_binary '\0'),('dfeb885d-1411-41e3-98c7-f2532b11f386','27eed4ff-e948-45f4-b154-3abbde982900',_binary ''),('dfeb885d-1411-41e3-98c7-f2532b11f386','438a8bad-bdf3-4d35-95c6-1e5e48afb7ae',_binary '\0'),('dfeb885d-1411-41e3-98c7-f2532b11f386','47b4034c-243c-44ba-804c-17298c802870',_binary ''),('dfeb885d-1411-41e3-98c7-f2532b11f386','59b2cfa2-f364-46c7-bee2-66c7c01ab793',_binary ''),('dfeb885d-1411-41e3-98c7-f2532b11f386','5c3d190b-68c1-4fd1-8267-175b07ab2855',_binary ''),('dfeb885d-1411-41e3-98c7-f2532b11f386','5df8afcc-6caa-48aa-8fc1-356b4bb62ff2',_binary '\0'),('f81ef084-5707-4aea-9a2e-d96019ea3db2','08548448-54c8-4072-98b9-e0f563e01c55',_binary '\0'),('f81ef084-5707-4aea-9a2e-d96019ea3db2','11c0fa93-71bc-4600-bcab-1faea41eb115',_binary '\0'),('f81ef084-5707-4aea-9a2e-d96019ea3db2','27eed4ff-e948-45f4-b154-3abbde982900',_binary ''),('f81ef084-5707-4aea-9a2e-d96019ea3db2','438a8bad-bdf3-4d35-95c6-1e5e48afb7ae',_binary '\0'),('f81ef084-5707-4aea-9a2e-d96019ea3db2','47b4034c-243c-44ba-804c-17298c802870',_binary ''),('f81ef084-5707-4aea-9a2e-d96019ea3db2','59b2cfa2-f364-46c7-bee2-66c7c01ab793',_binary ''),('f81ef084-5707-4aea-9a2e-d96019ea3db2','5c3d190b-68c1-4fd1-8267-175b07ab2855',_binary ''),('f81ef084-5707-4aea-9a2e-d96019ea3db2','5df8afcc-6caa-48aa-8fc1-356b4bb62ff2',_binary '\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
                                             `SCOPE_ID` varchar(36) NOT NULL,
                                             `ROLE_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
                                             KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
                                             KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
                                             CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('46b6b9ce-9ff9-403e-afe5-459d6b5777db','2e5d968f-7722-4a13-a0e7-df5a287dd871'),('5df8afcc-6caa-48aa-8fc1-356b4bb62ff2','88409ccb-4651-4eaa-9bb9-9dae1af91a7b');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
                                  `ID` varchar(36) NOT NULL,
                                  `CLIENT_ID` varchar(36) DEFAULT NULL,
                                  `REDIRECT_URI` varchar(255) DEFAULT NULL,
                                  `STATE` varchar(255) DEFAULT NULL,
                                  `TIMESTAMP` int(11) DEFAULT NULL,
                                  `SESSION_ID` varchar(36) DEFAULT NULL,
                                  `AUTH_METHOD` varchar(255) DEFAULT NULL,
                                  `REALM_ID` varchar(255) DEFAULT NULL,
                                  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
                                  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
                                  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
                                              `AUTHENTICATOR` varchar(36) NOT NULL,
                                              `STATUS` int(11) DEFAULT NULL,
                                              `CLIENT_SESSION` varchar(36) NOT NULL,
                                              PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
                                              CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
                                       `NAME` varchar(255) NOT NULL,
                                       `VALUE` varchar(255) DEFAULT NULL,
                                       `CLIENT_SESSION` varchar(36) NOT NULL,
                                       PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
                                       CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
                                              `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
                                              `CLIENT_SESSION` varchar(36) NOT NULL,
                                              PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
                                              CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
                                       `ROLE_ID` varchar(255) NOT NULL,
                                       `CLIENT_SESSION` varchar(36) NOT NULL,
                                       PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
                                       CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
                                            `NAME` varchar(255) NOT NULL,
                                            `VALUE` varchar(2048) DEFAULT NULL,
                                            `CLIENT_SESSION` varchar(36) NOT NULL,
                                            PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
                                            CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
                             `ID` varchar(36) NOT NULL,
                             `NAME` varchar(255) DEFAULT NULL,
                             `PARENT_ID` varchar(36) DEFAULT NULL,
                             `PROVIDER_ID` varchar(36) DEFAULT NULL,
                             `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
                             `REALM_ID` varchar(36) DEFAULT NULL,
                             `SUB_TYPE` varchar(255) DEFAULT NULL,
                             PRIMARY KEY (`ID`),
                             KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
                             KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
                             CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('04e9ff64-9972-4cd7-95cd-c38d4f07e28c','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('230a4d75-570e-411f-b242-ea57f0980518','rsa-generated','Development','rsa-generated','org.keycloak.keys.KeyProvider','Development',NULL),('3f8f5db0-c8f7-44e4-a2c3-b0bfd1e05860','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('41a85e5c-0c1a-4e7e-987d-e97c712370d6','aes-generated','Development','aes-generated','org.keycloak.keys.KeyProvider','Development',NULL),('4703b5f3-0061-4127-9a1e-04c525a30b8d','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('4e7959aa-901f-4a63-ac60-030e7d8f45f8','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('5b0a4a70-40e7-4c59-ab7f-cf0367af4d95','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('5be52e7b-aa3d-42de-8850-a54068db72aa','Allowed Protocol Mapper Types','Development','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','Development','authenticated'),('65757ce6-bd08-47a6-9c4b-31ee673c5d32','Allowed Protocol Mapper Types','Development','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','Development','anonymous'),('6d70e3b1-00e7-4a26-b8de-ef3409828f99','Trusted Hosts','Development','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','Development','anonymous'),('75affd46-2824-4c5f-989f-ab55dda7cf82','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('7e77e29f-ed0f-4469-8d39-f95cbbc752e5','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('813e62bf-c4e2-499a-afa8-dd134071e7e3','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('8e501928-e141-45c1-8a71-913ffd9ab513','hmac-generated','Development','hmac-generated','org.keycloak.keys.KeyProvider','Development',NULL),('918de938-dda1-4a07-a691-3fe1152488d8','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9379990f-d224-4d0b-b8a7-77ea1063708f','Full Scope Disabled','Development','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','Development','anonymous'),('956b1756-a27e-44e8-8a12-97fc67bcd7b3','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('9fd2e061-ba06-4851-91b6-721903e612ff','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL),('aae8f753-2b38-4db1-b294-cbc8f7cabe10','Allowed Client Scopes','Development','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','Development','anonymous'),('d01eeb25-b06e-4ec2-b429-ff00c42a3d66','Max Clients Limit','Development','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','Development','anonymous'),('dd07e19b-eca6-4c8b-ba6a-c68b30db06a1','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('e8f1f7cf-6117-4ddf-98ae-d78676771a2c','Consent Required','Development','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','Development','anonymous'),('ec9f242a-4fe2-454c-9435-9823b3c66865','Allowed Client Scopes','Development','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','Development','authenticated');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
                                    `ID` varchar(36) NOT NULL,
                                    `COMPONENT_ID` varchar(36) NOT NULL,
                                    `NAME` varchar(255) NOT NULL,
                                    `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
                                    PRIMARY KEY (`ID`),
                                    KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
                                    CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('009ca0ee-807a-43ff-aa87-dae81ecc1bd5','5be52e7b-aa3d-42de-8850-a54068db72aa','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('02b9c5f1-e12d-4220-b214-39b34d6bb3c3','04e9ff64-9972-4cd7-95cd-c38d4f07e28c','priority','100'),('0ea06aaf-7af0-4377-ac19-a015b9b0e0f1','75affd46-2824-4c5f-989f-ab55dda7cf82','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('10bed793-96ff-4b89-a64a-aff67d56fe78','9fd2e061-ba06-4851-91b6-721903e612ff','privateKey','MIIEpAIBAAKCAQEApVuVRysHTs0si5jh+yP64E0IKP4dJ5sn275FpFl6D1sa9lBg5Ikjc4TztqL7gSAlCtRPtniXNv+q6FJPa3Z3tQQmmjW+sWOorjld0zpHwKlbPeNJ/lLOa4ZUxdwuK4Aa2nHk/qsJofMtQo3+/zMTDDf9LEYVWdtc585/BmBecPdjUVZa7i0FvxH/S/n2Sy/4WON6RRsL+eLDHXG9AfjytgKdCMfwIvXMnKRoFWWKgZZ3h463jst/oW11RWksi/kq6/TIvX3Nu0iFPZKY9x/4oaVFAzpwzm1EfVZCr22SnNJF/0+BRkZihvbWjoz6pcRYV9QoVaD6gSH4vtbLLrSeVQIDAQABAoIBAQCCV4V8ursg73O8ef8vYjYf1jinb1712ER73yiwGuOu9QZ0v/kQS9VI+rTM8v3C096/AYnv8HBppvBF/pOhxpknc6UmC1VMKJ1O7+M4XAkxIY3NY7rwoL8bXKC38g3mtiz0obB62cFXCgNUIe+to8nQ6NVEr92mndZG1qukEBSBgAZj0s9XrRpQsoNwXU2+bQrA7wQg2TIjM5OBIGyrdp8wjMkxtP8ufkGI0BPs6rxdeZkHU58XsFDQ7x9ARUEchtVrawxCvS6qRz9wgQMGC24wV6BU/nNgixcy5K6tCML6DefUAathzIeN5MHWrCvl3Bvh9iEOYAg6O8Mf1RuRkEchAoGBAPTAmqaeDnhWwVsyn48Vm5WV78eh8qoRobtQ1ZXvzMZ+nf3nF7vjW8PCnmble0QeDA/C0WZJKUNhmwS4XhieN5toSCCzACBAe18nW659Gs249ZsyHy/MmoaI95lWbPIBUaA6AKYkutqd5KF1cnAc0XDKTOuGFy2ou6vWjRS7VIZtAoGBAKz08FtDi3sbh3vSG64Pe3QSS/nhHFhuIp6b169YSZsINg4rL+txlNnVNB9cl2BwcfT+KpxOyiPcl4glvy0nWFgYTLkZYBIwhc9Khzz7UZsu/KPQAym9oJKz0GiwUUd/STwiGUO0yRZYrdQhVbfBIVHW8zMYY8Xn/CUyBpZjxqaJAoGAThvFfxUEAy2UqXkfaLd5nqRqEGjDm7jix3fFogMUc+hmnWgJsAGgAHp0uNvVmeiI6uK+lwkULRfSNBBunyanEmaWVjEqAiDx/mz+GlJ8oli7sRquzz9ZtUOy2PG29Qistxirqlogc7JeC5UCv3rC8F7va16wuPaXZgCjp5EdKYUCgYAb1kBpL/HfGosvzp1N4ogIInm/+g9J3FAOHx8Txa3zGds5ZJIN3vYKKVp+QbTLfM2alN3e0n+OTg7Fhu3CIrcBVsficscXpl+jAWfK1NhJlcJryyr3KOITOoWsk9RBIadz2jkewJYs1pEDt2nIbXkjZuk1rBNC4xeeFPMieWSboQKBgQDV99BfcbcrEU7M8dZXabyVNspAjxMGrVIqOnfDoqRCG7f3NshFQXHEduG6Bsz+PMzfWY63gJStoYISbsrFHRwwxvkQfhRR8ABDJ9crJVWKOs0KJ4sB1ibYjBUnVtmWtanPtpbstKT+ofTmSmVckUVRTSlmIoV9cn2sbRi84VfaQQ=='),('147b1066-dc3e-4e29-b8bb-cfb93888cf9d','65757ce6-bd08-47a6-9c4b-31ee673c5d32','allowed-protocol-mapper-types','saml-role-list-mapper'),('17ae0a55-406e-4cc3-baf7-e8246e6da321','5be52e7b-aa3d-42de-8850-a54068db72aa','allowed-protocol-mapper-types','oidc-address-mapper'),('1fab29fa-2c74-42fd-b6b3-69e7db4f2021','4e7959aa-901f-4a63-ac60-030e7d8f45f8','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('2cdaba66-4848-49ae-962c-b695c1036cdb','5b0a4a70-40e7-4c59-ab7f-cf0367af4d95','priority','100'),('2db9aa7b-7ae6-42a5-a52c-d78f1e15a996','04e9ff64-9972-4cd7-95cd-c38d4f07e28c','certificate','MIICmzCCAYMCBgF94BKPrDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjExMjIyMDI1NTUyWhcNMzExMjIyMDI1NzMyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDC6/WCssV0O5dO/bCM8mjs1IQ3Ss2jcE7RWKrfHC2cmacVCzgcJLkIClycOLSt9WeqSZiFACXSB4Kao8dhRGgYiFwCsgWUq9ndYHD3GFyxCvvH8M/9gcqVT+TznZe1D49l8XjIDnqWVQ1bg6rZ5CKzF7fwD7aerMRD4fs2grWQvP5RQ6RvSPMrsR/IIg56P1+4jO1uzkkgmzetWaf+7VW8/+5FU19rkb3raCnHfDtS227Nc7jnbZOXY1Jtuo/MwKckWrVmMMoAAyL0fbky2Wr8pVHwUFLsmQkBH7s6IB3HFU+eztUNLGDrS5kb6bNPTIIZR0Vs4oLw47zpLHLIWVUzAgMBAAEwDQYJKoZIhvcNAQELBQADggEBACRBRlypuAZih0eIYu5iWoX2SQI7byFxkFTQEEUoOUJRWE86ta+SLrQi98CrQQZ/itGgTwh/WvKJ7KX4Wp0TCKY9hzGbgVxr4iy7JTDZlWHBLVPp9BrmEBrCCpZFVFy2V5D/WT+zgNMmPVJyG1u7p2nU6m7Oc4TCrsKd/mebVk4WFORDhOLQVf7iaI38zrDcmWvgKtYyFDQEnbbqnkY+v1qQ58M5Gt3VWwOSj6jTLd0Du5vHWOOwft/3Vj9Qbbso6G4hUG9Qe/9jbNoC0gdSEP7tlLSrjg5uCrMtNriMzZ3ibfqYx6qUJdgWPdXpcK70aSxBcGot4UthKtqxGcXvfvE='),('2e4b3a95-94d4-4f40-949d-35f2ce1f2e72','ec9f242a-4fe2-454c-9435-9823b3c66865','allow-default-scopes','true'),('32027c0d-2e22-4476-8e31-e1b5eb085999','8e501928-e141-45c1-8a71-913ffd9ab513','priority','100'),('36f5842a-5355-41d7-b928-07e813309069','956b1756-a27e-44e8-8a12-97fc67bcd7b3','max-clients','200'),('3bfc668e-e64b-4017-85e3-298b9da1db97','6d70e3b1-00e7-4a26-b8de-ef3409828f99','client-uris-must-match','true'),('3d2ff063-3f43-4e77-96d9-103ed42c8f26','4e7959aa-901f-4a63-ac60-030e7d8f45f8','allowed-protocol-mapper-types','saml-role-list-mapper'),('3d46cb0f-573d-446e-a106-1e18e951b7f3','6d70e3b1-00e7-4a26-b8de-ef3409828f99','host-sending-registration-request-must-match','true'),('3d55db67-5fed-4ba4-9bfe-9038cc2f705e','75affd46-2824-4c5f-989f-ab55dda7cf82','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('422681bc-2adc-4b98-b672-7c60a05e307c','75affd46-2824-4c5f-989f-ab55dda7cf82','allowed-protocol-mapper-types','saml-user-property-mapper'),('57d0df5c-819b-4b81-ad9b-5ffa31c81870','65757ce6-bd08-47a6-9c4b-31ee673c5d32','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('5a35ac2b-d43b-467e-9c81-891c262ea4de','75affd46-2824-4c5f-989f-ab55dda7cf82','allowed-protocol-mapper-types','oidc-full-name-mapper'),('5eaa00e1-ab96-4313-b5b9-e8dfae216c44','7e77e29f-ed0f-4469-8d39-f95cbbc752e5','priority','100'),('627dbf8b-86f7-411c-8b17-70deceb42537','4e7959aa-901f-4a63-ac60-030e7d8f45f8','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('62837450-0e8c-4c97-b07e-a0a7869fb64f','9fd2e061-ba06-4851-91b6-721903e612ff','algorithm','RSA-OAEP'),('68266350-e45d-4508-ac55-5d22f6fe8a9a','8e501928-e141-45c1-8a71-913ffd9ab513','kid','76e212de-e3c3-4add-ae83-fd2a33e2f2a6'),('68a569fb-1fd8-4008-87d0-e2e2f657f1ee','9fd2e061-ba06-4851-91b6-721903e612ff','keyUse','ENC'),('6d332fa5-1fe8-4536-966e-195a54ee2f98','4703b5f3-0061-4127-9a1e-04c525a30b8d','allow-default-scopes','true'),('6ed3377a-7d1d-4d19-ae7f-bac4e84add83','9fd2e061-ba06-4851-91b6-721903e612ff','priority','100'),('6fb9f76e-180f-4ce9-8f08-e033320d3321','8e501928-e141-45c1-8a71-913ffd9ab513','algorithm','HS256'),('7007215b-e325-4c84-8aa8-6a70add74688','65757ce6-bd08-47a6-9c4b-31ee673c5d32','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('70d4123d-c354-4abe-a636-26b1db153b7b','5b0a4a70-40e7-4c59-ab7f-cf0367af4d95','algorithm','HS256'),('779eb0ee-941b-46d3-a574-695480365f7d','9fd2e061-ba06-4851-91b6-721903e612ff','certificate','MIICmzCCAYMCBgF94BKTYzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjExMjIyMDI1NTUzWhcNMzExMjIyMDI1NzMzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQClW5VHKwdOzSyLmOH7I/rgTQgo/h0nmyfbvkWkWXoPWxr2UGDkiSNzhPO2ovuBICUK1E+2eJc2/6roUk9rdne1BCaaNb6xY6iuOV3TOkfAqVs940n+Us5rhlTF3C4rgBraceT+qwmh8y1Cjf7/MxMMN/0sRhVZ21znzn8GYF5w92NRVlruLQW/Ef9L+fZLL/hY43pFGwv54sMdcb0B+PK2Ap0Ix/Ai9cycpGgVZYqBlneHjreOy3+hbXVFaSyL+Srr9Mi9fc27SIU9kpj3H/ihpUUDOnDObUR9VkKvbZKc0kX/T4FGRmKG9taOjPqlxFhX1ChVoPqBIfi+1ssutJ5VAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAJ55C9QKAcx4+UBPC4CHjOUbQdw0XP1oFwo/ud/fCa2Mx6VU2rXCt1PtO521PEk+1CsNhI/Cn6mFkAkQ90djwcxbiEIvPr2GALpFqvnBMXu/CJ3d4ILznnjDlV9ppN7gKb4xDAjpflaMGNv3sV0P0OLX14asMvK6Eowe8v7IcB4/OROMbFcqF1IeM1JD3PIT2XRwwAGGnCaHMlLSFUZXtJsF+QDNBHMVA22WRqwes+GLbCEWMVgTFavQ55Ftlqjr+KG0KJhIFf6QRgg7zACgE5Jc+AGUAokq42SvTWffKFqr/CmWpQWdFHY4T0Xz8of2nZR0s7suNyliWhYvmXsRvZc='),('7cfca399-649f-4d7a-add1-7aa0509f72f4','5be52e7b-aa3d-42de-8850-a54068db72aa','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('81342eee-72a5-47a0-9e9a-5fe2e344ac4b','75affd46-2824-4c5f-989f-ab55dda7cf82','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('81ce6067-fd2a-40e5-8952-d935f2c6d16e','65757ce6-bd08-47a6-9c4b-31ee673c5d32','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8898b22e-f14a-491b-805d-d36036b15eb4','75affd46-2824-4c5f-989f-ab55dda7cf82','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('8b1fa91b-7a19-4894-ba2a-1fc63401fa96','04e9ff64-9972-4cd7-95cd-c38d4f07e28c','privateKey','MIIEowIBAAKCAQEAwuv1grLFdDuXTv2wjPJo7NSEN0rNo3BO0Viq3xwtnJmnFQs4HCS5CApcnDi0rfVnqkmYhQAl0geCmqPHYURoGIhcArIFlKvZ3WBw9xhcsQr7x/DP/YHKlU/k852XtQ+PZfF4yA56llUNW4Oq2eQisxe38A+2nqzEQ+H7NoK1kLz+UUOkb0jzK7EfyCIOej9fuIztbs5JIJs3rVmn/u1VvP/uRVNfa5G962gpx3w7UttuzXO4522Tl2NSbbqPzMCnJFq1ZjDKAAMi9H25Mtlq/KVR8FBS7JkJAR+7OiAdxxVPns7VDSxg60uZG+mzT0yCGUdFbOKC8OO86SxyyFlVMwIDAQABAoIBAFmxlHbA5qVWqoiZqj0havDX1cNPs5Kqokoo3+/smnx+I+lGEVq59z7g7b6hRVrrGvm8BeflqoGcHRgllyCGBtSLIrPG0VSZQ5Zfw3ughT6ejD9z63F+4QaWDgegE+goMdc6J1b/ep9kodHjo6HCHcmFd4mK4YDghSureBqcSQpBbpNBT8CZ2kHcDhT2K0VW9I6STRcUQDplltxJD6wWcOEmjCUuVAuMmxl3SzgEXCKgfu/Y1PY5ym+ED67uPAYF+6hhd7zeK9+oBw63RiDEqh8mtgpReMSdCXR7xE2JSyAIhABqConzPQ5ojAJOCYuiDQV2pWNtIuXNMs9T8JE6RVECgYEA+GWFM1+M7CqhpZi1jpU8Itx+9R7/G7gXxLCeGuh4Zz2zVA0ytC5kzME4JUbiiIizElna4o3g/0pwFF3At5hwyMTpRvXq2PUPEVTsh4dJyulYQoz4MBgCWKsJdCm5FgkEsTzaQMFkz18zAqjk73j9HjMmiHgax4uPQt0f7Lc8FekCgYEAyONmeJVYQihEoHhXZxXuq4Q6wqRDNavDn4VnmsvJkPp6Z/NC9lDfbszOZdeOS+d7Qk+w3vuHMRRiZP4bhTtIBOR0aPXa/fS0bg+rOxetcqCZresNVu0W2pBt7Wj/ApHmcguw1GeBmCvttxT4ODs6zJAUIiKFwON/86VtuyeyNLsCgYAJZ0Z4oGhkVGTUMQjGgg3JwBEqVGcR9JEpyAnkOOK9/c75IprFyW/VdIccmidfRdWJn08y/m4DHB1MGBSAnsu+Pf4aypp+ZiCQ5mch5lQ700OdGVsX7wC/vJHaDO5N0D+WOhiFFQ0s8Iys0BoCmtDyQLt3tRxGa5kbzeU0f+dNaQKBgHqNZ90WVvJ9OGihIckMsz7Fe0d1CF98uunda7gerIgaloRF/krgSX6ByUSN/QxHWoW4shFGZ1JEukYcU1OzN5tsd6v0mLWnDE+8lVyGdFTirv5P0CKAnxmVVMqp7DB4K5rVkPnzbzcTTYEMdOVxFMzo9K9iWjCzWUKdYFT1wZyzAoGBAPBHHmt3Zml8VXI3s+IVX9M3qeqi7h+e1fZ66OBTJ8NDgmZyzhYl4iTYC1sGWauXmfwpH0FakRekE8gPZshG/CrTKRHOSg+muNs+PKmhunoS2kwfzM/TRbJfY/vd3/B/uoMpkMuxhTAriS1BmZZgVhooJWy6jvHAWbWhJKmOQSaJ'),('90ca934d-76c9-43d0-afe8-49df08fe4d82','5be52e7b-aa3d-42de-8850-a54068db72aa','allowed-protocol-mapper-types','saml-user-property-mapper'),('958ec876-1bde-4515-af95-955bd27228c6','75affd46-2824-4c5f-989f-ab55dda7cf82','allowed-protocol-mapper-types','oidc-address-mapper'),('96048040-9277-48d5-8988-ba5e2d3d01b7','5be52e7b-aa3d-42de-8850-a54068db72aa','allowed-protocol-mapper-types','saml-role-list-mapper'),('9703f071-539b-49d0-a70b-43d3bd0a9010','3f8f5db0-c8f7-44e4-a2c3-b0bfd1e05860','allow-default-scopes','true'),('9beef1f8-5d15-48f6-8dac-f45e62fd6c1d','4e7959aa-901f-4a63-ac60-030e7d8f45f8','allowed-protocol-mapper-types','oidc-full-name-mapper'),('9c59817a-5ab9-4ae1-9f38-6c08517807b4','65757ce6-bd08-47a6-9c4b-31ee673c5d32','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('a254dcc6-d5e7-4a32-82cd-5d5d6bb325db','813e62bf-c4e2-499a-afa8-dd134071e7e3','host-sending-registration-request-must-match','true'),('ad9ff088-0d33-4f13-bc96-88d9920f0c9d','7e77e29f-ed0f-4469-8d39-f95cbbc752e5','secret','cngMFd-6f9fDvlKcn2r4XA'),('b0ca79ae-7cde-4997-8b60-7091c58024b1','813e62bf-c4e2-499a-afa8-dd134071e7e3','client-uris-must-match','true'),('b8b5684e-8347-4299-91ae-9fe3af2ed652','d01eeb25-b06e-4ec2-b429-ff00c42a3d66','max-clients','200'),('ba11890d-0d6c-4faf-a5ca-0a5bc0fdf299','4e7959aa-901f-4a63-ac60-030e7d8f45f8','allowed-protocol-mapper-types','oidc-address-mapper'),('bb901ddc-4c8b-48e8-9b0f-fb5266ae63ca','5be52e7b-aa3d-42de-8850-a54068db72aa','allowed-protocol-mapper-types','oidc-full-name-mapper'),('bcef0b7f-9361-48f6-8973-514518d57623','41a85e5c-0c1a-4e7e-987d-e97c712370d6','kid','3610160f-a353-4923-a6fa-8d4041ad23be'),('be1ba603-3e62-4ae4-adf0-92972ace2fd5','aae8f753-2b38-4db1-b294-cbc8f7cabe10','allow-default-scopes','true'),('be27e354-af6c-4162-817e-b4a21db0d9df','230a4d75-570e-411f-b242-ea57f0980518','privateKey','MIIEowIBAAKCAQEAqOr5b3KDXy8mGZ9oO0WG8xJhPy9+HmUg5QwoudD3kuSgPOgzkJCMtE0dUGvRfDfotOra4aoVQEkXpkMprIbR6TEbPOIq1/iaxNojSa134SNWax5lpuBu//GvdJB2XHAsV+SUcQH4eDPI4FPYDHyMZP0fx+KCxJg+h8IenANJA3Hw0Qa8ziToaqKXodiKxZHOht9Tzh2uhjoXYuPNFQZeXx25WrCf4D4CXBkB96smJrfHxLu1WAgnvscgDsd3yYIf0d9w88h7BO5MUIGC67gsoZxLRVNdmuYL8HeD0BD6jQ2qI02E2Ni8x+6eev2g4SBZbO0BEyihAwtrnXEsTdjUywIDAQABAoIBAQCaYY8xfW51+wiOWHOR4FyTIZRBhG126CRlUnSSR1tOJKgSooImOQZv7x7AlpnyNsL3PsJnhuQ/Sc5UhYO8C8gjoV7siSRxGOSSz2968hDjckGUS0bKesrYHxKlrTaQC3FrrxzAH/XwHhwUcmy+FMLXtcRrEilD9oUH3LHPEu2TN/10/+31IZfv7G75Kicr/CpQDFgjrlZy35fByWS/i+SO5zI2twIhfSqr0wpmq+5XdxHP16mnn/wMq/kBembdAX9L6xK25WkLVo/VFXtGkq8uGyAh81ABBMArF/A682UT/+tB2ivb8pH62vJajeGdJ7P82zgU7RTXlDTfzZ7wwzgpAoGBAOFEkzvac03l95UUP09wC9mnQNpluBbC1PpWGV7or51uFphTmi04p4239zj5PV0a+jBLM56JxEfxDuMnz4KGkjC2tqZm6IF1mx/8P/wyM4ByrKEBObp5+eTrRCiAsrYhA3qa04qsOpxhVV584B0alzLyKntybM4wFXrjrRFSZu7nAoGBAL/2Y6bQqEtlSnx/FniyAuJnlcnmZqb4Ibj6ENEPot50Um+73UD5zAIaJrmUKbI1Sms/anseoGHVRHk+tTa4ak09P0lv4kDN5vr1FMNZ55mIUS8cOvdSHx+Wpy5IrCb+a48oCCCoKzLsKEQK0Q5uvxD2ONxhh230atqQnSLZWKJ9AoGASSigOHwFnnLlKUFeHkphTtqGsWb/lkTILlTwAGbJQfOS2v2rwKv5noj0fUhUqXwtbKm/pelQGZ0sHJG9TsKtj6yHPRuGvySWsJiXnywelcSoU9G2Ed2zTqkphY3mfEfUfWjy8sJkdo0V0I31qv4LxLvpGBZdR8lN8I8okcuVKlkCgYATVnTPdzGc9sU8KWlQG06jFCBIyIcKxvBOvBI5nUOg+ULcsqYlR4S/qXbBNyXEKA4pI6hMYtdxQ5S0ShbjPkynH0Zi1XyLXrKoEUxYKZRlKRBUmJlwFLvB6OFKjlOZUgPv1e6Lq6U+af/cauKIe6uPv94WhVSpRPgGsI7D1fVR2QKBgE+S3BODJy6c0XHM+B4+oEITAzWJtoqR4eSpJAww964rd8LeLD1wqG/bSS/nDss8tfTLR+LgD+C1l0dQAdvOzW83eEL/FJXQhCdfpIkdfm9/egL43kj7cNw7NXfHBdprXw3RflnCPyzmuAMxdRGILt5Ltt69nO5ptFvIzwY5W/HS'),('c08904a2-5bbc-4610-90c5-7f6d59855908','5b0a4a70-40e7-4c59-ab7f-cf0367af4d95','secret','FROyCe1C_GXHq8qpV4bWEQA7wAFawvRiLECIu-_efIrAeLPkQeYE5P-19yzMfZp7E3_7GX91lSxjl__3J3fFoA'),('c1d71b7c-6582-4fbe-b6c9-f5def71f2313','41a85e5c-0c1a-4e7e-987d-e97c712370d6','secret','XArwVj7j_8pUXeWsOK_e9w'),('c3bbd549-6dea-44e9-8492-d7cbfeb5334c','75affd46-2824-4c5f-989f-ab55dda7cf82','allowed-protocol-mapper-types','saml-role-list-mapper'),('c5c0399d-d028-4b39-983c-03450b0bd6af','8e501928-e141-45c1-8a71-913ffd9ab513','secret','_ANUuJQedgdZ9gynr7JcQaAA-Q3aOJPvw-S8cVlaj3scMQwre5GBm18OONo-D_8JbL8Blz0s4tK467KnsAOTjQ'),('c97a0def-fc80-4b8e-bcb8-57a1461b30a5','4e7959aa-901f-4a63-ac60-030e7d8f45f8','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('ce781561-4db4-48dd-afec-a34124c9d113','65757ce6-bd08-47a6-9c4b-31ee673c5d32','allowed-protocol-mapper-types','oidc-address-mapper'),('d2710301-e4ef-42a1-9cd0-e4ef68cf72b1','4e7959aa-901f-4a63-ac60-030e7d8f45f8','allowed-protocol-mapper-types','saml-user-property-mapper'),('d81628c2-0882-43b5-bc1e-5bfb5ead2f76','230a4d75-570e-411f-b242-ea57f0980518','priority','100'),('d940d451-5f40-4664-9d40-8fcbfc92e77b','7e77e29f-ed0f-4469-8d39-f95cbbc752e5','kid','7fd143db-ea2d-4890-a6da-7f7f7b140de4'),('e24766d1-4f3f-485e-ab67-0affedeb1cd4','5be52e7b-aa3d-42de-8850-a54068db72aa','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('e7b3e89b-c688-4288-8147-37fd717f7393','65757ce6-bd08-47a6-9c4b-31ee673c5d32','allowed-protocol-mapper-types','oidc-full-name-mapper'),('e9e08b1b-df41-4758-bd4d-249d516daf04','5be52e7b-aa3d-42de-8850-a54068db72aa','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ec982f78-fb79-497e-90fe-350bd6e643ff','04e9ff64-9972-4cd7-95cd-c38d4f07e28c','keyUse','SIG'),('ef8883f1-09b0-4535-82b1-e9eda9870534','4e7959aa-901f-4a63-ac60-030e7d8f45f8','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('f2329f3d-04de-4097-9d22-fbb80ef30e9c','5b0a4a70-40e7-4c59-ab7f-cf0367af4d95','kid','37f9900d-155f-4eb9-8fc3-f590afd8b6ff'),('f9bbd279-3c3f-45f1-a199-f1d09bb28a91','230a4d75-570e-411f-b242-ea57f0980518','certificate','MIICpTCCAY0CBgF94BKuwDANBgkqhkiG9w0BAQsFADAWMRQwEgYDVQQDDAtEZXZlbG9wbWVudDAeFw0yMTEyMjIwMjU2MDBaFw0zMTEyMjIwMjU3NDBaMBYxFDASBgNVBAMMC0RldmVsb3BtZW50MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqOr5b3KDXy8mGZ9oO0WG8xJhPy9+HmUg5QwoudD3kuSgPOgzkJCMtE0dUGvRfDfotOra4aoVQEkXpkMprIbR6TEbPOIq1/iaxNojSa134SNWax5lpuBu//GvdJB2XHAsV+SUcQH4eDPI4FPYDHyMZP0fx+KCxJg+h8IenANJA3Hw0Qa8ziToaqKXodiKxZHOht9Tzh2uhjoXYuPNFQZeXx25WrCf4D4CXBkB96smJrfHxLu1WAgnvscgDsd3yYIf0d9w88h7BO5MUIGC67gsoZxLRVNdmuYL8HeD0BD6jQ2qI02E2Ni8x+6eev2g4SBZbO0BEyihAwtrnXEsTdjUywIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCcYmuFJ8WCTFXhhKvVXfrjwq/UgDkbR9B7sBv7nXlJ+YXzy4ZbDXOxc6cp0yfs29uiRzT1bINcOHnt0En6NE6IlO1DRUuKHecURkyxS81WNpY0/vX9WSzjTu6+wJCevFqppcx4rA0p4dzz9LLV4tHKswyXe3QB+diPCi6t8DEj6u/mAjtnQ4nQ40gktP+5ryuYGEV5sw7QYt9BB2Cv/n6YRximb6YpDBVlu3Yy+wfVQLasDANsiag8mF/i0eUCvR7CjPY52xmUX0CP2Cw069rQkDQ4iMYJCqrSbwx9ggNNWAYzYkGVC7hXXDxyG/SgVRN9DSEXoSQgUGgXSuW6W8oA'),('fa39d9bd-37f0-40ac-bce4-e8a7643fa552','65757ce6-bd08-47a6-9c4b-31ee673c5d32','allowed-protocol-mapper-types','saml-user-property-mapper'),('fc73c511-94b1-49ec-9bb8-f095c690a585','41a85e5c-0c1a-4e7e-987d-e97c712370d6','priority','100');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
                                  `COMPOSITE` varchar(36) NOT NULL,
                                  `CHILD_ROLE` varchar(36) NOT NULL,
                                  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
                                  KEY `IDX_COMPOSITE` (`COMPOSITE`),
                                  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
                                  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
                                  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('015831f3-642e-4a88-bfc9-6391ea26d4fa','0f127baa-2a38-4db8-a611-dee48bc62d86'),('12f448ef-09b2-48ba-85da-41e8afb21bcd','103b7022-311b-47f9-b8e1-4fcd71a66e0f'),('53ac0af7-d902-4297-bb43-02ca622af443','005d4e9e-b9b1-4c0b-a824-9ec34ee93f73'),('53ac0af7-d902-4297-bb43-02ca622af443','010fbafb-fe64-4eb1-b799-1914bef57e98'),('53ac0af7-d902-4297-bb43-02ca622af443','0548b617-79a7-4edd-b6f6-b1c01a3c8185'),('53ac0af7-d902-4297-bb43-02ca622af443','26e2fa8f-a5ec-4430-a234-7388f3bfb1d1'),('53ac0af7-d902-4297-bb43-02ca622af443','33c54cc0-956b-44b1-aab3-dc3ac541092b'),('53ac0af7-d902-4297-bb43-02ca622af443','4de783d9-1da6-400b-be68-4b4255d50fa2'),('53ac0af7-d902-4297-bb43-02ca622af443','64227b34-227a-489a-a5c8-1699c450550e'),('53ac0af7-d902-4297-bb43-02ca622af443','6493e199-ed8b-4595-ad1a-408b714e1129'),('53ac0af7-d902-4297-bb43-02ca622af443','64984076-3a2a-4836-af50-56b3a1b584aa'),('53ac0af7-d902-4297-bb43-02ca622af443','665b3f9f-cdd1-4945-b45a-35d2d80ba318'),('53ac0af7-d902-4297-bb43-02ca622af443','6900d58a-0927-4977-888d-7af2d04c3f41'),('53ac0af7-d902-4297-bb43-02ca622af443','6e371577-e0d2-49c2-a3d6-355652b435e0'),('53ac0af7-d902-4297-bb43-02ca622af443','7260e6f3-63ce-4b39-a3a8-6fbc15fd4767'),('53ac0af7-d902-4297-bb43-02ca622af443','7491d972-3a78-46a9-8be1-333f369888c4'),('53ac0af7-d902-4297-bb43-02ca622af443','78ef58c5-9b4e-41ae-92b7-c3651a53c819'),('53ac0af7-d902-4297-bb43-02ca622af443','801a06f9-9f5d-44b3-a8f7-6d38430addf9'),('53ac0af7-d902-4297-bb43-02ca622af443','8547a52f-d7f4-41fa-a25d-1b7d4322b72e'),('53ac0af7-d902-4297-bb43-02ca622af443','88c630f8-cc2f-41c4-8b9d-966050b11947'),('53ac0af7-d902-4297-bb43-02ca622af443','8f0fbfdf-dbfd-450a-b382-f2e6fd031d12'),('53ac0af7-d902-4297-bb43-02ca622af443','91f44252-0322-4020-ba72-647d33855330'),('53ac0af7-d902-4297-bb43-02ca622af443','968632e1-8080-4cca-bba3-678b37b2210a'),('53ac0af7-d902-4297-bb43-02ca622af443','9d0f9bee-dce0-441e-bb0c-fa4548d8ebdf'),('53ac0af7-d902-4297-bb43-02ca622af443','9fbdd8da-93e9-42af-bd76-73b9b82e4b79'),('53ac0af7-d902-4297-bb43-02ca622af443','a615e61f-7a18-441f-89a9-83bd742a7833'),('53ac0af7-d902-4297-bb43-02ca622af443','a61c00d6-cdf1-4ec0-8006-dfe29cc9c270'),('53ac0af7-d902-4297-bb43-02ca622af443','ac3ad2d0-f012-408d-948e-8d5cc00c512a'),('53ac0af7-d902-4297-bb43-02ca622af443','af8970c1-70b3-46cf-b88d-37a44e328915'),('53ac0af7-d902-4297-bb43-02ca622af443','b6fe0c86-df27-4f48-87d8-9d99b5654c68'),('53ac0af7-d902-4297-bb43-02ca622af443','bd948f5c-f9e2-4c0e-8dbe-797e79b9bd21'),('53ac0af7-d902-4297-bb43-02ca622af443','c1c3304e-149e-43de-b5b8-26c49ebb5452'),('53ac0af7-d902-4297-bb43-02ca622af443','d1513732-81d6-428f-8c38-9a56eb0147e4'),('53ac0af7-d902-4297-bb43-02ca622af443','de6bc6e8-6aeb-40a5-9c6d-379d604189e7'),('53ac0af7-d902-4297-bb43-02ca622af443','df8c9378-e783-4b9c-982b-d4d76319439d'),('53ac0af7-d902-4297-bb43-02ca622af443','e131f442-c2ef-4cba-a4dc-b407bbae00d5'),('53ac0af7-d902-4297-bb43-02ca622af443','eb01c342-4fcd-4609-8d68-e194303b1a36'),('53ac0af7-d902-4297-bb43-02ca622af443','ebfee069-6116-4ef0-91f0-a5122a30a450'),('53ac0af7-d902-4297-bb43-02ca622af443','f4320e60-2039-4739-85a6-1907fb5381fc'),('573b3b50-f3eb-4b54-9087-6efa53eb1ff7','12f448ef-09b2-48ba-85da-41e8afb21bcd'),('573b3b50-f3eb-4b54-9087-6efa53eb1ff7','26d3f0d2-b82b-4957-a605-f95422b66ccd'),('573b3b50-f3eb-4b54-9087-6efa53eb1ff7','73845187-717d-4e92-88a7-6a1c76c3c2ad'),('573b3b50-f3eb-4b54-9087-6efa53eb1ff7','88409ccb-4651-4eaa-9bb9-9dae1af91a7b'),('6b39aef1-6453-4249-8dec-0f94eff882f5','c42e08f5-b4f0-43c0-a110-487aca1395d1'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','180f36f7-3a67-44cb-a947-0b121f01323e'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','2255c746-9015-4391-98e0-cfbd76827b2a'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','6b39aef1-6453-4249-8dec-0f94eff882f5'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','76207671-9f20-4acd-b29b-9dad3c06460a'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','77282cdc-9fd6-4a3f-a060-a6dbac681b73'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','7df80110-a5ec-4683-92c3-9c9d82733b64'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','89145fe2-eff6-47a2-97bf-6e9c3cbddcc6'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','8a7fd67f-a72e-4ad4-9a59-ae62c3047dfe'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','95a9de72-237d-4b27-ae6e-41e284136b0c'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','9b8c0cb4-0d33-4d54-94df-2efc4f127598'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','a121aab4-b9a8-4d77-afc4-497c395237b6'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','afa8be55-f28b-45c2-9d35-6a3027980ba3'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','ba4b5515-bfeb-42e9-a972-3dff914a25f3'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','c42e08f5-b4f0-43c0-a110-487aca1395d1'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','dca756a5-789e-49d0-b21f-b21ff28cd71a'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','e4f651a0-cb0a-4661-965c-59227575a05c'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','e6bb0f6e-3117-4457-8cf7-2dcecee5840c'),('791e1da8-6009-45ed-8354-1a1d7c50c9db','f8387623-e50c-4dda-b6f5-dcab77dad435'),('801a06f9-9f5d-44b3-a8f7-6d38430addf9','7260e6f3-63ce-4b39-a3a8-6fbc15fd4767'),('801a06f9-9f5d-44b3-a8f7-6d38430addf9','ebfee069-6116-4ef0-91f0-a5122a30a450'),('91f44252-0322-4020-ba72-647d33855330','a61c00d6-cdf1-4ec0-8006-dfe29cc9c270'),('a121aab4-b9a8-4d77-afc4-497c395237b6','2255c746-9015-4391-98e0-cfbd76827b2a'),('a121aab4-b9a8-4d77-afc4-497c395237b6','8a7fd67f-a72e-4ad4-9a59-ae62c3047dfe'),('a2a697e2-447f-410a-9c90-dd24dab996d6','308a5da2-b123-4966-ae33-e5c56b21a0d5'),('cf738219-e0ee-44b0-b350-9392777e4f45','2e5d968f-7722-4a13-a0e7-df5a287dd871'),('cf738219-e0ee-44b0-b350-9392777e4f45','6b0276cf-349d-452e-8fe8-5e500e32d881'),('cf738219-e0ee-44b0-b350-9392777e4f45','a2a697e2-447f-410a-9c90-dd24dab996d6'),('cf738219-e0ee-44b0-b350-9392777e4f45','c3170e3a-fb05-42ce-b5b9-1d566d267812'),('db15cef5-ccda-4a95-ac15-a2f2bdbba6c3','7a139502-d5e0-4752-a8d7-904b1dabaa93'),('de6bc6e8-6aeb-40a5-9c6d-379d604189e7','0548b617-79a7-4edd-b6f6-b1c01a3c8185'),('de6bc6e8-6aeb-40a5-9c6d-379d604189e7','64984076-3a2a-4836-af50-56b3a1b584aa'),('f4320e60-2039-4739-85a6-1907fb5381fc','665b3f9f-cdd1-4945-b45a-35d2d80ba318');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
                              `ID` varchar(36) NOT NULL,
                              `SALT` tinyblob,
                              `TYPE` varchar(255) DEFAULT NULL,
                              `USER_ID` varchar(36) DEFAULT NULL,
                              `CREATED_DATE` bigint(20) DEFAULT NULL,
                              `USER_LABEL` varchar(255) DEFAULT NULL,
                              `SECRET_DATA` longtext,
                              `CREDENTIAL_DATA` longtext,
                              `PRIORITY` int(11) DEFAULT NULL,
                              PRIMARY KEY (`ID`),
                              KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
                              CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('4733b2c6-f539-457a-b2f1-9db19a132963',NULL,'password','eaf0f6d3-6e45-46d4-9c0d-3a2383d352b7',1640142016804,NULL,'{\"value\":\"czCtRHx2Zpop9EP+pSDAvE/O0k5Ybu1u0EBV7ecwlplioUqp5p5kt3zWCWY87sywGFtbzhBz44Vky3qby6YMwQ==\",\"salt\":\"mu27DpSp4y8C+R2qzyLTOg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('dad4e767-9d8d-48ef-a67c-38fc329802e7',NULL,'password','879717fc-aa9b-4ba7-bdc6-97aed0f58f76',1640141861339,NULL,'{\"value\":\"JGHPwu2FxUdVG8tTjniuXJC1B16rrcVKjmVaptLYpaQTZpoi2soCXI8V9Zj/XOUvXq9TOOmRc1YF5+2EC2qzLw==\",\"salt\":\"hH1v72JXWB2WMCJq7FMQYA==\",\"additionalParameters\":{}}','{\"hashIterations\":100000,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
                                     `ID` varchar(255) NOT NULL,
                                     `AUTHOR` varchar(255) NOT NULL,
                                     `FILENAME` varchar(255) NOT NULL,
                                     `DATEEXECUTED` datetime NOT NULL,
                                     `ORDEREXECUTED` int(11) NOT NULL,
                                     `EXECTYPE` varchar(10) NOT NULL,
                                     `MD5SUM` varchar(35) DEFAULT NULL,
                                     `DESCRIPTION` varchar(255) DEFAULT NULL,
                                     `COMMENTS` varchar(255) DEFAULT NULL,
                                     `TAG` varchar(255) DEFAULT NULL,
                                     `LIQUIBASE` varchar(20) DEFAULT NULL,
                                     `CONTEXTS` varchar(255) DEFAULT NULL,
                                     `LABELS` varchar(255) DEFAULT NULL,
                                     `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2021-12-22 02:56:57',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2021-12-22 02:56:57',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2021-12-22 02:56:58',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2021-12-22 02:56:58',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2021-12-22 02:56:59',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2021-12-22 02:56:59',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2021-12-22 02:57:00',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2021-12-22 02:57:00',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2021-12-22 02:57:00',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2021-12-22 02:57:02',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2021-12-22 02:57:03',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2021-12-22 02:57:03',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2021-12-22 02:57:03',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-12-22 02:57:04',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-12-22 02:57:04',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-12-22 02:57:04',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2021-12-22 02:57:04',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2021-12-22 02:57:04',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2021-12-22 02:57:05',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2021-12-22 02:57:06',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2021-12-22 02:57:06',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2021-12-22 02:57:06',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2021-12-22 02:57:06',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2021-12-22 02:57:06',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2021-12-22 02:57:06',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0141812680'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2021-12-22 02:57:06',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2021-12-22 02:57:07',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2021-12-22 02:57:07',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2021-12-22 02:57:07',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2021-12-22 02:57:07',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2021-12-22 02:57:08',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2021-12-22 02:57:08',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-12-22 02:57:08',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-12-22 02:57:08',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-12-22 02:57:09',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2021-12-22 02:57:09',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2021-12-22 02:57:09',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'0141812680'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2021-12-22 02:57:09',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2021-12-22 02:57:09',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-12-22 02:57:09',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-12-22 02:57:09',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2021-12-22 02:57:09',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2021-12-22 02:57:11',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2021-12-22 02:57:11',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-12-22 02:57:11',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-12-22 02:57:11',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-12-22 02:57:11',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-12-22 02:57:12',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2021-12-22 02:57:12',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2021-12-22 02:57:13',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2021-12-22 02:57:13',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2021-12-22 02:57:13',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2021-12-22 02:57:13',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0141812680'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2021-12-22 02:57:13',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-12-22 02:57:13',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-12-22 02:57:13',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-12-22 02:57:14',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2021-12-22 02:57:15',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2021-12-22 02:57:16',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2021-12-22 02:57:16',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-12-22 02:57:16',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2021-12-22 02:57:16',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2021-12-22 02:57:16',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2021-12-22 02:57:16',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2021-12-22 02:57:16',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2021-12-22 02:57:16',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2021-12-22 02:57:16',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2021-12-22 02:57:17',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2021-12-22 02:57:17',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2021-12-22 02:57:17',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'0141812680'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2021-12-22 02:57:17',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'0141812680'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-12-22 02:57:17',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0141812680'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-12-22 02:57:17',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0141812680'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-12-22 02:57:17',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'0141812680'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-12-22 02:57:18',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2021-12-22 02:57:18',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'0141812680'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-12-22 02:57:18',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'0141812680'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-12-22 02:57:18',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-12-22 02:57:18',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2021-12-22 02:57:18',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-12-22 02:57:18',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'0141812680'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-12-22 02:57:18',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'0141812680'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-12-22 02:57:18',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'0141812680'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-12-22 02:57:18',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'0141812680'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2021-12-22 02:57:18',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'0141812680'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2021-12-22 02:57:18',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'0141812680'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-12-22 02:57:18',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2021-12-22 02:57:18',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'0141812680'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-12-22 02:57:18',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'0141812680'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-12-22 02:57:18',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'0141812680'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-12-22 02:57:18',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'0141812680'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-12-22 02:57:18',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-12-22 02:57:18',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'0141812680'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-12-22 02:57:18',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'0141812680'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-12-22 02:57:18',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'0141812680'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2021-12-22 02:57:18',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'0141812680'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-12-22 02:57:18',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'0141812680'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-12-22 02:57:18',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'0141812680'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-12-22 02:57:18',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'0141812680'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-12-22 02:57:18',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'0141812680'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-12-22 02:57:18',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'0141812680'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-12-22 02:57:18',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'0141812680'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2021-12-22 02:57:18',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'0141812680'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2021-12-22 02:57:18',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'0141812680');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
                                         `ID` int(11) NOT NULL,
                                         `LOCKED` bit(1) NOT NULL,
                                         `LOCKGRANTED` datetime DEFAULT NULL,
                                         `LOCKEDBY` varchar(255) DEFAULT NULL,
                                         PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
                                        `REALM_ID` varchar(36) NOT NULL,
                                        `SCOPE_ID` varchar(36) NOT NULL,
                                        `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
                                        PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
                                        KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
                                        KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
                                        CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('Development','25129e87-3873-4424-9b7e-df0d881e71ca',_binary ''),('Development','3f053da8-b1eb-45af-8ca3-82b97e572149',_binary '\0'),('Development','46b6b9ce-9ff9-403e-afe5-459d6b5777db',_binary '\0'),('Development','acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7',_binary '\0'),('Development','c745fc8f-e6f0-4993-b6e8-df4c0d15b09c',_binary ''),('Development','ea0af24d-22aa-4ba0-bd52-52a2ba30d2a9',_binary ''),('Development','f5f24bf7-1361-49f5-bb85-6b3b1e0923d5',_binary ''),('Development','f99f3aff-0cf3-449a-9e9c-858e126640f3',_binary '\0'),('Development','fb556c63-9a66-432b-b722-dc17474660b4',_binary ''),('master','08548448-54c8-4072-98b9-e0f563e01c55',_binary '\0'),('master','11c0fa93-71bc-4600-bcab-1faea41eb115',_binary '\0'),('master','27eed4ff-e948-45f4-b154-3abbde982900',_binary ''),('master','438a8bad-bdf3-4d35-95c6-1e5e48afb7ae',_binary '\0'),('master','47b4034c-243c-44ba-804c-17298c802870',_binary ''),('master','487de97b-50a1-4013-ba27-6ae576b4161e',_binary ''),('master','59b2cfa2-f364-46c7-bee2-66c7c01ab793',_binary ''),('master','5c3d190b-68c1-4fd1-8267-175b07ab2855',_binary ''),('master','5df8afcc-6caa-48aa-8fc1-356b4bb62ff2',_binary '\0');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
                                `ID` varchar(36) NOT NULL,
                                `CLIENT_ID` varchar(255) DEFAULT NULL,
                                `DETAILS_JSON` varchar(2550) DEFAULT NULL,
                                `ERROR` varchar(255) DEFAULT NULL,
                                `IP_ADDRESS` varchar(255) DEFAULT NULL,
                                `REALM_ID` varchar(255) DEFAULT NULL,
                                `SESSION_ID` varchar(255) DEFAULT NULL,
                                `EVENT_TIME` bigint(20) DEFAULT NULL,
                                `TYPE` varchar(255) DEFAULT NULL,
                                `USER_ID` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`),
                                KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
                                      `IDENTITY_PROVIDER` varchar(255) NOT NULL,
                                      `REALM_ID` varchar(36) DEFAULT NULL,
                                      `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
                                      `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
                                      `TOKEN` text,
                                      `USER_ID` varchar(36) NOT NULL,
                                      PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
                                      KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
                                      KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
                                      CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
                                  `ID` varchar(255) NOT NULL,
                                  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
                                  `REALM_ID` varchar(36) NOT NULL,
                                  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
                                      `ID` varchar(36) NOT NULL,
                                      `NAME` varchar(255) NOT NULL,
                                      `USER_ID` varchar(255) NOT NULL,
                                      `REALM_ID` varchar(36) NOT NULL,
                                      `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                      `VALUE` varchar(2024) DEFAULT NULL,
                                      PRIMARY KEY (`ID`),
                                      KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
                                    `ID` varchar(36) NOT NULL,
                                    `CLIENT_ID` varchar(255) DEFAULT NULL,
                                    `USER_ID` varchar(255) NOT NULL,
                                    `REALM_ID` varchar(36) NOT NULL,
                                    `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                    `CREATED_DATE` bigint(20) DEFAULT NULL,
                                    `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
                                    `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
                                    `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
                                    PRIMARY KEY (`ID`),
                                    KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
                                    KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
                                    KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
                                             `USER_CONSENT_ID` varchar(36) NOT NULL,
                                             `SCOPE_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
                                       `ID` varchar(36) NOT NULL,
                                       `SALT` tinyblob,
                                       `TYPE` varchar(255) DEFAULT NULL,
                                       `CREATED_DATE` bigint(20) DEFAULT NULL,
                                       `USER_ID` varchar(255) NOT NULL,
                                       `REALM_ID` varchar(36) NOT NULL,
                                       `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                       `USER_LABEL` varchar(255) DEFAULT NULL,
                                       `SECRET_DATA` longtext,
                                       `CREDENTIAL_DATA` longtext,
                                       `PRIORITY` int(11) DEFAULT NULL,
                                       PRIMARY KEY (`ID`),
                                       KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
                                       KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
                                             `GROUP_ID` varchar(36) NOT NULL,
                                             `USER_ID` varchar(255) NOT NULL,
                                             `REALM_ID` varchar(36) NOT NULL,
                                             `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                             PRIMARY KEY (`GROUP_ID`,`USER_ID`),
                                             KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
                                             KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
                                            `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
                                            `USER_ID` varchar(255) NOT NULL,
                                            `REALM_ID` varchar(36) NOT NULL,
                                            `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                            PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
                                            KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
                                            KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
                                         `ROLE_ID` varchar(36) NOT NULL,
                                         `USER_ID` varchar(255) NOT NULL,
                                         `REALM_ID` varchar(36) NOT NULL,
                                         `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
                                         PRIMARY KEY (`ROLE_ID`,`USER_ID`),
                                         KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
                                         KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
                                   `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
                                   `NAME` varchar(255) NOT NULL,
                                   `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                   `GROUP_ID` varchar(36) NOT NULL,
                                   PRIMARY KEY (`ID`),
                                   KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
                                   CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
                                      `ROLE_ID` varchar(36) NOT NULL,
                                      `GROUP_ID` varchar(36) NOT NULL,
                                      PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
                                      KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
                                      CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `GROUP_ROLE_MAPPING` VALUES ('1324059c-3d33-4ace-a54f-7a67c19f183d','a3ac901c-a83b-4674-8097-2e5a9b3fe754');
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
                                     `INTERNAL_ID` varchar(36) NOT NULL,
                                     `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                                     `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
                                     `PROVIDER_ID` varchar(255) DEFAULT NULL,
                                     `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
                                     `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
                                     `REALM_ID` varchar(36) DEFAULT NULL,
                                     `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
                                     `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
                                     `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
                                     `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
                                     `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                     `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
                                     PRIMARY KEY (`INTERNAL_ID`),
                                     UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
                                     KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
                                     CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
                                            `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
                                            `VALUE` longtext,
                                            `NAME` varchar(255) NOT NULL,
                                            PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
                                            CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
                                            `ID` varchar(36) NOT NULL,
                                            `NAME` varchar(255) NOT NULL,
                                            `IDP_ALIAS` varchar(255) NOT NULL,
                                            `IDP_MAPPER_NAME` varchar(255) NOT NULL,
                                            `REALM_ID` varchar(36) NOT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
                                            CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
                                     `IDP_MAPPER_ID` varchar(36) NOT NULL,
                                     `VALUE` longtext,
                                     `NAME` varchar(255) NOT NULL,
                                     PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
                                     CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
                                  `ID` varchar(36) NOT NULL,
                                  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                  `PARENT_GROUP` varchar(36) NOT NULL,
                                  `REALM_ID` varchar(36) DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_GROUP` VALUES ('a3ac901c-a83b-4674-8097-2e5a9b3fe754','Members',' ','Development');
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
                                 `ID` varchar(36) NOT NULL,
                                 `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
                                 `CLIENT_ROLE` bit(1) DEFAULT NULL,
                                 `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                 `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                 `REALM_ID` varchar(255) DEFAULT NULL,
                                 `CLIENT` varchar(36) DEFAULT NULL,
                                 `REALM` varchar(36) DEFAULT NULL,
                                 PRIMARY KEY (`ID`),
                                 UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
                                 KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
                                 KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
                                 CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('005d4e9e-b9b1-4c0b-a824-9ec34ee93f73','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_impersonation}','impersonation','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('010fbafb-fe64-4eb1-b799-1914bef57e98','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_view-realm}','view-realm','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('015831f3-642e-4a88-bfc9-6391ea26d4fa','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',_binary '','${role_manage-consent}','manage-consent','Development','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',NULL),('0548b617-79a7-4edd-b6f6-b1c01a3c8185','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_query-users}','query-users','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('0f127baa-2a38-4db8-a611-dee48bc62d86','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',_binary '','${role_view-consent}','view-consent','Development','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',NULL),('103b7022-311b-47f9-b8e1-4fcd71a66e0f','9c21cc16-bf32-4420-8ab1-235022f00958',_binary '','${role_manage-account-links}','manage-account-links','master','9c21cc16-bf32-4420-8ab1-235022f00958',NULL),('12f448ef-09b2-48ba-85da-41e8afb21bcd','9c21cc16-bf32-4420-8ab1-235022f00958',_binary '','${role_manage-account}','manage-account','master','9c21cc16-bf32-4420-8ab1-235022f00958',NULL),('1324059c-3d33-4ace-a54f-7a67c19f183d','Development',_binary '\0',NULL,'member','Development',NULL,NULL),('180f36f7-3a67-44cb-a947-0b121f01323e','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_view-events}','view-events','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('2255c746-9015-4391-98e0-cfbd76827b2a','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_query-groups}','query-groups','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('26d3f0d2-b82b-4957-a605-f95422b66ccd','9c21cc16-bf32-4420-8ab1-235022f00958',_binary '','${role_view-profile}','view-profile','master','9c21cc16-bf32-4420-8ab1-235022f00958',NULL),('26e2fa8f-a5ec-4430-a234-7388f3bfb1d1','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_view-realm}','view-realm','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('2e5d968f-7722-4a13-a0e7-df5a287dd871','Development',_binary '\0','${role_offline-access}','offline_access','Development',NULL,NULL),('308a5da2-b123-4966-ae33-e5c56b21a0d5','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',_binary '','${role_manage-account-links}','manage-account-links','Development','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',NULL),('332b65f9-199d-4c1a-97bc-fd5d2bd83808','9c21cc16-bf32-4420-8ab1-235022f00958',_binary '','${role_delete-account}','delete-account','master','9c21cc16-bf32-4420-8ab1-235022f00958',NULL),('33c54cc0-956b-44b1-aab3-dc3ac541092b','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_manage-authorization}','manage-authorization','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('3e78a9af-c994-49a0-9f76-c06eae3e0786','1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06',_binary '','${role_read-token}','read-token','Development','1c9d5dae-f3d0-4f17-94ef-6b8a8f481c06',NULL),('44e139e0-20b3-4211-826a-2a86a469ea32','0a01a21c-27ea-4580-a411-d37cdc6a34ba',_binary '','${role_read-token}','read-token','master','0a01a21c-27ea-4580-a411-d37cdc6a34ba',NULL),('4de783d9-1da6-400b-be68-4b4255d50fa2','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_view-events}','view-events','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('53ac0af7-d902-4297-bb43-02ca622af443','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('573b3b50-f3eb-4b54-9087-6efa53eb1ff7','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('64227b34-227a-489a-a5c8-1699c450550e','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_manage-authorization}','manage-authorization','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('6493e199-ed8b-4595-ad1a-408b714e1129','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_manage-users}','manage-users','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('64984076-3a2a-4836-af50-56b3a1b584aa','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_query-groups}','query-groups','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('665b3f9f-cdd1-4945-b45a-35d2d80ba318','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_query-clients}','query-clients','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('6900d58a-0927-4977-888d-7af2d04c3f41','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_impersonation}','impersonation','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('6b0276cf-349d-452e-8fe8-5e500e32d881','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',_binary '','${role_view-profile}','view-profile','Development','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',NULL),('6b39aef1-6453-4249-8dec-0f94eff882f5','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_view-clients}','view-clients','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('6e371577-e0d2-49c2-a3d6-355652b435e0','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_query-realms}','query-realms','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('7260e6f3-63ce-4b39-a3a8-6fbc15fd4767','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_query-groups}','query-groups','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('73845187-717d-4e92-88a7-6a1c76c3c2ad','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('7491d972-3a78-46a9-8be1-333f369888c4','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_query-realms}','query-realms','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('76207671-9f20-4acd-b29b-9dad3c06460a','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_view-realm}','view-realm','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('77282cdc-9fd6-4a3f-a060-a6dbac681b73','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_query-realms}','query-realms','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('78ef58c5-9b4e-41ae-92b7-c3651a53c819','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_view-identity-providers}','view-identity-providers','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('791e1da8-6009-45ed-8354-1a1d7c50c9db','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_realm-admin}','realm-admin','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('7a139502-d5e0-4752-a8d7-904b1dabaa93','9c21cc16-bf32-4420-8ab1-235022f00958',_binary '','${role_view-consent}','view-consent','master','9c21cc16-bf32-4420-8ab1-235022f00958',NULL),('7df80110-a5ec-4683-92c3-9c9d82733b64','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_impersonation}','impersonation','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('801a06f9-9f5d-44b3-a8f7-6d38430addf9','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_view-users}','view-users','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('8077c638-9bcf-46a4-be03-ba87a92577a6','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',_binary '','${role_delete-account}','delete-account','Development','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',NULL),('81b9d551-3b5a-4c56-9dee-ee56e72beb3b','b0aa1970-e558-4014-8f56-9086d2a6cebd',_binary '',NULL,'uma_protection','Development','b0aa1970-e558-4014-8f56-9086d2a6cebd',NULL),('8547a52f-d7f4-41fa-a25d-1b7d4322b72e','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('88409ccb-4651-4eaa-9bb9-9dae1af91a7b','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('88c630f8-cc2f-41c4-8b9d-966050b11947','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_create-client}','create-client','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('89145fe2-eff6-47a2-97bf-6e9c3cbddcc6','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_view-authorization}','view-authorization','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('8a7fd67f-a72e-4ad4-9a59-ae62c3047dfe','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_query-users}','query-users','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('8f0fbfdf-dbfd-450a-b382-f2e6fd031d12','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('91f44252-0322-4020-ba72-647d33855330','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_view-clients}','view-clients','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('95a9de72-237d-4b27-ae6e-41e284136b0c','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_manage-identity-providers}','manage-identity-providers','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('968632e1-8080-4cca-bba3-678b37b2210a','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_create-client}','create-client','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('9b8c0cb4-0d33-4d54-94df-2efc4f127598','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_create-client}','create-client','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('9d0f9bee-dce0-441e-bb0c-fa4548d8ebdf','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_manage-clients}','manage-clients','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('9fbdd8da-93e9-42af-bd76-73b9b82e4b79','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_manage-events}','manage-events','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('a121aab4-b9a8-4d77-afc4-497c395237b6','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_view-users}','view-users','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('a2a697e2-447f-410a-9c90-dd24dab996d6','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',_binary '','${role_manage-account}','manage-account','Development','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',NULL),('a615e61f-7a18-441f-89a9-83bd742a7833','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_view-authorization}','view-authorization','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('a61c00d6-cdf1-4ec0-8006-dfe29cc9c270','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_query-clients}','query-clients','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('ac3ad2d0-f012-408d-948e-8d5cc00c512a','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_manage-users}','manage-users','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('af8970c1-70b3-46cf-b88d-37a44e328915','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_manage-realm}','manage-realm','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('afa8be55-f28b-45c2-9d35-6a3027980ba3','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_view-identity-providers}','view-identity-providers','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('b36ea10d-02fb-4c39-89be-f54d0c452042','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',_binary '','${role_view-applications}','view-applications','Development','5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb',NULL),('b6fe0c86-df27-4f48-87d8-9d99b5654c68','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_view-authorization}','view-authorization','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('ba4b5515-bfeb-42e9-a972-3dff914a25f3','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_manage-authorization}','manage-authorization','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('bd948f5c-f9e2-4c0e-8dbe-797e79b9bd21','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('c1c3304e-149e-43de-b5b8-26c49ebb5452','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_view-identity-providers}','view-identity-providers','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('c3170e3a-fb05-42ce-b5b9-1d566d267812','Development',_binary '\0','${role_uma_authorization}','uma_authorization','Development',NULL,NULL),('c42e08f5-b4f0-43c0-a110-487aca1395d1','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_query-clients}','query-clients','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('cf738219-e0ee-44b0-b350-9392777e4f45','Development',_binary '\0','${role_default-roles}','default-roles-development','Development',NULL,NULL),('d023c0ee-329d-40c4-bf5c-f9512c16cbbd','9c21cc16-bf32-4420-8ab1-235022f00958',_binary '','${role_view-applications}','view-applications','master','9c21cc16-bf32-4420-8ab1-235022f00958',NULL),('d1513732-81d6-428f-8c38-9a56eb0147e4','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_manage-realm}','manage-realm','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('db15cef5-ccda-4a95-ac15-a2f2bdbba6c3','9c21cc16-bf32-4420-8ab1-235022f00958',_binary '','${role_manage-consent}','manage-consent','master','9c21cc16-bf32-4420-8ab1-235022f00958',NULL),('dca756a5-789e-49d0-b21f-b21ff28cd71a','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_manage-clients}','manage-clients','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('de6bc6e8-6aeb-40a5-9c6d-379d604189e7','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_view-users}','view-users','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('df8c9378-e783-4b9c-982b-d4d76319439d','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_manage-clients}','manage-clients','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('e131f442-c2ef-4cba-a4dc-b407bbae00d5','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_manage-events}','manage-events','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('e4f651a0-cb0a-4661-965c-59227575a05c','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_manage-events}','manage-events','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('e6bb0f6e-3117-4457-8cf7-2dcecee5840c','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_manage-users}','manage-users','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL),('eb01c342-4fcd-4609-8d68-e194303b1a36','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_view-events}','view-events','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('ebfee069-6116-4ef0-91f0-a5122a30a450','f81ef084-5707-4aea-9a2e-d96019ea3db2',_binary '','${role_query-users}','query-users','master','f81ef084-5707-4aea-9a2e-d96019ea3db2',NULL),('f4320e60-2039-4739-85a6-1907fb5381fc','a4b5a883-9e34-4e89-bcce-e4a165927d9d',_binary '','${role_view-clients}','view-clients','master','a4b5a883-9e34-4e89-bcce-e4a165927d9d',NULL),('f8387623-e50c-4dda-b6f5-dcab77dad435','962df3c7-34b6-49a6-977b-21e820d49d65',_binary '','${role_manage-realm}','manage-realm','Development','962df3c7-34b6-49a6-977b-21e820d49d65',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
                                   `ID` varchar(36) NOT NULL,
                                   `VERSION` varchar(36) DEFAULT NULL,
                                   `UPDATE_TIME` bigint(20) NOT NULL DEFAULT '0',
                                   PRIMARY KEY (`ID`),
                                   KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('n4vkx','15.1.0',1640141849);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
                                          `USER_SESSION_ID` varchar(36) NOT NULL,
                                          `CLIENT_ID` varchar(255) NOT NULL,
                                          `OFFLINE_FLAG` varchar(4) NOT NULL,
                                          `TIMESTAMP` int(11) DEFAULT NULL,
                                          `DATA` longtext,
                                          `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
                                          `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
                                          PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
                                          KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
                                          KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
                                        `USER_SESSION_ID` varchar(36) NOT NULL,
                                        `USER_ID` varchar(255) DEFAULT NULL,
                                        `REALM_ID` varchar(36) NOT NULL,
                                        `CREATED_ON` int(11) NOT NULL,
                                        `OFFLINE_FLAG` varchar(4) NOT NULL,
                                        `DATA` longtext,
                                        `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT '0',
                                        PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
                                        KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
                                        KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
                                        KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
                                        KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
                                 `POLICY_ID` varchar(36) NOT NULL,
                                 `NAME` varchar(255) NOT NULL,
                                 `VALUE` longtext,
                                 PRIMARY KEY (`POLICY_ID`,`NAME`),
                                 CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
INSERT INTO `POLICY_CONFIG` VALUES ('79d4a3f6-7695-4882-96ac-9ee675b3e8c1','code','// by default, grants any permission associated with this policy\n$evaluation.grant();\n'),('ff0a0e08-266e-488f-beb5-2fe04275188e','defaultResourceType','urn:reference-auth:resources:default');
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
                                   `ID` varchar(36) NOT NULL,
                                   `NAME` varchar(255) NOT NULL,
                                   `PROTOCOL` varchar(255) NOT NULL,
                                   `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
                                   `CLIENT_ID` varchar(36) DEFAULT NULL,
                                   `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
                                   PRIMARY KEY (`ID`),
                                   KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
                                   KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
                                   CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
                                   CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0a4160be-3070-43ba-b4b4-bcde6bd2013c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('10a8bfee-a84c-4829-b012-d997ca0a706f','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('10fafdad-616b-4041-9a1a-365c0a989bbc','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'25129e87-3873-4424-9b7e-df0d881e71ca'),('133fb27d-4575-4569-9a4a-8372066282aa','address','openid-connect','oidc-address-mapper',NULL,'3f053da8-b1eb-45af-8ca3-82b97e572149'),('1589d244-2e46-4e06-88ed-01092cc2cb6e','email','openid-connect','oidc-usermodel-property-mapper',NULL,'25129e87-3873-4424-9b7e-df0d881e71ca'),('15d0665b-cdc7-4521-adcf-b35d987f2713','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'5c3d190b-68c1-4fd1-8267-175b07ab2855'),('1f1863cf-107b-4ad0-9625-985321686d6b','address','openid-connect','oidc-address-mapper',NULL,'11c0fa93-71bc-4600-bcab-1faea41eb115'),('25df1477-e0bb-4b72-975a-4efe994efe53','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7'),('2c9e3ddb-a42a-43bf-a99e-164c56dababd','username','openid-connect','oidc-usermodel-property-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('2fada69b-a9b9-4fd8-b232-3a4f6e05f0c1','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'59b2cfa2-f364-46c7-bee2-66c7c01ab793'),('32f06648-d8a5-4891-8188-99633ea3e8ef','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','b0aa1970-e558-4014-8f56-9086d2a6cebd',NULL),('33a5f7f3-0cb5-4ced-8e80-3a708dd78ffd','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','b0aa1970-e558-4014-8f56-9086d2a6cebd',NULL),('37735bec-7b9d-43f6-82ed-c019a3b4ca3a','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('3f52e855-ae5f-4305-880f-67086ce32f14','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('4055927d-4fb3-4e0f-9a8b-65f448f89b06','locale','openid-connect','oidc-usermodel-attribute-mapper','596372dd-e55d-4b73-b324-e18847c0d57f',NULL),('461baa96-6d59-4f73-a4b2-a04ef24c35c7','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'f5f24bf7-1361-49f5-bb85-6b3b1e0923d5'),('4b7e7bc1-bf3c-47f0-8f08-62c8cb1f98d2','audience resolve','openid-connect','oidc-audience-resolve-mapper','321c27d5-f3c5-407a-9832-006a86070cc2',NULL),('4b94f191-3f3e-49a9-a683-8e189c63cbe1','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('5b0d2161-a099-4526-ba52-951ea8211937','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('5d884852-b1da-4165-bec3-c2c505ae5cce','audience resolve','openid-connect','oidc-audience-resolve-mapper','2d328edb-3511-4289-89d3-f77876b8ad24',NULL),('5eb435d4-b6fc-448d-a37b-cf1e1bd26bec','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'fb556c63-9a66-432b-b722-dc17474660b4'),('62a8d6af-f6d9-44fe-8cf5-cf5c1833e7d3','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('67a2898a-d867-46ad-b9da-d8914102162a','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('68099a3f-1b0f-4194-94fb-ef1c30d76771','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'438a8bad-bdf3-4d35-95c6-1e5e48afb7ae'),('694cf96f-bba4-48fd-a854-0bc4a9e40aec','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('72552149-1fff-4e8a-90cd-38ea0f806d5b','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'fb556c63-9a66-432b-b722-dc17474660b4'),('75ccb7f2-d356-432c-a79c-16c279685a6a','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('767b1809-7074-468f-a37d-242768fee503','full name','openid-connect','oidc-full-name-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('7a8c8738-61c7-4380-9b95-bda169d2b7d1','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('7fc9d6a8-3550-4844-bc7d-c9f67706bbda','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'47b4034c-243c-44ba-804c-17298c802870'),('9029ef3a-fa0e-467e-8dc7-e4242b2ecd29','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('90dd67b0-4155-42b0-8097-3641c1963963','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'438a8bad-bdf3-4d35-95c6-1e5e48afb7ae'),('9143da83-c31f-402d-ae94-466502f07c90','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f99f3aff-0cf3-449a-9e9c-858e126640f3'),('97527377-b738-4d3c-80ae-5593c1784c92','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('9c35da8d-ecb9-4847-9703-56cb87674a42','role list','saml','saml-role-list-mapper',NULL,'ea0af24d-22aa-4ba0-bd52-52a2ba30d2a9'),('a1c3e991-4471-461c-b9dc-696d12b890f8','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('a1ccca97-570d-460e-b43c-958a51e411dc','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('a203df3b-cb77-4d33-b3c8-7a3831204372','role list','saml','saml-role-list-mapper',NULL,'487de97b-50a1-4013-ba27-6ae576b4161e'),('a4bff786-61d9-4629-a5b2-d37ed3d69692','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','b0aa1970-e558-4014-8f56-9086d2a6cebd',NULL),('a6c1a263-bd19-4286-a6b7-502dd28edc23','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'f99f3aff-0cf3-449a-9e9c-858e126640f3'),('b1e8b1ee-9413-4c3e-a7f8-02e635df9a37','email','openid-connect','oidc-usermodel-property-mapper',NULL,'59b2cfa2-f364-46c7-bee2-66c7c01ab793'),('bc7485b7-7e5b-4454-8032-fbab050e1276','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'08548448-54c8-4072-98b9-e0f563e01c55'),('bf43d6ab-57ed-4b93-888a-e33bbc961d65','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('ca33d0bb-f93c-4dbc-b06c-6a7368cb2f83','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'08548448-54c8-4072-98b9-e0f563e01c55'),('cd4a1df5-c276-4594-a5ce-6384f0b8654e','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'acbbf1e5-9234-4cf1-ba5a-cd319d46a9a7'),('d1fb6589-bcd6-4738-b1a1-07514c9f876a','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('d236e278-e757-46ef-937e-bae517498b55','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'fb556c63-9a66-432b-b722-dc17474660b4'),('d27570aa-132b-49fe-a4a1-973d02434db3','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('dc3b79ad-49ce-453d-b81b-2dd513f96e0d','full name','openid-connect','oidc-full-name-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('e0400569-9e59-4221-a55e-44d45ff6cd6e','username','openid-connect','oidc-usermodel-property-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900'),('e1752e6b-558d-4668-a222-a2a10deea79c','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('e76c1118-1094-4e25-befd-dbebfd3d1a27','locale','openid-connect','oidc-usermodel-attribute-mapper','dfeb885d-1411-41e3-98c7-f2532b11f386',NULL),('e90e935f-b581-4af6-8f75-b59231a6ffbc','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('e92e4060-5d55-405a-8d0f-559e7bbf5b04','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'47b4034c-243c-44ba-804c-17298c802870'),('ed2dc355-6bfe-48ce-85e1-4b837da440c8','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'47b4034c-243c-44ba-804c-17298c802870'),('eff5e430-5e18-4022-8699-be5855448c56','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('f1894343-5a7e-47ec-8c65-8010c7893c7f','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('f7122343-1976-4af5-83f1-050d45a37e2a','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c745fc8f-e6f0-4993-b6e8-df4c0d15b09c'),('f97f98f1-1f19-456a-bd7f-30e9027dc489','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'27eed4ff-e948-45f4-b154-3abbde982900');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
                                          `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
                                          `VALUE` longtext,
                                          `NAME` varchar(255) NOT NULL,
                                          PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
                                          CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0a4160be-3070-43ba-b4b4-bcde6bd2013c','true','access.token.claim'),('0a4160be-3070-43ba-b4b4-bcde6bd2013c','locale','claim.name'),('0a4160be-3070-43ba-b4b4-bcde6bd2013c','true','id.token.claim'),('0a4160be-3070-43ba-b4b4-bcde6bd2013c','String','jsonType.label'),('0a4160be-3070-43ba-b4b4-bcde6bd2013c','locale','user.attribute'),('0a4160be-3070-43ba-b4b4-bcde6bd2013c','true','userinfo.token.claim'),('10a8bfee-a84c-4829-b012-d997ca0a706f','true','access.token.claim'),('10a8bfee-a84c-4829-b012-d997ca0a706f','family_name','claim.name'),('10a8bfee-a84c-4829-b012-d997ca0a706f','true','id.token.claim'),('10a8bfee-a84c-4829-b012-d997ca0a706f','String','jsonType.label'),('10a8bfee-a84c-4829-b012-d997ca0a706f','lastName','user.attribute'),('10a8bfee-a84c-4829-b012-d997ca0a706f','true','userinfo.token.claim'),('10fafdad-616b-4041-9a1a-365c0a989bbc','true','access.token.claim'),('10fafdad-616b-4041-9a1a-365c0a989bbc','email_verified','claim.name'),('10fafdad-616b-4041-9a1a-365c0a989bbc','true','id.token.claim'),('10fafdad-616b-4041-9a1a-365c0a989bbc','boolean','jsonType.label'),('10fafdad-616b-4041-9a1a-365c0a989bbc','emailVerified','user.attribute'),('10fafdad-616b-4041-9a1a-365c0a989bbc','true','userinfo.token.claim'),('133fb27d-4575-4569-9a4a-8372066282aa','true','access.token.claim'),('133fb27d-4575-4569-9a4a-8372066282aa','true','id.token.claim'),('133fb27d-4575-4569-9a4a-8372066282aa','country','user.attribute.country'),('133fb27d-4575-4569-9a4a-8372066282aa','formatted','user.attribute.formatted'),('133fb27d-4575-4569-9a4a-8372066282aa','locality','user.attribute.locality'),('133fb27d-4575-4569-9a4a-8372066282aa','postal_code','user.attribute.postal_code'),('133fb27d-4575-4569-9a4a-8372066282aa','region','user.attribute.region'),('133fb27d-4575-4569-9a4a-8372066282aa','street','user.attribute.street'),('133fb27d-4575-4569-9a4a-8372066282aa','true','userinfo.token.claim'),('1589d244-2e46-4e06-88ed-01092cc2cb6e','true','access.token.claim'),('1589d244-2e46-4e06-88ed-01092cc2cb6e','email','claim.name'),('1589d244-2e46-4e06-88ed-01092cc2cb6e','true','id.token.claim'),('1589d244-2e46-4e06-88ed-01092cc2cb6e','String','jsonType.label'),('1589d244-2e46-4e06-88ed-01092cc2cb6e','email','user.attribute'),('1589d244-2e46-4e06-88ed-01092cc2cb6e','true','userinfo.token.claim'),('1f1863cf-107b-4ad0-9625-985321686d6b','true','access.token.claim'),('1f1863cf-107b-4ad0-9625-985321686d6b','true','id.token.claim'),('1f1863cf-107b-4ad0-9625-985321686d6b','country','user.attribute.country'),('1f1863cf-107b-4ad0-9625-985321686d6b','formatted','user.attribute.formatted'),('1f1863cf-107b-4ad0-9625-985321686d6b','locality','user.attribute.locality'),('1f1863cf-107b-4ad0-9625-985321686d6b','postal_code','user.attribute.postal_code'),('1f1863cf-107b-4ad0-9625-985321686d6b','region','user.attribute.region'),('1f1863cf-107b-4ad0-9625-985321686d6b','street','user.attribute.street'),('1f1863cf-107b-4ad0-9625-985321686d6b','true','userinfo.token.claim'),('25df1477-e0bb-4b72-975a-4efe994efe53','true','access.token.claim'),('25df1477-e0bb-4b72-975a-4efe994efe53','groups','claim.name'),('25df1477-e0bb-4b72-975a-4efe994efe53','true','id.token.claim'),('25df1477-e0bb-4b72-975a-4efe994efe53','String','jsonType.label'),('25df1477-e0bb-4b72-975a-4efe994efe53','true','multivalued'),('25df1477-e0bb-4b72-975a-4efe994efe53','foo','user.attribute'),('25df1477-e0bb-4b72-975a-4efe994efe53','true','userinfo.token.claim'),('2c9e3ddb-a42a-43bf-a99e-164c56dababd','true','access.token.claim'),('2c9e3ddb-a42a-43bf-a99e-164c56dababd','preferred_username','claim.name'),('2c9e3ddb-a42a-43bf-a99e-164c56dababd','true','id.token.claim'),('2c9e3ddb-a42a-43bf-a99e-164c56dababd','String','jsonType.label'),('2c9e3ddb-a42a-43bf-a99e-164c56dababd','username','user.attribute'),('2c9e3ddb-a42a-43bf-a99e-164c56dababd','true','userinfo.token.claim'),('2fada69b-a9b9-4fd8-b232-3a4f6e05f0c1','true','access.token.claim'),('2fada69b-a9b9-4fd8-b232-3a4f6e05f0c1','email_verified','claim.name'),('2fada69b-a9b9-4fd8-b232-3a4f6e05f0c1','true','id.token.claim'),('2fada69b-a9b9-4fd8-b232-3a4f6e05f0c1','boolean','jsonType.label'),('2fada69b-a9b9-4fd8-b232-3a4f6e05f0c1','emailVerified','user.attribute'),('2fada69b-a9b9-4fd8-b232-3a4f6e05f0c1','true','userinfo.token.claim'),('32f06648-d8a5-4891-8188-99633ea3e8ef','true','access.token.claim'),('32f06648-d8a5-4891-8188-99633ea3e8ef','clientHost','claim.name'),('32f06648-d8a5-4891-8188-99633ea3e8ef','true','id.token.claim'),('32f06648-d8a5-4891-8188-99633ea3e8ef','String','jsonType.label'),('32f06648-d8a5-4891-8188-99633ea3e8ef','clientHost','user.session.note'),('32f06648-d8a5-4891-8188-99633ea3e8ef','true','userinfo.token.claim'),('33a5f7f3-0cb5-4ced-8e80-3a708dd78ffd','true','access.token.claim'),('33a5f7f3-0cb5-4ced-8e80-3a708dd78ffd','clientId','claim.name'),('33a5f7f3-0cb5-4ced-8e80-3a708dd78ffd','true','id.token.claim'),('33a5f7f3-0cb5-4ced-8e80-3a708dd78ffd','String','jsonType.label'),('33a5f7f3-0cb5-4ced-8e80-3a708dd78ffd','clientId','user.session.note'),('33a5f7f3-0cb5-4ced-8e80-3a708dd78ffd','true','userinfo.token.claim'),('37735bec-7b9d-43f6-82ed-c019a3b4ca3a','true','access.token.claim'),('37735bec-7b9d-43f6-82ed-c019a3b4ca3a','website','claim.name'),('37735bec-7b9d-43f6-82ed-c019a3b4ca3a','true','id.token.claim'),('37735bec-7b9d-43f6-82ed-c019a3b4ca3a','String','jsonType.label'),('37735bec-7b9d-43f6-82ed-c019a3b4ca3a','website','user.attribute'),('37735bec-7b9d-43f6-82ed-c019a3b4ca3a','true','userinfo.token.claim'),('3f52e855-ae5f-4305-880f-67086ce32f14','true','access.token.claim'),('3f52e855-ae5f-4305-880f-67086ce32f14','birthdate','claim.name'),('3f52e855-ae5f-4305-880f-67086ce32f14','true','id.token.claim'),('3f52e855-ae5f-4305-880f-67086ce32f14','String','jsonType.label'),('3f52e855-ae5f-4305-880f-67086ce32f14','birthdate','user.attribute'),('3f52e855-ae5f-4305-880f-67086ce32f14','true','userinfo.token.claim'),('4055927d-4fb3-4e0f-9a8b-65f448f89b06','true','access.token.claim'),('4055927d-4fb3-4e0f-9a8b-65f448f89b06','locale','claim.name'),('4055927d-4fb3-4e0f-9a8b-65f448f89b06','true','id.token.claim'),('4055927d-4fb3-4e0f-9a8b-65f448f89b06','String','jsonType.label'),('4055927d-4fb3-4e0f-9a8b-65f448f89b06','locale','user.attribute'),('4055927d-4fb3-4e0f-9a8b-65f448f89b06','true','userinfo.token.claim'),('4b94f191-3f3e-49a9-a683-8e189c63cbe1','true','access.token.claim'),('4b94f191-3f3e-49a9-a683-8e189c63cbe1','profile','claim.name'),('4b94f191-3f3e-49a9-a683-8e189c63cbe1','true','id.token.claim'),('4b94f191-3f3e-49a9-a683-8e189c63cbe1','String','jsonType.label'),('4b94f191-3f3e-49a9-a683-8e189c63cbe1','profile','user.attribute'),('4b94f191-3f3e-49a9-a683-8e189c63cbe1','true','userinfo.token.claim'),('5b0d2161-a099-4526-ba52-951ea8211937','true','access.token.claim'),('5b0d2161-a099-4526-ba52-951ea8211937','locale','claim.name'),('5b0d2161-a099-4526-ba52-951ea8211937','true','id.token.claim'),('5b0d2161-a099-4526-ba52-951ea8211937','String','jsonType.label'),('5b0d2161-a099-4526-ba52-951ea8211937','locale','user.attribute'),('5b0d2161-a099-4526-ba52-951ea8211937','true','userinfo.token.claim'),('5eb435d4-b6fc-448d-a37b-cf1e1bd26bec','true','access.token.claim'),('5eb435d4-b6fc-448d-a37b-cf1e1bd26bec','realm_access.roles','claim.name'),('5eb435d4-b6fc-448d-a37b-cf1e1bd26bec','String','jsonType.label'),('5eb435d4-b6fc-448d-a37b-cf1e1bd26bec','true','multivalued'),('5eb435d4-b6fc-448d-a37b-cf1e1bd26bec','foo','user.attribute'),('62a8d6af-f6d9-44fe-8cf5-cf5c1833e7d3','true','access.token.claim'),('62a8d6af-f6d9-44fe-8cf5-cf5c1833e7d3','given_name','claim.name'),('62a8d6af-f6d9-44fe-8cf5-cf5c1833e7d3','true','id.token.claim'),('62a8d6af-f6d9-44fe-8cf5-cf5c1833e7d3','String','jsonType.label'),('62a8d6af-f6d9-44fe-8cf5-cf5c1833e7d3','firstName','user.attribute'),('62a8d6af-f6d9-44fe-8cf5-cf5c1833e7d3','true','userinfo.token.claim'),('67a2898a-d867-46ad-b9da-d8914102162a','true','access.token.claim'),('67a2898a-d867-46ad-b9da-d8914102162a','gender','claim.name'),('67a2898a-d867-46ad-b9da-d8914102162a','true','id.token.claim'),('67a2898a-d867-46ad-b9da-d8914102162a','String','jsonType.label'),('67a2898a-d867-46ad-b9da-d8914102162a','gender','user.attribute'),('67a2898a-d867-46ad-b9da-d8914102162a','true','userinfo.token.claim'),('68099a3f-1b0f-4194-94fb-ef1c30d76771','true','access.token.claim'),('68099a3f-1b0f-4194-94fb-ef1c30d76771','phone_number','claim.name'),('68099a3f-1b0f-4194-94fb-ef1c30d76771','true','id.token.claim'),('68099a3f-1b0f-4194-94fb-ef1c30d76771','String','jsonType.label'),('68099a3f-1b0f-4194-94fb-ef1c30d76771','phoneNumber','user.attribute'),('68099a3f-1b0f-4194-94fb-ef1c30d76771','true','userinfo.token.claim'),('694cf96f-bba4-48fd-a854-0bc4a9e40aec','true','access.token.claim'),('694cf96f-bba4-48fd-a854-0bc4a9e40aec','gender','claim.name'),('694cf96f-bba4-48fd-a854-0bc4a9e40aec','true','id.token.claim'),('694cf96f-bba4-48fd-a854-0bc4a9e40aec','String','jsonType.label'),('694cf96f-bba4-48fd-a854-0bc4a9e40aec','gender','user.attribute'),('694cf96f-bba4-48fd-a854-0bc4a9e40aec','true','userinfo.token.claim'),('75ccb7f2-d356-432c-a79c-16c279685a6a','true','access.token.claim'),('75ccb7f2-d356-432c-a79c-16c279685a6a','nickname','claim.name'),('75ccb7f2-d356-432c-a79c-16c279685a6a','true','id.token.claim'),('75ccb7f2-d356-432c-a79c-16c279685a6a','String','jsonType.label'),('75ccb7f2-d356-432c-a79c-16c279685a6a','nickname','user.attribute'),('75ccb7f2-d356-432c-a79c-16c279685a6a','true','userinfo.token.claim'),('767b1809-7074-468f-a37d-242768fee503','true','access.token.claim'),('767b1809-7074-468f-a37d-242768fee503','true','id.token.claim'),('767b1809-7074-468f-a37d-242768fee503','true','userinfo.token.claim'),('7a8c8738-61c7-4380-9b95-bda169d2b7d1','true','access.token.claim'),('7a8c8738-61c7-4380-9b95-bda169d2b7d1','family_name','claim.name'),('7a8c8738-61c7-4380-9b95-bda169d2b7d1','true','id.token.claim'),('7a8c8738-61c7-4380-9b95-bda169d2b7d1','String','jsonType.label'),('7a8c8738-61c7-4380-9b95-bda169d2b7d1','lastName','user.attribute'),('7a8c8738-61c7-4380-9b95-bda169d2b7d1','true','userinfo.token.claim'),('7fc9d6a8-3550-4844-bc7d-c9f67706bbda','true','access.token.claim'),('7fc9d6a8-3550-4844-bc7d-c9f67706bbda','resource_access.${client_id}.roles','claim.name'),('7fc9d6a8-3550-4844-bc7d-c9f67706bbda','String','jsonType.label'),('7fc9d6a8-3550-4844-bc7d-c9f67706bbda','true','multivalued'),('7fc9d6a8-3550-4844-bc7d-c9f67706bbda','foo','user.attribute'),('9029ef3a-fa0e-467e-8dc7-e4242b2ecd29','true','access.token.claim'),('9029ef3a-fa0e-467e-8dc7-e4242b2ecd29','updated_at','claim.name'),('9029ef3a-fa0e-467e-8dc7-e4242b2ecd29','true','id.token.claim'),('9029ef3a-fa0e-467e-8dc7-e4242b2ecd29','String','jsonType.label'),('9029ef3a-fa0e-467e-8dc7-e4242b2ecd29','updatedAt','user.attribute'),('9029ef3a-fa0e-467e-8dc7-e4242b2ecd29','true','userinfo.token.claim'),('90dd67b0-4155-42b0-8097-3641c1963963','true','access.token.claim'),('90dd67b0-4155-42b0-8097-3641c1963963','phone_number_verified','claim.name'),('90dd67b0-4155-42b0-8097-3641c1963963','true','id.token.claim'),('90dd67b0-4155-42b0-8097-3641c1963963','boolean','jsonType.label'),('90dd67b0-4155-42b0-8097-3641c1963963','phoneNumberVerified','user.attribute'),('90dd67b0-4155-42b0-8097-3641c1963963','true','userinfo.token.claim'),('9143da83-c31f-402d-ae94-466502f07c90','true','access.token.claim'),('9143da83-c31f-402d-ae94-466502f07c90','phone_number','claim.name'),('9143da83-c31f-402d-ae94-466502f07c90','true','id.token.claim'),('9143da83-c31f-402d-ae94-466502f07c90','String','jsonType.label'),('9143da83-c31f-402d-ae94-466502f07c90','phoneNumber','user.attribute'),('9143da83-c31f-402d-ae94-466502f07c90','true','userinfo.token.claim'),('97527377-b738-4d3c-80ae-5593c1784c92','true','access.token.claim'),('97527377-b738-4d3c-80ae-5593c1784c92','picture','claim.name'),('97527377-b738-4d3c-80ae-5593c1784c92','true','id.token.claim'),('97527377-b738-4d3c-80ae-5593c1784c92','String','jsonType.label'),('97527377-b738-4d3c-80ae-5593c1784c92','picture','user.attribute'),('97527377-b738-4d3c-80ae-5593c1784c92','true','userinfo.token.claim'),('9c35da8d-ecb9-4847-9703-56cb87674a42','Role','attribute.name'),('9c35da8d-ecb9-4847-9703-56cb87674a42','Basic','attribute.nameformat'),('9c35da8d-ecb9-4847-9703-56cb87674a42','false','single'),('a1c3e991-4471-461c-b9dc-696d12b890f8','true','access.token.claim'),('a1c3e991-4471-461c-b9dc-696d12b890f8','nickname','claim.name'),('a1c3e991-4471-461c-b9dc-696d12b890f8','true','id.token.claim'),('a1c3e991-4471-461c-b9dc-696d12b890f8','String','jsonType.label'),('a1c3e991-4471-461c-b9dc-696d12b890f8','nickname','user.attribute'),('a1c3e991-4471-461c-b9dc-696d12b890f8','true','userinfo.token.claim'),('a1ccca97-570d-460e-b43c-958a51e411dc','true','access.token.claim'),('a1ccca97-570d-460e-b43c-958a51e411dc','middle_name','claim.name'),('a1ccca97-570d-460e-b43c-958a51e411dc','true','id.token.claim'),('a1ccca97-570d-460e-b43c-958a51e411dc','String','jsonType.label'),('a1ccca97-570d-460e-b43c-958a51e411dc','middleName','user.attribute'),('a1ccca97-570d-460e-b43c-958a51e411dc','true','userinfo.token.claim'),('a203df3b-cb77-4d33-b3c8-7a3831204372','Role','attribute.name'),('a203df3b-cb77-4d33-b3c8-7a3831204372','Basic','attribute.nameformat'),('a203df3b-cb77-4d33-b3c8-7a3831204372','false','single'),('a4bff786-61d9-4629-a5b2-d37ed3d69692','true','access.token.claim'),('a4bff786-61d9-4629-a5b2-d37ed3d69692','clientAddress','claim.name'),('a4bff786-61d9-4629-a5b2-d37ed3d69692','true','id.token.claim'),('a4bff786-61d9-4629-a5b2-d37ed3d69692','String','jsonType.label'),('a4bff786-61d9-4629-a5b2-d37ed3d69692','clientAddress','user.session.note'),('a4bff786-61d9-4629-a5b2-d37ed3d69692','true','userinfo.token.claim'),('a6c1a263-bd19-4286-a6b7-502dd28edc23','true','access.token.claim'),('a6c1a263-bd19-4286-a6b7-502dd28edc23','phone_number_verified','claim.name'),('a6c1a263-bd19-4286-a6b7-502dd28edc23','true','id.token.claim'),('a6c1a263-bd19-4286-a6b7-502dd28edc23','boolean','jsonType.label'),('a6c1a263-bd19-4286-a6b7-502dd28edc23','phoneNumberVerified','user.attribute'),('a6c1a263-bd19-4286-a6b7-502dd28edc23','true','userinfo.token.claim'),('b1e8b1ee-9413-4c3e-a7f8-02e635df9a37','true','access.token.claim'),('b1e8b1ee-9413-4c3e-a7f8-02e635df9a37','email','claim.name'),('b1e8b1ee-9413-4c3e-a7f8-02e635df9a37','true','id.token.claim'),('b1e8b1ee-9413-4c3e-a7f8-02e635df9a37','String','jsonType.label'),('b1e8b1ee-9413-4c3e-a7f8-02e635df9a37','email','user.attribute'),('b1e8b1ee-9413-4c3e-a7f8-02e635df9a37','true','userinfo.token.claim'),('bc7485b7-7e5b-4454-8032-fbab050e1276','true','access.token.claim'),('bc7485b7-7e5b-4454-8032-fbab050e1276','groups','claim.name'),('bc7485b7-7e5b-4454-8032-fbab050e1276','true','id.token.claim'),('bc7485b7-7e5b-4454-8032-fbab050e1276','String','jsonType.label'),('bc7485b7-7e5b-4454-8032-fbab050e1276','true','multivalued'),('bc7485b7-7e5b-4454-8032-fbab050e1276','foo','user.attribute'),('bf43d6ab-57ed-4b93-888a-e33bbc961d65','true','access.token.claim'),('bf43d6ab-57ed-4b93-888a-e33bbc961d65','given_name','claim.name'),('bf43d6ab-57ed-4b93-888a-e33bbc961d65','true','id.token.claim'),('bf43d6ab-57ed-4b93-888a-e33bbc961d65','String','jsonType.label'),('bf43d6ab-57ed-4b93-888a-e33bbc961d65','firstName','user.attribute'),('bf43d6ab-57ed-4b93-888a-e33bbc961d65','true','userinfo.token.claim'),('ca33d0bb-f93c-4dbc-b06c-6a7368cb2f83','true','access.token.claim'),('ca33d0bb-f93c-4dbc-b06c-6a7368cb2f83','upn','claim.name'),('ca33d0bb-f93c-4dbc-b06c-6a7368cb2f83','true','id.token.claim'),('ca33d0bb-f93c-4dbc-b06c-6a7368cb2f83','String','jsonType.label'),('ca33d0bb-f93c-4dbc-b06c-6a7368cb2f83','username','user.attribute'),('ca33d0bb-f93c-4dbc-b06c-6a7368cb2f83','true','userinfo.token.claim'),('cd4a1df5-c276-4594-a5ce-6384f0b8654e','true','access.token.claim'),('cd4a1df5-c276-4594-a5ce-6384f0b8654e','upn','claim.name'),('cd4a1df5-c276-4594-a5ce-6384f0b8654e','true','id.token.claim'),('cd4a1df5-c276-4594-a5ce-6384f0b8654e','String','jsonType.label'),('cd4a1df5-c276-4594-a5ce-6384f0b8654e','username','user.attribute'),('cd4a1df5-c276-4594-a5ce-6384f0b8654e','true','userinfo.token.claim'),('d1fb6589-bcd6-4738-b1a1-07514c9f876a','true','access.token.claim'),('d1fb6589-bcd6-4738-b1a1-07514c9f876a','zoneinfo','claim.name'),('d1fb6589-bcd6-4738-b1a1-07514c9f876a','true','id.token.claim'),('d1fb6589-bcd6-4738-b1a1-07514c9f876a','String','jsonType.label'),('d1fb6589-bcd6-4738-b1a1-07514c9f876a','zoneinfo','user.attribute'),('d1fb6589-bcd6-4738-b1a1-07514c9f876a','true','userinfo.token.claim'),('d236e278-e757-46ef-937e-bae517498b55','true','access.token.claim'),('d236e278-e757-46ef-937e-bae517498b55','resource_access.${client_id}.roles','claim.name'),('d236e278-e757-46ef-937e-bae517498b55','String','jsonType.label'),('d236e278-e757-46ef-937e-bae517498b55','true','multivalued'),('d236e278-e757-46ef-937e-bae517498b55','foo','user.attribute'),('d27570aa-132b-49fe-a4a1-973d02434db3','true','access.token.claim'),('d27570aa-132b-49fe-a4a1-973d02434db3','picture','claim.name'),('d27570aa-132b-49fe-a4a1-973d02434db3','true','id.token.claim'),('d27570aa-132b-49fe-a4a1-973d02434db3','String','jsonType.label'),('d27570aa-132b-49fe-a4a1-973d02434db3','picture','user.attribute'),('d27570aa-132b-49fe-a4a1-973d02434db3','true','userinfo.token.claim'),('dc3b79ad-49ce-453d-b81b-2dd513f96e0d','true','access.token.claim'),('dc3b79ad-49ce-453d-b81b-2dd513f96e0d','true','id.token.claim'),('dc3b79ad-49ce-453d-b81b-2dd513f96e0d','true','userinfo.token.claim'),('e0400569-9e59-4221-a55e-44d45ff6cd6e','true','access.token.claim'),('e0400569-9e59-4221-a55e-44d45ff6cd6e','preferred_username','claim.name'),('e0400569-9e59-4221-a55e-44d45ff6cd6e','true','id.token.claim'),('e0400569-9e59-4221-a55e-44d45ff6cd6e','String','jsonType.label'),('e0400569-9e59-4221-a55e-44d45ff6cd6e','username','user.attribute'),('e0400569-9e59-4221-a55e-44d45ff6cd6e','true','userinfo.token.claim'),('e1752e6b-558d-4668-a222-a2a10deea79c','true','access.token.claim'),('e1752e6b-558d-4668-a222-a2a10deea79c','profile','claim.name'),('e1752e6b-558d-4668-a222-a2a10deea79c','true','id.token.claim'),('e1752e6b-558d-4668-a222-a2a10deea79c','String','jsonType.label'),('e1752e6b-558d-4668-a222-a2a10deea79c','profile','user.attribute'),('e1752e6b-558d-4668-a222-a2a10deea79c','true','userinfo.token.claim'),('e76c1118-1094-4e25-befd-dbebfd3d1a27','true','access.token.claim'),('e76c1118-1094-4e25-befd-dbebfd3d1a27','locale','claim.name'),('e76c1118-1094-4e25-befd-dbebfd3d1a27','true','id.token.claim'),('e76c1118-1094-4e25-befd-dbebfd3d1a27','String','jsonType.label'),('e76c1118-1094-4e25-befd-dbebfd3d1a27','locale','user.attribute'),('e76c1118-1094-4e25-befd-dbebfd3d1a27','true','userinfo.token.claim'),('e90e935f-b581-4af6-8f75-b59231a6ffbc','true','access.token.claim'),('e90e935f-b581-4af6-8f75-b59231a6ffbc','updated_at','claim.name'),('e90e935f-b581-4af6-8f75-b59231a6ffbc','true','id.token.claim'),('e90e935f-b581-4af6-8f75-b59231a6ffbc','String','jsonType.label'),('e90e935f-b581-4af6-8f75-b59231a6ffbc','updatedAt','user.attribute'),('e90e935f-b581-4af6-8f75-b59231a6ffbc','true','userinfo.token.claim'),('e92e4060-5d55-405a-8d0f-559e7bbf5b04','true','access.token.claim'),('e92e4060-5d55-405a-8d0f-559e7bbf5b04','realm_access.roles','claim.name'),('e92e4060-5d55-405a-8d0f-559e7bbf5b04','String','jsonType.label'),('e92e4060-5d55-405a-8d0f-559e7bbf5b04','true','multivalued'),('e92e4060-5d55-405a-8d0f-559e7bbf5b04','foo','user.attribute'),('eff5e430-5e18-4022-8699-be5855448c56','true','access.token.claim'),('eff5e430-5e18-4022-8699-be5855448c56','birthdate','claim.name'),('eff5e430-5e18-4022-8699-be5855448c56','true','id.token.claim'),('eff5e430-5e18-4022-8699-be5855448c56','String','jsonType.label'),('eff5e430-5e18-4022-8699-be5855448c56','birthdate','user.attribute'),('eff5e430-5e18-4022-8699-be5855448c56','true','userinfo.token.claim'),('f1894343-5a7e-47ec-8c65-8010c7893c7f','true','access.token.claim'),('f1894343-5a7e-47ec-8c65-8010c7893c7f','website','claim.name'),('f1894343-5a7e-47ec-8c65-8010c7893c7f','true','id.token.claim'),('f1894343-5a7e-47ec-8c65-8010c7893c7f','String','jsonType.label'),('f1894343-5a7e-47ec-8c65-8010c7893c7f','website','user.attribute'),('f1894343-5a7e-47ec-8c65-8010c7893c7f','true','userinfo.token.claim'),('f7122343-1976-4af5-83f1-050d45a37e2a','true','access.token.claim'),('f7122343-1976-4af5-83f1-050d45a37e2a','zoneinfo','claim.name'),('f7122343-1976-4af5-83f1-050d45a37e2a','true','id.token.claim'),('f7122343-1976-4af5-83f1-050d45a37e2a','String','jsonType.label'),('f7122343-1976-4af5-83f1-050d45a37e2a','zoneinfo','user.attribute'),('f7122343-1976-4af5-83f1-050d45a37e2a','true','userinfo.token.claim'),('f97f98f1-1f19-456a-bd7f-30e9027dc489','true','access.token.claim'),('f97f98f1-1f19-456a-bd7f-30e9027dc489','middle_name','claim.name'),('f97f98f1-1f19-456a-bd7f-30e9027dc489','true','id.token.claim'),('f97f98f1-1f19-456a-bd7f-30e9027dc489','String','jsonType.label'),('f97f98f1-1f19-456a-bd7f-30e9027dc489','middleName','user.attribute'),('f97f98f1-1f19-456a-bd7f-30e9027dc489','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
                         `ID` varchar(36) NOT NULL,
                         `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
                         `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
                         `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
                         `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
                         `ADMIN_THEME` varchar(255) DEFAULT NULL,
                         `EMAIL_THEME` varchar(255) DEFAULT NULL,
                         `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
                         `LOGIN_THEME` varchar(255) DEFAULT NULL,
                         `NAME` varchar(255) DEFAULT NULL,
                         `NOT_BEFORE` int(11) DEFAULT NULL,
                         `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
                         `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
                         `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
                         `SSL_REQUIRED` varchar(255) DEFAULT NULL,
                         `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
                         `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
                         `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
                         `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
                         `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
                         `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
                         `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
                         `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
                         `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
                         `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
                         `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
                         `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
                         `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
                         `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
                         `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
                         `BROWSER_FLOW` varchar(36) DEFAULT NULL,
                         `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
                         `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
                         `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
                         `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
                         `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
                         `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
                         `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
                         `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
                         `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
                         `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
                         `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
                         `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
                         `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
                         `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
                         `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
                         PRIMARY KEY (`ID`),
                         UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
                         KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('Development',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'Development',0,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','a4b5a883-9e34-4e89-bcce-e4a165927d9d',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','edf01535-e5d0-406e-bacd-fbad9fe376c9','673ab45f-b084-4a5b-90d5-7ec680f6a5ae','a5125d1c-7d2f-4003-a5ec-aed2bb454eb0','7251ae01-42c3-48a5-a302-2548e8b88eea','fcfdc299-627c-494e-ab63-300495f41200',2592000,_binary '\0',900,_binary '',_binary '\0','8892faf4-be52-4d50-8b76-1cc35551ccef',0,_binary '\0',0,0,'cf738219-e0ee-44b0-b350-9392777e4f45'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','f81ef084-5707-4aea-9a2e-d96019ea3db2',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','a0c7d07a-0454-4b90-ad38-ce1608196883','b5a14e95-a964-45a1-b7df-1c542dc30ace','527111f0-56a7-4568-ba56-2ef990fafffc','b3005756-35cb-4be3-ac46-cc053df1260c','331abe46-cbc6-4f3f-b234-b7a13b359bfb',2592000,_binary '\0',900,_binary '',_binary '\0','19522276-1536-4d10-af88-5ff93a04cf6a',0,_binary '\0',0,0,'573b3b50-f3eb-4b54-9087-6efa53eb1ff7');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
                                   `NAME` varchar(255) NOT NULL,
                                   `REALM_ID` varchar(36) NOT NULL,
                                   `VALUE` longtext CHARACTER SET utf8,
                                   PRIMARY KEY (`NAME`,`REALM_ID`),
                                   KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
                                   CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('actionTokenGeneratedByAdminLifespan','Development','43200'),('actionTokenGeneratedByUserLifespan','Development','300'),('bruteForceProtected','Development','false'),('bruteForceProtected','master','false'),('cibaAuthRequestedUserHint','Development','login_hint'),('cibaBackchannelTokenDeliveryMode','Development','poll'),('cibaExpiresIn','Development','120'),('cibaInterval','Development','5'),('clientOfflineSessionIdleTimeout','Development','0'),('clientOfflineSessionMaxLifespan','Development','0'),('clientSessionIdleTimeout','Development','0'),('clientSessionMaxLifespan','Development','0'),('defaultSignatureAlgorithm','Development','RS256'),('defaultSignatureAlgorithm','master','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','Development','30'),('failureFactor','master','30'),('maxDeltaTimeSeconds','Development','43200'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','Development','900'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','Development','60'),('minimumQuickLoginWaitSeconds','master','60'),('oauth2DeviceCodeLifespan','Development','600'),('oauth2DevicePollingInterval','Development','5'),('offlineSessionMaxLifespan','Development','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','Development','false'),('offlineSessionMaxLifespanEnabled','master','false'),('parRequestUriLifespan','Development','60'),('permanentLockout','Development','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','Development','1000'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','Development','60'),('waitIncrementSeconds','master','60'),('webAuthnPolicyAttestationConveyancePreference','Development','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','Development','not specified'),('webAuthnPolicyAuthenticatorAttachment','Development','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','Development','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','Development','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','Development','false'),('webAuthnPolicyCreateTimeout','Development','0'),('webAuthnPolicyCreateTimeoutPasswordless','Development','0'),('webAuthnPolicyRequireResidentKey','Development','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','Development','not specified'),('webAuthnPolicyRpEntityName','Development','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','Development','keycloak'),('webAuthnPolicyRpId','Development',''),('webAuthnPolicyRpIdPasswordless','Development',''),('webAuthnPolicySignatureAlgorithms','Development','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','Development','ES256'),('webAuthnPolicyUserVerificationRequirement','Development','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','Development','not specified'),('_browser_header.contentSecurityPolicy','Development','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','Development',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','Development','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','Development','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','Development','SAMEORIGIN'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','Development','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','Development','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
                                        `REALM_ID` varchar(36) NOT NULL,
                                        `GROUP_ID` varchar(36) NOT NULL,
                                        PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
                                        UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
                                        KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
                                        CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
                                             `REALM_ID` varchar(36) NOT NULL,
                                             `VALUE` varchar(255) NOT NULL,
                                             PRIMARY KEY (`REALM_ID`,`VALUE`),
                                             KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
                                             CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
                                          `REALM_ID` varchar(36) NOT NULL,
                                          `VALUE` varchar(255) NOT NULL,
                                          PRIMARY KEY (`REALM_ID`,`VALUE`),
                                          KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
                                          CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('Development','jboss-logging'),('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
                                       `REALM_ID` varchar(255) NOT NULL,
                                       `LOCALE` varchar(255) NOT NULL,
                                       `TEXTS` longtext CHARACTER SET utf8 NOT NULL,
                                       PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
                                             `TYPE` varchar(255) NOT NULL,
                                             `FORM_LABEL` varchar(255) DEFAULT NULL,
                                             `INPUT` bit(1) NOT NULL DEFAULT b'0',
                                             `SECRET` bit(1) NOT NULL DEFAULT b'0',
                                             `REALM_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`REALM_ID`,`TYPE`),
                                             CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','Development'),('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
                                     `REALM_ID` varchar(36) NOT NULL,
                                     `VALUE` varchar(255) DEFAULT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     PRIMARY KEY (`REALM_ID`,`NAME`),
                                     CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
                                           `REALM_ID` varchar(36) NOT NULL,
                                           `VALUE` varchar(255) NOT NULL,
                                           PRIMARY KEY (`REALM_ID`,`VALUE`),
                                           KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
                                           CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
                                 `CLIENT_ID` varchar(36) NOT NULL,
                                 `VALUE` varchar(255) NOT NULL,
                                 PRIMARY KEY (`CLIENT_ID`,`VALUE`),
                                 KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
                                 CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('2d328edb-3511-4289-89d3-f77876b8ad24','/realms/master/account/*'),('321c27d5-f3c5-407a-9832-006a86070cc2','/realms/Development/account/*'),('596372dd-e55d-4b73-b324-e18847c0d57f','/admin/Development/console/*'),('5f33679a-e5bf-46b6-9cb1-75ec3c14d9eb','/realms/Development/account/*'),('9c21cc16-bf32-4420-8ab1-235022f00958','/realms/master/account/*'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','http://localhost:3001/*'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','http://sandbox:8060/*'),('dfeb885d-1411-41e3-98c7-f2532b11f386','/admin/master/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
                                          `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
                                          `VALUE` longtext,
                                          `NAME` varchar(255) NOT NULL,
                                          PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
                                            `ID` varchar(36) NOT NULL,
                                            `ALIAS` varchar(255) DEFAULT NULL,
                                            `NAME` varchar(255) DEFAULT NULL,
                                            `REALM_ID` varchar(36) DEFAULT NULL,
                                            `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                                            `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
                                            `PROVIDER_ID` varchar(255) DEFAULT NULL,
                                            `PRIORITY` int(11) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
                                            CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('15c61b9b-e9d3-4ee7-8fc8-84260f6df5b6','CONFIGURE_TOTP','Configure OTP','Development',_binary '',_binary '\0','CONFIGURE_TOTP',10),('2298746b-be93-4d3d-b3e1-21b1e8209c53','terms_and_conditions','Terms and Conditions','Development',_binary '\0',_binary '\0','terms_and_conditions',20),('28902b84-b636-4c67-b6bc-c66675a876f5','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('292ddb9a-ee74-48d6-8921-17e289a37a44','update_user_locale','Update User Locale','Development',_binary '',_binary '\0','update_user_locale',1000),('537bb99e-adf4-44b8-b6c8-4cdd26262cf3','UPDATE_PASSWORD','Update Password','Development',_binary '',_binary '\0','UPDATE_PASSWORD',30),('60d780a9-c8da-443b-9608-c5eefb65928a','delete_account','Delete Account','Development',_binary '\0',_binary '\0','delete_account',60),('6d599e69-4eb5-4814-aa89-2182d952cb15','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('77f4a5f7-9a09-45e9-9d2e-ddd14f08054e','UPDATE_PROFILE','Update Profile','Development',_binary '',_binary '\0','UPDATE_PROFILE',40),('897cd974-3e99-4336-bcd2-f656bf02b1c9','VERIFY_EMAIL','Verify Email','Development',_binary '',_binary '\0','VERIFY_EMAIL',50),('8c3ea5c4-a3cf-48ee-bd01-f2adee46cd95','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('b447b996-5f6c-429d-80eb-4c7c94d0f148','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('c7d41b44-34b6-4389-884b-e5a1e8f065b4','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('e28763a5-8b2a-4ebf-8dc7-c3ffd0101d39','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('f5dc1fbf-aa49-4c22-be9f-ffb28cd9f92b','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
                                      `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
                                      `NAME` varchar(255) NOT NULL,
                                      `VALUE` varchar(255) DEFAULT NULL,
                                      `RESOURCE_ID` varchar(36) NOT NULL,
                                      PRIMARY KEY (`ID`),
                                      KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
                                      CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
                                   `RESOURCE_ID` varchar(36) NOT NULL,
                                   `POLICY_ID` varchar(36) NOT NULL,
                                   PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
                                   KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
                                   CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
                                   CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
                                  `RESOURCE_ID` varchar(36) NOT NULL,
                                  `SCOPE_ID` varchar(36) NOT NULL,
                                  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
                                  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
                                  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
                                  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
                                   `ID` varchar(36) NOT NULL,
                                   `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
                                   `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
                                   `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT '1',
                                   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER` VALUES ('b0aa1970-e558-4014-8f56-9086d2a6cebd',_binary '','0',1);
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
                                               `ID` varchar(36) NOT NULL,
                                               `OWNER` varchar(255) DEFAULT NULL,
                                               `REQUESTER` varchar(255) DEFAULT NULL,
                                               `CREATED_TIMESTAMP` bigint(20) NOT NULL,
                                               `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
                                               `RESOURCE_ID` varchar(36) NOT NULL,
                                               `SCOPE_ID` varchar(36) DEFAULT NULL,
                                               `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
                                               `POLICY_ID` varchar(36) DEFAULT NULL,
                                               PRIMARY KEY (`ID`),
                                               UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
                                               KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
                                               KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
                                               KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
                                               KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
                                               CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
                                               CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
                                               CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
                                               CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
                                          `ID` varchar(36) NOT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                          `TYPE` varchar(255) NOT NULL,
                                          `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
                                          `LOGIC` varchar(20) DEFAULT NULL,
                                          `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
                                          `OWNER` varchar(255) DEFAULT NULL,
                                          PRIMARY KEY (`ID`),
                                          UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
                                          KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
                                          CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_POLICY` VALUES ('79d4a3f6-7695-4882-96ac-9ee675b3e8c1','Default Policy','A policy that grants access only for users within this realm','js','0','0','b0aa1970-e558-4014-8f56-9086d2a6cebd',NULL),('ff0a0e08-266e-488f-beb5-2fe04275188e','Default Permission','A permission that applies to the default resource type','resource','1','0','b0aa1970-e558-4014-8f56-9086d2a6cebd',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
                                            `ID` varchar(36) NOT NULL,
                                            `NAME` varchar(255) NOT NULL,
                                            `TYPE` varchar(255) DEFAULT NULL,
                                            `ICON_URI` varchar(255) DEFAULT NULL,
                                            `OWNER` varchar(255) DEFAULT NULL,
                                            `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
                                            `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
                                            `DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
                                            KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
                                            CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
INSERT INTO `RESOURCE_SERVER_RESOURCE` VALUES ('6b47f73e-fa2a-4c41-88db-032d82e15d3c','Default Resource','urn:reference-auth:resources:default',NULL,'b0aa1970-e558-4014-8f56-9086d2a6cebd','b0aa1970-e558-4014-8f56-9086d2a6cebd',_binary '\0',NULL);
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
                                         `ID` varchar(36) NOT NULL,
                                         `NAME` varchar(255) NOT NULL,
                                         `ICON_URI` varchar(255) DEFAULT NULL,
                                         `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
                                         `DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                         PRIMARY KEY (`ID`),
                                         UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
                                         KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
                                         CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
                                 `RESOURCE_ID` varchar(36) NOT NULL,
                                 `VALUE` varchar(255) NOT NULL,
                                 PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
                                 CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
INSERT INTO `RESOURCE_URIS` VALUES ('6b47f73e-fa2a-4c41-88db-032d82e15d3c','/*');
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
                                  `ID` varchar(36) NOT NULL,
                                  `ROLE_ID` varchar(36) NOT NULL,
                                  `NAME` varchar(255) NOT NULL,
                                  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                  PRIMARY KEY (`ID`),
                                  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
                                  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
                                 `CLIENT_ID` varchar(36) NOT NULL,
                                 `ROLE_ID` varchar(36) NOT NULL,
                                 PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
                                 KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
                                 CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('2d328edb-3511-4289-89d3-f77876b8ad24','12f448ef-09b2-48ba-85da-41e8afb21bcd'),('321c27d5-f3c5-407a-9832-006a86070cc2','a2a697e2-447f-410a-9c90-dd24dab996d6');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
                                `SCOPE_ID` varchar(36) NOT NULL,
                                `POLICY_ID` varchar(36) NOT NULL,
                                PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
                                KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
                                CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
                                CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
                                          `REALM_ID` varchar(36) NOT NULL,
                                          `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
                                          `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
                                          `LAST_FAILURE` bigint(20) DEFAULT NULL,
                                          `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
                                          `NUM_FAILURES` int(11) DEFAULT NULL,
                                          PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
                                  `NAME` varchar(255) NOT NULL,
                                  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                                  `USER_ID` varchar(36) NOT NULL,
                                  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
                                  PRIMARY KEY (`ID`),
                                  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
                                  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
                                  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
                                `ID` varchar(36) NOT NULL,
                                `CLIENT_ID` varchar(255) DEFAULT NULL,
                                `USER_ID` varchar(36) NOT NULL,
                                `CREATED_DATE` bigint(20) DEFAULT NULL,
                                `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
                                `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
                                `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`),
                                UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
                                KEY `IDX_USER_CONSENT` (`USER_ID`),
                                CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
                                             `USER_CONSENT_ID` varchar(36) NOT NULL,
                                             `SCOPE_ID` varchar(36) NOT NULL,
                                             PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
                                             KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
                                             CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
                               `ID` varchar(36) NOT NULL,
                               `EMAIL` varchar(255) DEFAULT NULL,
                               `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
                               `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
                               `ENABLED` bit(1) NOT NULL DEFAULT b'0',
                               `FEDERATION_LINK` varchar(255) DEFAULT NULL,
                               `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                               `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                               `REALM_ID` varchar(255) DEFAULT NULL,
                               `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
                               `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
                               `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
                               `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
                               PRIMARY KEY (`ID`),
                               UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
                               UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
                               KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('5c2af765-8558-4a4e-8011-0d224ef681ae',NULL,'66cb9c8e-79f7-4795-b925-97ed0d874a4f',_binary '\0',_binary '',NULL,NULL,NULL,'Development','service-account-reference-auth',1587752663139,'b0aa1970-e558-4014-8f56-9086d2a6cebd',0),('879717fc-aa9b-4ba7-bdc6-97aed0f58f76',NULL,'30e15565-04af-49c0-8bf8-1821a7fbea34',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1640141861316,NULL,0),('eaf0f6d3-6e45-46d4-9c0d-3a2383d352b7','va-lasershark-team@rise8.us','va-lasershark-team@rise8.us',_binary '\0',_binary '',NULL,'laser','shark','Development','lasershark',1640142016660,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
                                          `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
                                          `VALUE` varchar(255) DEFAULT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
                                          CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
                                          `ID` varchar(36) NOT NULL,
                                          `NAME` varchar(255) NOT NULL,
                                          `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
                                          `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
                                          `REALM_ID` varchar(36) NOT NULL,
                                          PRIMARY KEY (`ID`),
                                          KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
                                          KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
                                          CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
                                          CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
                                                 `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
                                                 `VALUE` varchar(255) DEFAULT NULL,
                                                 `NAME` varchar(255) NOT NULL,
                                                 PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
                                                 CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
                                            `ID` varchar(36) NOT NULL,
                                            `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
                                            `DISPLAY_NAME` varchar(255) DEFAULT NULL,
                                            `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
                                            `LAST_SYNC` int(11) DEFAULT NULL,
                                            `PRIORITY` int(11) DEFAULT NULL,
                                            `PROVIDER_NAME` varchar(255) DEFAULT NULL,
                                            `REALM_ID` varchar(36) DEFAULT NULL,
                                            PRIMARY KEY (`ID`),
                                            KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
                                            CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
                                         `GROUP_ID` varchar(36) NOT NULL,
                                         `USER_ID` varchar(36) NOT NULL,
                                         PRIMARY KEY (`GROUP_ID`,`USER_ID`),
                                         KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
                                         CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
                                        `USER_ID` varchar(36) NOT NULL,
                                        `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
                                        PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
                                        KEY `IDX_USER_REQACTIONS` (`USER_ID`),
                                        CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
                                     `ROLE_ID` varchar(255) NOT NULL,
                                     `USER_ID` varchar(36) NOT NULL,
                                     PRIMARY KEY (`ROLE_ID`,`USER_ID`),
                                     KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
                                     CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('2e5d968f-7722-4a13-a0e7-df5a287dd871','5c2af765-8558-4a4e-8011-0d224ef681ae'),('6b0276cf-349d-452e-8fe8-5e500e32d881','5c2af765-8558-4a4e-8011-0d224ef681ae'),('81b9d551-3b5a-4c56-9dee-ee56e72beb3b','5c2af765-8558-4a4e-8011-0d224ef681ae'),('a2a697e2-447f-410a-9c90-dd24dab996d6','5c2af765-8558-4a4e-8011-0d224ef681ae'),('c3170e3a-fb05-42ce-b5b9-1d566d267812','5c2af765-8558-4a4e-8011-0d224ef681ae'),('53ac0af7-d902-4297-bb43-02ca622af443','879717fc-aa9b-4ba7-bdc6-97aed0f58f76'),('573b3b50-f3eb-4b54-9087-6efa53eb1ff7','879717fc-aa9b-4ba7-bdc6-97aed0f58f76'),('cf738219-e0ee-44b0-b350-9392777e4f45','eaf0f6d3-6e45-46d4-9c0d-3a2383d352b7');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
                                `ID` varchar(36) NOT NULL,
                                `AUTH_METHOD` varchar(255) DEFAULT NULL,
                                `IP_ADDRESS` varchar(255) DEFAULT NULL,
                                `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
                                `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
                                `REALM_ID` varchar(255) DEFAULT NULL,
                                `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
                                `STARTED` int(11) DEFAULT NULL,
                                `USER_ID` varchar(255) DEFAULT NULL,
                                `USER_SESSION_STATE` int(11) DEFAULT NULL,
                                `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
                                `BROKER_USER_ID` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
                                     `USER_SESSION` varchar(36) NOT NULL,
                                     `NAME` varchar(255) NOT NULL,
                                     `VALUE` varchar(2048) DEFAULT NULL,
                                     PRIMARY KEY (`USER_SESSION`,`NAME`),
                                     CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
                               `CLIENT_ID` varchar(36) NOT NULL,
                               `VALUE` varchar(255) NOT NULL,
                               PRIMARY KEY (`CLIENT_ID`,`VALUE`),
                               KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
                               CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('596372dd-e55d-4b73-b324-e18847c0d57f','+'),('b0aa1970-e558-4014-8f56-9086d2a6cebd','http://sandbox:8060/'),('dfeb885d-1411-41e3-98c7-f2532b11f386','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-21 21:01:38
