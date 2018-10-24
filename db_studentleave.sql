/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.1.49-community : Database - db_studentleave
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_studentleave` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_studentleave`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('5002',1,'StudentLeaveProcess01.bpmn','5001','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"studentLeaveProcess\" name=\"Student Levae process\" isExecutable=\"true\">\n    <startEvent id=\"startevent1\" name=\"Start\"></startEvent>\n    <userTask id=\"usertask1\" name=\"Â≠¶ÁîüÂ°´ÂÜôËØ∑ÂÅáÂçï\" activiti:candidateGroups=\"xs\"></userTask>\n    <userTask id=\"usertask2\" name=\"Áè≠ÈïøÂÆ°Êâπ\" activiti:candidateGroups=\"bz\" activiti:formKey=\"audit_bz.jsp\"></userTask>\n    <userTask id=\"usertask3\" name=\"Áè≠‰∏ª‰ªªÂÆ°Êâπ\" activiti:candidateGroups=\"bzr\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <userTask id=\"usertask4\" name=\"Á≥ªËæÖÂØºÂëòÂÆ°Êâπ\" activiti:candidateGroups=\"xfdy\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <userTask id=\"usertask5\" name=\"Â≠¶ÁîüÂ§ÑÂÆ°Êâπ\" activiti:candidateGroups=\"xsc\" activiti:formKey=\"audit_ld.jsp\"></userTask>\n    <endEvent id=\"endevent1\" name=\"End\"></endEvent>\n    <exclusiveGateway id=\"exclusivegateway1\" name=\"Exclusive Gateway\" default=\"flow6\"></exclusiveGateway>\n    <sequenceFlow id=\"flow1\" sourceRef=\"startevent1\" targetRef=\"usertask1\"></sequenceFlow>\n    <sequenceFlow id=\"flow2\" sourceRef=\"usertask1\" targetRef=\"usertask2\"></sequenceFlow>\n    <sequenceFlow id=\"flow3\" name=\"ÈÄöËøá\" sourceRef=\"usertask2\" targetRef=\"exclusivegateway1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${msg==\'ÈÄöËøá\'}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow4\" name=\"Â§ß‰∫é3Â§©\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days<3}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow5\" name=\"3Â§©Âà∞7Â§©\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${days>=3 && days<=7}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"flow6\" name=\"Â§ß‰∫é7Â§©\" sourceRef=\"exclusivegateway1\" targetRef=\"usertask5\"></sequenceFlow>\n    <sequenceFlow id=\"flow7\" sourceRef=\"usertask3\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow8\" sourceRef=\"usertask4\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow9\" sourceRef=\"usertask5\" targetRef=\"endevent1\"></sequenceFlow>\n    <sequenceFlow id=\"flow10\" name=\"Êú™ÈÄöËøá\" sourceRef=\"usertask2\" targetRef=\"endevent1\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${msg==\'Êú™ÈÄöËøá\'}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_studentLeaveProcess\">\n    <bpmndi:BPMNPlane bpmnElement=\"studentLeaveProcess\" id=\"BPMNPlane_studentLeaveProcess\">\n      <bpmndi:BPMNShape bpmnElement=\"startevent1\" id=\"BPMNShape_startevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"60.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask1\" id=\"BPMNShape_usertask1\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"140.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask2\" id=\"BPMNShape_usertask2\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"300.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask3\" id=\"BPMNShape_usertask3\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"40.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask4\" id=\"BPMNShape_usertask4\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"110.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"usertask5\" id=\"BPMNShape_usertask5\">\n        <omgdc:Bounds height=\"55.0\" width=\"105.0\" x=\"630.0\" y=\"180.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"endevent1\" id=\"BPMNShape_endevent1\">\n        <omgdc:Bounds height=\"35.0\" width=\"35.0\" x=\"810.0\" y=\"120.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"exclusivegateway1\" id=\"BPMNShape_exclusivegateway1\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"480.0\" y=\"117.0\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\n        <omgdi:waypoint x=\"95.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"140.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\n        <omgdi:waypoint x=\"245.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"300.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow3\" id=\"BPMNEdge_flow3\">\n        <omgdi:waypoint x=\"405.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"480.0\" y=\"137.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"24.0\" x=\"420.0\" y=\"120.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow4\" id=\"BPMNEdge_flow4\">\n        <omgdi:waypoint x=\"500.0\" y=\"117.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"500.0\" y=\"67.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"67.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"42.0\" x=\"531.0\" y=\"51.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow5\" id=\"BPMNEdge_flow5\">\n        <omgdi:waypoint x=\"520.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"137.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"48.0\" x=\"530.0\" y=\"120.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow6\" id=\"BPMNEdge_flow6\">\n        <omgdi:waypoint x=\"500.0\" y=\"157.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"500.0\" y=\"207.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"630.0\" y=\"207.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"100.0\" x=\"531.0\" y=\"187.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow7\" id=\"BPMNEdge_flow7\">\n        <omgdi:waypoint x=\"682.0\" y=\"95.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"120.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow8\" id=\"BPMNEdge_flow8\">\n        <omgdi:waypoint x=\"735.0\" y=\"137.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"810.0\" y=\"137.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow9\" id=\"BPMNEdge_flow9\">\n        <omgdi:waypoint x=\"682.0\" y=\"180.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"155.0\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"flow10\" id=\"BPMNEdge_flow10\">\n        <omgdi:waypoint x=\"352.0\" y=\"165.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"352.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"600.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"280.0\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"827.0\" y=\"155.0\"></omgdi:waypoint>\n        <bpmndi:BPMNLabel>\n          <omgdc:Bounds height=\"14.0\" width=\"36.0\" x=\"360.0\" y=\"200.0\"></omgdc:Bounds>\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0);
insert  into `act_ge_bytearray`(`ID_`,`REV_`,`NAME_`,`DEPLOYMENT_ID_`,`BYTES_`,`GENERATED_`) values ('5003',1,'StudentLeaveProcess01.png','5001','âPNG\r\n\Z\n\0\0\0\rIHDR\0\0û\0\02\0\0\0¨ò\0\02xIDATxúÌ›l˜}ˇq6Y2k`mÎuRv˚√ƒ≤÷¬R¿^˛Xòã8¨k,H‘¸·‚xhó\ZC–\n\rk<aXS•ﬂ,p∑‘%6d„P( –¥Qõ∏UW€’l«ñ„8aªñ„8U‚8°gŸ¶%J˙|?‚ŸóÀ?«œÒ◊ÁÓ¯|‡Å\"è«ªœè∑_§)2!\0\0\0ÄXHò>\0\0\0\0†=à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0@óT*ïB°0<<úNßì…d¢W…só=êÕfÛ˘|π\\6=,à¢-\0\0›099)#ùÃµO?˝Ù;v=vl±ZÌÕ&œ]ˆ¿ƒƒƒ∆çeü»ÄkzpD[\0\0:´\\.Árπ°°°ìoû\\¨.“úÌÙªße¿ïù377gz†D[\0\0:HÊ⁄¡¡¡ooj±∫@SµgøˇÏ˙ıÎgggM\"èh\0@ÂrπZÆΩDÛo/Ïx˛∂€˛ÿÙp!Úà∂\0\0t ‰‰‰––’•\nMß}Â´m›˙5”ÉÜh#⁄\0–ïJ%ôLæyj∂∫të¶”Êœøøn›ßK•íÈ°CÑm\0Ëà|>üÀÂ™KÏv{Ê≥öèÂºWOµ≠[ˇaddƒÙ–!¬à∂\0\0tD6õùxÊø?»µw˝RàÀ‚ı™xeA\\˚Êó∆ü˘ÒèNù›≥(˛∑\"ˆTƒŒ‚˘K‚õ;m⁄¸ÄÒîi§Ω∏zpp–Ù–!¬à∂\0\0tD*ï:|¯@uÈº’âƒºÁWƒŸ%Òﬁ¢∏ ƒﬂ¸Ì#â´>∫·éÏ©™8π N^≥qtI|˜Ák/‹ûÔ¡6˛L__üÈ°CÑm\0Ëà˛˛˛wœú™.Õ[M¶’Àbayı¶•ï’üﬂ˚¡˚˜˛‡Ô˝˙íÁñƒŸ™xØ* B<ø˜•Z¥ùÔÕ&œ›Ï¿!“ò=\0Äñ®ÇàœIª|Ñ¶‘‚È9ª…_œ/â3≈‚ÚÂ\r ÂÚ7û¯÷◊˛˘âìo≠~[AuE,÷\"ÔÓ∫Ó€S≠wf:ÅŸ\0hâN—+q\nƒµx˙v[ç∂À‚ÙÒˆº®\n±∏∞êZª6ë∏:ëËªÎÛùw‹∑ˇÄÎæ=’¢8÷f\0†%≠D€Á6]é≠õûkrœaVãßgÌfΩ!·ÃEÒ÷9ÒŒ%±Ô/nºÒ∆´Â⁄Î÷|l¯ﬁE€Ω/Ów›∑ßZ‘«f1{\0\0-i>⁄ `{9“~p)Ëû√¨OÀvìø^\\ÔUV_µ=}IÏÿ[˙‘∫[>ˆ[7¨Èˇıo˝˚w/	1ø .,¨ﬁqÁÙ^◊}{™E}‹a≥\0L√œd≠{ﬂ]∆6⁄.-Ωo7Îtd∫=[Ô/ä∑ŒUwö]˜áüπ˝OˇÏùÒvEºSgÑ∑;˜Ïu›∑ßZ‘«f1{\0\0-QeYÕ¯{ÙÒ[Ì7$4ö√ÃO”∑ﬂˆ“´ØÔ;Töû)Ì⁄_⁄u‡»Óóé˝dœ+??t¸ˆ˘Ÿ˛◊vxm˙‡ëCØøÒ‰ønø˚ûªçGL¢-¢àŸ\0hûïB\ZfëÜ‘}Ÿ6Íßmﬂs∂/~ÒÅÜÒ]˙ÀªÓr›±ßZ‘«f1{\0\0ÕkW¥=˙¯≠∑>~¥â=áY-⁄û°mët«Ï\04…A¸„H˝[/’z_µçI¥]~ó¥Ez–a≥\0–§V£≠„√øÍæd´≥Á0´E€”¥†-∫#é0`ˆ\0\0ö·Õ>â$PX	¥Á0´E€whA[Dá!¡Ï\0„Ûaﬁõ}∏A†=á_-⁄æM⁄\"7–f\0\0Õ+\n≥≥≥uo™E€9Z–F¥E+ò=\0\04È»ë#÷À…◊_˝ƒƒÑÎV¢-—›«Ï\0†IïJÂ™´Æ≤“Ì5◊\\sÛÕ7;_¡≠E€_∂±5‹aÎ4‹“æﬁ{°çßinHyÃ\0\0ö700‡¸∂ÖÎÆªÓæ˚ÓìëW‘¢ÌÚÚ[≠4{∑ˆØŒ+ÎÓﬂˇA]∑∫vÓœµÔÖv5¢-Z¡ÏÄﬁ\"S◊‘‘‘ËËh˙äd2Ÿ0÷†9ÀÀßZlŒùÿóõ€≥ÛÓﬁ√Ûﬂß˜°}.¥~ ¶W	\"åŸ\0ΩB&⁄l6€◊◊\'„¨å∂SW®˛\n\n:÷¨Yc\'≈lçÏﬁR©$.øj˚fãÕ⁄âÛßÛÇ˝´:[ªw•˙µÓ„zØ¥wÎ=ò∂úØµ”£äcˆ\0@¸ÕÕÕY/–ãE”«+ÂrŸäz©TÍ˛˚Ôó?ÖÇ}k-Íùl±Y;q˛t^Pm_˜z◊Mﬁ-}#≤˚^Æ[€r≤ˆû\ré)¢éŸ\01799)#◊‘‘îÈâ°\'NÙııe2ôd2922\"ìÆÛ÷Z⁄{£ïˆ·¯¯ÜΩCü=◊Ω…uw’ñŒk\Z^v^h˝L]áaj@Ã\0à≥b±òNß]ëm${8üœ◊}SG[ü3ï⁄?ùyW\'⁄∫vUÔEYwíÆªÅ3»Í‰l¢-∫èŸ\0±%Û÷‡‡ π÷îZÊ;—bª%/_v]pn£à§⁄ÃÁW◊5u/ÎL[NŸÙ–!¬ò=\0[6lòûû6}Ωk5Û≠Ã∂ÿú;±/˚ÏYˇ&Ôñ~Y}m9M◊aò:D≥\0‚©X,f≥Y”G—”jôÔxãÌJ≤<Ó‹õœûıoÚn©zà∫óÌ£r]”ñS6=tà0f\0ƒS&ìôúú4}=≠ı~—Jª/_v^ÔsÕõ¸Ou´Ûx¨Àuè∞≈≥6=tà0f\0ƒ–‹‹‹¿¿ÄÈ£Ëuµ®w¨-ÕﬁïÁ}ÓkÍΩó†ÒN|—u•s\'ÆÎ€uæD[¥ÇŸ\01ƒª¬†ıé“Ç6¢-Z¡ÏÄ⁄≤eÀ¯¯∏È£Ëuµh˚:-h#⁄¢Ã\0à°t:Õw4G¥%⁄¢˚ò=\0C|ÏW»à∂≤rÑ¥m—\nf\0ƒP2ô¨˚˝XË¶Z¥}ç¥m—\nf\0ƒP?_Bf\\-⁄ñhA—≠`ˆ\0@¬†m_•mÃ^¥ÇŸ\01D8Éæææã¨¨ºB‘òΩh≥\0bàp…dÚ¯Ò≠¨¶jÃ^¥ÇŸ\01D8ÉL&Û‹‰∂Ò2MøΩZ˙^*ï2=tà0j\0ƒ—6∆∆∆FFÓ3£’æì4óÀô:Dµ\0bàh≥≥≥©‘\'/Vˆ≠àC4ÕñÕ˛I±X4=tà0j\0ƒ—6$FWm^/—t⁄˛ix8cz–m‘>\0à!¢mHT*ït˙3””ˇ!ƒAöõõ€ëJ}≤\\ﬁiz–m‘>\0à!¢mxîJ•¡¡µ•RQàö™…\\+üLM=ez∏y‘>\0à!¢m®LOOÀt;6ˆ◊B†y[±¯X*ïúö˙7”Ö8†ˆ@m√¶R©åå‰“È[Ú˘øüõ{^à˝¥r˘ßÖ¬?e≥iyŸŸ]π\\n||\\vö©ÒBtQ˚\0 Üà∂·455ïÀ˝≈¿¿o&êHÙ˜_?<|áL∑ﬁéöùù›≤eK2ô$‡\"(j\0ƒPÇhãËõõõ#‡\"(j\0ƒ—±A¿E ‘>\0à!¢-bÜÄM‘>\0à!¢-b…\n∏£££ÂrŸÙ· å®}\0CD[ƒòµ2⁄&ìI.º®}\0CD[ƒuQ˚\0 Üà∂Ë\\∏P˚\0 Üà∂Ë)ŒÄ;77g˙p`µ\0bàhãd‹-[∂p{µ\0bàhãûU©T∆««	∏=ã⁄\01D¥Eè#‡ˆ,j\0ƒ—‹ûDÌÄ\"⁄6;‡nﬁºyvv÷Ù·†≥®}\0CD[¿E‹m€∂…ÄõÀÂ∏1FÌÄ\"⁄*˘|ûÄc‘æHíO=Ö¬p:ùñÎ3—´‰πÀ»f≥≤N≈Èì∫_K\\«∑;D€Pbu[¬∞∫	∏qEÌãû……Iπ\Zee|˙Èß_ÿ±„Ë±cã’jo6yÓ≤&&&6n‹(˚D÷)”É”åoº«∑kD€auápup„á⁄%Ú©≠\\~CCC\'ﬂ<πX]§9€ÈwOÀ);\'∫À¯∆{|ªåh*¨ÓêØn+‡ g333¶éÌBÌãYøΩ˝©≈ÍM’û˝˛≥Î◊Øè‚ìo∆7ﬁ„€}D€`uGeu\n9RŸlñÄi‘æ»êœ¯kïÒÕøΩ∞„˘€n˚c”√„ÔÒÌ>¢mx∞∫£µ∫ã≈\"7“®}—09994tGu©B”i_˘ÍC[∑~ÕÙ†¿¯∆{|ç ⁄Ü´;¢´õÄ]‘æ®T*…dÚÕS≥’•ã4ù6˛˝uÎ>]*ïLù∆7ﬁ„k\n—6X›Q_›‹(¢ˆE@>üœÂr’•vª=ÛYÕXqﬁ´ß⁄÷≠ˇ022bzË¥0æÒ_Sà∂a¿Íé«Í∂n:ùûöö2},hå⁄Ú˘‚ƒ3ˇ˝AeºcËóBúXØW≈+‚‡Çÿ7ø4˛ÃètÍÏûEÒø±ß\"v^œ_ﬂ‹yh”Êå◊)#Ì≈˝”≤ô:-åoº«◊ÎÔÒ˘0`„X›qZ›2◊¶k∏!G¥çÄT*u¯ÅÍ“y´…gÛÛBú_góƒ{ã‚ÇÛ∑è$Æ˙ËÜ;≤ß™‚‰Ç8yIÃVƒ—%Ò›ü¨=ı?ﬂÉm˛¸ôææ>”CßÖÒç˜¯vüL¥∑›v€∑∑oóˇìnÕbu«oup√/∂—∂R©ã≈——Q˘§9}E&ìë◊\nÖhï˚˛˛˛wœú™.Õ[M÷ªÀbayı¶•ï’üﬂ˚¡˚˜˛‡Ô˝˙íÁñƒŸ™xØ*‰>ø˜•ZqúÔÕïˇêe|„=æ]fÂ⁄}/Ó_¨.…ü§[≥X›q]››	∏>I&üœÛ!ﬂ*aü=MêÛ@º|Œ\'ßÇ˛ââg^ÿÒc´=˚˝<¸#√√√≤‹lÿ∞!*_nT+pÁÏ&=ø$Œ\\ãÀó7êˇt}„âo}Ìüü8˘÷ÍDØÆà≈Z—‹˝‚A◊}{™Öø8ZﬂÆçØ}Ô˚\ZÎn¶∫{h9s≠’\"în√ﬂΩM`uwmua‹………ˆÓY&ôa\Zæ!{ppp€∂m2∑˜—£.\Z≥G”ÃÃåıù‘2¬⁄ï]’vÓ⁄Ωq„‰¥ˇˇ)‘\n‹ˇŸmµ8.ã”ƒ€Û¢*ƒ‚¬BjÌ⁄D‚ÍD¢ÔÆœotﬁqﬂ˛Æ˚ˆTãJqd|ª9æŒ{9ìÆœf˛WÜá7◊v9›˙¸Ï≥ÅÛÓMÔ9¥X››\\›¶»ë…ddúêy¥-{€∞aC√PÎîL&€Ú–±•Ÿ„ollLN¨v¸∏a®u}˘è¡ÊÕõ√¸§ßV‡Œ⁄-Q˚/-˘ºˇ≠s‚ùKbﬂ·_‹x„çWˇ µ◊≠˘ÿΩ*é{_‹Ô∫oOµ®G∆◊‡¯äGaûQ™\\€πt˚‹¶Àˇ¨nzÆŒ≠˛9µÓ5÷œ£èﬂÍ¸7˚÷«èÍÔ9ÑX›WwóÕÃÃd≥YüÄªn›∫[oΩ’g íÀÂ\\±UÓ+_˘™Ûˇüe{¯·GÜÜÜ\\[ GèƒˇœtAÙfèóú\r√√√###ÅB≠≥˝ÀìO ∫⁄∑≠‘\n\\ŸnÚ◊ã+‚Ω ÍÛ˛”óƒéΩ•O≠ªÂcøu√ö˛_ˇ÷ø˜íÛ‚¬¬ÍwNÔu›∑ßZTä#„€˝Ò≠˚ G”õÁük;íne∞Ωi?∏‰§Í®Ñ˙Us˜]VCnÄ=á´ª˚´€,U¿ïKœ* ü˛ÙßÎ.Cô@\\/÷>¯‡óè;Ê≥®Oø{F¶óÅÅ˚.…díœﬂ1à∂2◊ ŸP(öŒµˆ˚‰~¬˘›Ùræ.-Ωo7kÕÀ˙x∂*ﬁ_îœ˛´ªÕÆ˚√œ‹˛ßˆŒÇxª\"ﬁ©à3Bñ«ù{ˆ∫Ó€S-*≈ëÒÌ⁄¯⁄Ÿ‘™\\|ínsC‹Q:π∂ìÔLmUOÍF€˙˚\rÎ(®∞∫ª∂∫C≈pøÒçoX˛Ün¯“óæ‰⁄^fôJÌEë…d¸C≠+‡>¸#ˆ}˚˙˙¶ßßª~∆·ÌŸ#\r∑ûkÌ∫/”mﬂô‡*pÈ€o{È’◊˜*MœîvÌ/Ì:pd˜K«~≤Áïü:˛?˚è¸lˇkªº6}»°◊ﬂxÚ_∑ﬂ}œ›∆ã≈—„€ÕÒµSîˇÀ±ﬁ»+B™Ùsm\'“≠ıÊ+Ä÷ÌRÕÓ≠mÂÆØº!–û√Ü’›Õ’6v¿ÕÁÛø˚ªøkœÿè¸„Œ◊V≠WËÏ[›∫µâ\0ÛÙ”ˇ)C≠µôíC˚ø–›ÌŸ366÷ ˚ºmb‚9Müñ[≠8æÁl_¸‚\rÀΩÙów›Â∫cOµ®G∆∑õ„õhÙ™≠˜W’6∆ÕµzÌ∂ÓÀ´˛}U∑∑ùW }zﬂe´≥Á∞auwsuáìL±©T 9∏◊^{Ì-∑‹bo0<<lﬂ$CH+/œı˜˜[˚ëk‹‡)·Ÿ#ßã|2‘∆\\kµMõÿ∂mõÈì˚êZq<C⁄¢Rﬂnéo\"‡´∂\"¨—∂π\\€°◊n]1‘UÌÎÎvªg{’õî{-Vw7Ww8=Ù–Cﬁi”M7Y?Z,Ì+õ{Ω÷Ÿû˝˛ÏΩçèèõ>uc\"<{dÆmÆ¨˚∑ìoû˙ƒ\'í°z[¬jq\\~ó¥E•82æ›ﬂDWm˝Ø4¬õkÂ?ik◊¶TÔœ;˝ÓôuÎ÷}{˚ˆ∂•[G¯ÙÊ–Ü¥nop•7,kÔ9lX››\\›·422R˜I]*ïµ$c˝ö…d⁄íaÏ˜›Ñ*…tSTgèıi∆mœµV{¡/áÍÈN≠8û¶mQ)éåo7«∑n¥ı’V8^nlrå€™nÆµﬁf\'üñ{”≠ïk≠„oc∫µ?¸´ÓK∂ﬁÀ™mÍ\\©x—Vgœa√ÍÓÊÍéäŸŸŸ\\.óL&7oﬁl-\"π~Oæy™-Ê‹¸y˚3∂lŸb˙\\ÕàÍÏë9ËGÿz·VŒ”ß¯ÅZq|á¥E•82æ›_ù{Ö˘•Aü\\kq•[gÆm{∫ıÚvö*≈zü-¯w∏Êû√Ü’›Õ’9rıY´‡¡ø‹∆#◊∏µ€˛˛~”ßhF$gè,ƒr¿:îk≠∂~˝˙||F≠8æM⁄¢RﬂÆçØÛ5⁄∫ÑÁ•¡∫€ò‚ÕµŒWhºÈ÷õkû◊á⁄ïn}:«Ÿ∑™ÕtÓË¶ê`uwmuGé˝I∑Rª^≤µõ,÷û√ˇ}´ù…ŸìœÁsπ\\G£Ì£[∑éååtÛ§\nÖÇÍSuk≈qé¥Ö™82æÒﬂ˘Lõœ˜Ë⁄ÌL∑˚®õkΩﬂCﬁµo‚ç+V7´[≈gn»$c≠Jπ˙⁄ûa6m∫¸A]N2!…Ÿ≥yÛÊm€∂u4⁄æ∞„«›¸Ïå#GéX≥˙ÎØüòòp›Jqåzqd|„=æ-ÚüñÜﬂ£ÎM∑◊^{≠NÆ%›∂à’ÕÍVÒüˆm[ˇ`Ñ∫∆⁄˘Ü\råúªYëú=ôLFU†€’é;ˆâO$ªvFïJÂ™´Æ≤&‚5◊\\sÛÕ7;üÁ’ä„/}öΩÅkK’5Ø˜nñhDuØ@á—\ZﬁÀﬁ≤k#ËØ≈ÒmΩ˘?D†.ıø^5;tRÊÜ¥ù¸ßá–˛]o∫’Ãµ§€Vtzuª\n¨j}yÀØ°ˆﬂÃxà«Íˆü2…X7u\"œ»cÌ<ôÏ^í	èHŒû}Ïó≥ùõ?/ˇ%ËÊIπﬁ0w›u◊›wﬂ}÷\'w»_óóﬂÚoˆ6ﬁ>€‘›@U\rùËÉœ~ÏÕ\\;˜n„z8ùÆpn‹ÕÙ◊‚¯mÆû‘Ôa{3Ô˘å¶œÖŒµPçoã|¶G†Ô—U•€Üπñt€äˆÆÓ∫KÃªçÍöÜk–˘/{JÆë\nõ’Ì37Ïè˝ÍPû±‘t…sñs•ÌÔπÆ;-Ïø^4ny˘î™Èﬂ◊æ¨⁄°ÎzÕÕ\Z∂∫€[W:÷=Œ&:ƒπüå†ø@˝ŸD∑\'|á>Ò·◊kÔn}.t‚£2æ≠êπVˇ”`~2ı”´Øæ⁄µáè|‰#€∑Gs÷{±z°cª¶-KÿuΩΩgüG‘<$ˇ\r¸è?—±\nêËÅ’mß^’«Q∑ÿÏ˝õélDÚúS©‘Àáw!⁄vÛ§÷¨Ycœ¯lç\\ÿ•RI\\~ﬁˇ¶™Èﬂ™Z`Æ[ÎnÈ⁄ßœ~¸∑tòÛß˜òΩ€Îú≤s≥né†ø¶«∑ÈV∑á˝áIsü>w˜>PáŒ.l„€\"üÈ133#”ÌÈwœ4,Yu?¡R˜ÛnÎÓA>ÆÛ€Ì°£´[UUÀJÁövUï.TÄÿ¨nüπa˚náÚå˝ôÄ¶˚¿ÄHûsG?‘÷j]~Ø≠˝! rÆﬂˇ˝Úg°P∞o≠ïÜì˛≠ÓøgÆ\rÍ^Æªçœ}}ÓÓ<ˇÌÌmúáÍ=Ú∫\'Â›øœëtm˝µ>æM4ªW}FV@˝G°Óê5‹sÎ\'hpL€»zΩtÎìk-\r”-π∂9ùX›˛œµ¥U˚<t›Î≥∫u∂ioHƒbu˚œ\r˚eÈN‰πú≠ù˜ÊG€Frˆ‰r9Áßéw¢Ì‹µ{˝˙ı];£\'N»\'XôL&ôLéåå∏ﬁÎV´ojÆª¯ˇÍΩæ^	kp_Ô~‘’C€hûE–c∞6Î⁄˙k˚¯Íúª≥√]›Æ\Zeüë“ºÏöBm?Øpéoã¸ßá≈?›÷Õµ˘»G\\◊¯§[rm”:∫∫ÎÆ#Á¢ÆªÙt÷∏-\r¥Í;Q‚±∫˝ÁÜL2V/˝ÀìO∂=√º|¯∞µÛ¡¡ASßoP$gœ¯¯x{ø∫√€dtﬁ∏Ò›<©b±òœÁÎ~\0^–—p˚ÜÂÃµA†Z©øÁﬁ\\{÷¨®«6éo†i‡˙Y∑˝ˇù”qÁÈL¬∂ú`◊á±S|¶áMïnUﬂÀÕˇ˜D›œª≠˚Mº‰⁄Vtbu˚ØSA´D√À›Ø\0±Y›>scllÃÍ76⁄ûa›∫’⁄˘p◊O⁄ºHŒ9K‰s†éF€°°°……I”\'zY≠FúP5ç2Á∑•kW™-}¿u_Õ˝XóU˜ÚﬂøfãJql‚‘4Oﬂ€•˛}€∞Á}FYgWm?A”C◊mﬁt´ µ÷Á!®æÕ¡ıMº‰⁄ŒiÆp˘p-¿†K/°®˘≠\\ÓDËÖ’]*ï¨ÆìãÙ‹¸˘ˆfY(¨ùÀ`m˙D\ràÍÏÈË_í…I&ßöıÒa∞Z#Vf5õŒ∆™m.W(œA˜i_ˆŸè˝@ﬁu›§,Ò\ZádzË¥\ZﬂÊfÇjD|∂tÕ\nˇ!ÓøC\'≈Òm/o∫›∏ÒŒAq}Œó7› ÁÌˆø£‰⁄Nkq!¯óPüÖ©Y?Uk_ˇÅ:Tzdu\'ìI´\'\'&ûicÜ±?‘VÍÕœÚãÍÏÈË{æ˛ÿcrÁ¶OÒµ\Zq\\≥Èl\\wõ+•Í∏∫ä5∏…ªˇ∫[:∑qâkõ†ÁÂΩãÈ°”“ƒ©iûæœ–x˚÷9j™ûoxŸ9Oö∏òço€˘§[’˜Ë⁄Èñ\\€eÕÕÔÚq-7ÔÍVm©⁄≥™¯ﬂ•k†GV˜üˇ˘ü[}µn›∫6æp˚π;Ô¥võÕfMü¢Qù=ïJE>›Èƒß€ ÈıâO$ÁÊÊLü‚j•·öMg„@€h>∫s≥+uÕ}_◊6\rØ	zÃﬁªò:-MúöŒπ◊¡∫èÂ‹Xuçˇ(8À5éù8ªhço\'‘M∑˛ﬂ£+”-π∂˚ö+\\\r//{\n¶j≈˘ˇ\Zh˘w≥ƒiu?Ù–CøÒøë¯’_˝’{ÔΩ◊˛ÙŸv}›ÓŒ]ªÌáËŸ·ŸS(ÓæÁûÿød+.«c\rõ=õ}nRÒnÔÛk√µu^Ô⁄Ã∫¨⁄≤ÓÈtÇÎ.¶áNKß®ÍŒÅÊ˙÷gv©FºsgïÒÌo∫ıˇN£ó&◊v_–˘ÔS3Ω∑zó§œäÛÆGˇÂ©_á;Q‚¥∫ˇËè˛»˚on*ï˙´ø˙+Q˚/hÎ\Z˘‘¥ıO;zÏòùï7oﬁl˙‘çâˆÏ˘‹ùw∂˜*≤˙[ˇ/`˙Ã>§V\Zé“Ç∂®G∆7ﬁ„€9˙ﬂÊ‡l‰⁄nbu≥∫gggù_‹ }ˆ≥üM&ìˆﬂÛlÿ∞¡∫^¶“VæôLF˚èJÂÆBıüœ]ÌŸS.ó◊Ø_ﬂÆø\'≥˛÷XN,”ßÂV+éØ”Ç∂®G∆7ﬁ„€QA”-π∂ÀX›¨na7m⁄dŒt&ì)ãˆ2˚⁄ÔÜóë‘ˇø_TÌ‰õßÏ\\€◊◊755eÓåÕã¸Ï)ïJ2›∂˛Ã≤‚ÓŒ;ü˝˛LüP«xG∆7ﬁ„€iÅæâó\\€e¨Ó^^›2‘éèè\'ì…\\.gø-·Åê—÷µ•L¢ˆk∫2ò˝áùªv€ÔCê‰É\Z9ﬂà√ÏëïZ>YëC€tÆ}˘aôè√ôkE≠8Æ¨°mQ)éåoº«∑4øâó\\€}¨Óﬁ\\›v®›≤eãı∆ÄB° OÍﬁ{Ô›∞aC©TÚﬁ•X,:?ßO¶\Z’_Ö∫^¨Ω˚û{úÔv ◊äxD[Q{gÇ¨Ï?¸H–∑ùùõ?ˇı«≥ﬁ’`˙$îj≈Ò5Z–ï‚»¯∆{|ª£·7Òíkç`u˜⁄ÍˆÜZ˚˙_˚µ_K•R>ÀPF^πÅ3ß Ä+Éç˜]ó2—˛ÀìO\r\r97ñ…∏«ﬂá`ãÍÏÒíÛFŒÄµkS2™j~>‹∑∑oó€?¯‡óe›7}¯~j≈±D⁄¢Rﬂxèo◊¯|/π÷VwÔ¨nU®µ…‹ŸOª ÂÚËËh___¢ûıÎ◊´n\ZÓÂøsâﬁÏÒ\'áVŒ*˘‹Âswﬁ)ì´˜ÌÿÚößü˛œªÔπGn≥q„¸ø¥=$j≈ÒUZ–ï‚»¯∆{|ª©Ó7Òík\rbu˜¬ÍñytllÃ\'‘%wíÀÂÍFX/π¿ßßß[–8â“Ï—\'ü<ãE93ºﬂÆ.Øëπ∂P(DË€Á‰≥¥ã¨¨ºB‘¢Rﬂxèoó9”-π÷8VwºW∑ı\"´µ###m—T&ôUdít%˘àŸlv€∂mºR[W4fOèìì¯¯Ò≠¨¶jQ)éåoº«∑˚¨t{Ùÿ1r≠q¨Ó∏Æn;‘ ü]{•L∆‹Ó<P‘Ö}ˆ@ d2œMn[/”Ù€´•Ô•R)”CßÖÒç˜¯\Z!≠¸Gó\\k´;~´€H®ïˆÏŸ#Ñ˛√Ÿ ¢måçççå‹gº‹D´}\'ˇhTû‡2æÒ_SËü0`u«iuõ\nµñõn∫IF€/}ÈK]~‹(\"⁄F¿ÏÏl*ı…ãï}+‚M≥e≥‚¸∫ó0c|„=æ¶Ñˇøt{´;´€˙uS°Vz¸Ò«≠wŸ~¸„Ác\Z¢ˆE√Ë™Õ+‚%öN˚Ø¬?\rªøÓ%ÃﬂxèØD€ê`uGzu€°v||‹‘õ‰„⁄ü˘uÌµ◊ﬁrÀ-F#B®}—P©T“ÈœLOˇái˛mnnG*ı…ryßÈAÄÒç˜¯\ZA¥\r	VwDW∑3‘ A4x$Ÿl÷˘Ò7›tS>ü7x<·GÌãåR©48∏∂T*\n1CS5YÂø\"SSOôÆ¿ﬂxèo˜m√É’≠’ûP+j/Ÿz?Àˆw~ÁwåXòQ˚¢dzzZ÷«±±ø‚\0Õ€ä≈«R©‰‘‘øô®&1æÒﬂ.#⁄Ü\n´;´;T°÷Ú‘SOYqˆSü˙îmˇ˜üÔ‘ıAÌãπÿFFrÈÙ-˘¸ﬂœÕ=/ƒ~Zπ¸”B·ááá≤Ÿ¥ºlzàZ¬¯∆{|ªâh6¨Ó0ØÓŸŸŸ\\.700ûPk˘Ÿœ~ˆ—è~T¶Ì˛˛~π®jn∏·¢≠j_$…9ùÀ˝≈¿¿oj~_ºı˜_?<|á¨è¶á•m_ß¯çow$à∂°ƒÍv\n√Í∂B≠Ãé°}ÎÃÃå<HqeQÀÀ|HÇ?j\0•p~∫$t$à∂ÄØáZµ&∫	Äï4∫;@%r°÷¬¢÷D7P¢íFcxïJ•(ÜZãZ›@âJ\Z]å‡433ìÕfS©TC≠ÖE≠ân†D%ç.∆∞X°vpp0lﬂﬂãZ›@âJ\Z]åõPkaQk¢õ\0(QI£ã±C/ãY®µ∞®5—M\0î®§—≈ÿ°7MMM≈/‘ZX‘öË&\0JT“ËbÏ–kd®M◊ƒ/‘ZX‘öË&\0JT“ËbÏ–;ÏPÔØüeQk¢õ\0(QI£ã±C/ËëPkaQk¢õ\0(QI£ã±CºıT®µ∞®5—M\0î®§—≈ÿ!Æä≈‚Ü\rz*‘ZX‘öË&\0JT“ËbÏ?2‘f≥ŸÈÈi”«b\0ãZ›@âJ\Z]å‚ƒµ333¶è≈µ&∫	Äï4∫ªp™T*ÖBaxx8ùN\'ì…DØíÁ.{@F’|>_.ó}zåPkK∞®ı–M\0î®§—≈ÿÖ–‰‰§åt2◊>˝Ù”/ÏÿqÙÿ±≈jµ7õ<wŸ7nî}\"Æ∑ªµ.,jMt\0%*it1v°R.ósπ‹–––…7O.ViŒv˙›”2‡ Œôõõ3=P°∆¢÷D7P¢íFc2◊~{˚Sã’ö™=˚˝g◊Ø_?;;kz∏¬ãE≠ân†D%ç.∆.<rπ\\-◊^¢˘∑v<€mlz∏¬ãE≠ân†D%ç.∆.$&\'\'áÜÓ®.Uh:Ì+_}hÎ÷Øô¥êbQk¢õ\0(QI£ã±ÉJ•íL&ﬂ<5[]∫H”iÛÁﬂ_∑Ó”•R…Ù–ÖãZ›@âJ\Z]å]‰Û˘\\.W]∫`∑€3ü’¸x,ÁΩz™m›˙###¶á.åX‘öË&\0JT“ËbÏ¬ õÕN<Ûﬂ‰⁄;Ü~)ƒâeÒzUº≤ .à}ÛK„œ¸¯GßŒÓYˇ[{*bÁÒ¸%ÒÕùá6m~¿x 4“^‹?=88hzË¬àE≠ân†D%çÆnéùÍ±|^íÏ⁄±ôïJ•>P]:o5y‚ÛBú_góƒ{ã‚ÇÛ∑è$Æ˙ËÜ;≤ß™‚‰Ç8yIÃVƒ—%Ò›ü¨Ωp{æ€¸˘3}}}¶á.åzg·¥àn†D%çÆ0D€†€ÿ[∆&˜˜˜ø{ÊTuiﬁjÚ.,ãÖÂ’õñVV~Ô?¸Ìﬂ˚Éø{ÙÎKBú[g´‚Ω™(Ò¸ﬁój—væ7[«∫ËMt\0%*itE\"⁄}¸VgrΩıÒ£MÏ9ÃjÒÙú›‰ØÁóƒôãbq˘ÚÂr˘O|Îkˇ¸ƒ…∑Vø≠†∫\"këw˜ã]˜Ì©ıqÔ∫E›@âJ\Z]}}}ïJ•;è’ÜWmWCÓ¶Áö⁄sò’‚ÈˇŸm5⁄.ã”ƒ€Û¢*ƒ‚¬BjÌ⁄D‚ÍD¢ÔÆœotﬁqﬂ˛Æ˚ˆTã˙∏w›¢ân†D%çÆd2Ÿπ/vjÙ«˝u¶çˇ\\znSΩ`˝XãßgÌfΩ!·ÃEÒ÷9ÒŒ%±Ô/nºÒ∆´Â⁄Î÷|l¯ﬁE€Ω/Ów›∑ßZ‘«ΩCËMt\0%*it\rŒÃÃtÁ±TYV7˛}¸÷+ÔEh\"4áY-ûñÌ&Ω∏\"ﬁ´¨æj{˙íÿ±∑Ù©u∑|Ï∑nX”ˇÎﬂ˙˜Ô^b~A\\XXΩ„ŒÈΩÆ˚ˆTã‹@w›¢ân†D%çÆt:=55’Ö≤&I√©‚≥¡sõÍºÀ∂·Ω\"Aˇ““˚v≥NG¶€≥UÒ˛¢xÎ\\u˜°Ÿu¯ô€ˇÙœﬁYoWƒ;qfA»pªsœ^◊}{™E}‹;Ñn—D7P¢íFW.óÀÁÛ]x†ñ£≠ÍÕ∫{3W<Mﬂ~€KØææÔPiz¶¥ki◊Å#ª_:ˆì=Ø¸¸–ÒˇŸ‰g˚_€u‡µÈÉGΩ˛∆ìˇ∫˝Ó{Ó61â∂°B∑h¢õ\0(QI£À˙¨N?äsÜ¯œÂ≠éw#‘ΩK§\'a-⁄æÁl_¸‚\rﬂt!˝Â]wπÓÿS-“Éﬁ9tã&∫	Äï4∫J•R*ïÍÙ£¥!⁄*^¥’ﬂsò’¢ÌZ–›Ô(∫E›@âJ\Ziù˛K2ÔÙô0ÅÊR†=áŸj¥]~ó¥Et∏;çn—D7P¢íF⁄¯¯¯ñ-[:±gü+ﬁË√\rÌ9¸j—ˆ4-hã‹@w›¢ân†D%ç¥J•íL&ÁÊÊLHÔ™E€whAïß.∫E›@Iˇï6ü+Ω\"£ÛÒ∂òööJß”¶è¢w’¢Ì€¥†çÂ_›¢ân†‘J¥u]ÔL∫:wßà∑ÀËËháﬁñ\0K°PP}Ò[-⁄Œ—Ç6ñ]tã&∫	Äíˇ_©¯ﬂ•ıáFP###ôL¶\\.õ>ê:r‰à5±Øø˛˙ââ	◊≠D[¢m—-öË&\0J-æjkﬂ™•d599ôL&GGGyÎm{U*ï´Æ∫ öÆ◊\\sÕÕ7ﬂÏ|∑mŸb≥w‚⁄õjÁ>™πÕ˝´¨-ßlnH√ãn—D7Pj%⁄⁄Ÿ‘˚VÑÑÁm∏M?4ÙïÀeme¿Õd2ÚBwæÜ∑8üè]w›u˜›wüåº¢6çóóﬂjΩŸ˚Ò^Ÿ∆g?™_˝ÈLÎÁkzT√àn—D7PRU“Üˇ:ÔÓ≥ÅÎQú◊Sƒ;DFÆ……Im”Èt√qDÎñóOµ“Ù˜o_ˆyP◊][˙≠wˇ>Z?k”%åËMt\0%ùJjˇK©∫{B˝™≠˜W’6@h≠Y≥∆^Ÿ\Z˘¥°T*âÀØ⁄æŸJÛﬂÉÛVuˆ≠≥Ωu¡ªA√ávÓ÷µ∑ÜGË¨Mèj—-öË&\0J\r+©3ºz7N|’Vm5ÂrŸö“©TÍ˛˚Ôó?ÖÇ}k-ÍùlΩ)2Îá6®{ŸÁOür=ú}ŸukªN÷⁄ï¡1\r-∫E›@…øízch›Ã™πY†áB‚ƒâ}}}ôL&ôLéåå∏>Ü¢ñˆﬁh{sÌ÷ˇ◊∫◊[óÌkºt.;/¥˜LY˛u—-öË&\0J™JÍzÂ’uŸaΩø˙G€∫ØÏ°U,Û˘|›è∂ÌD¥m∏œ∫8≥¨O¢ı}’ˆ\rÁ6™@L¥Ì∫E›@I≥í˙$`Õ˚R≤KµÃw¢ïÊì5ØDLø-Ω{≥:/∏6πÏ‹≠œ~Z?k”CFtã&∫	ÄR+—6·xç∂.QÔÂ^Ô6@t≠fæïŸ66ù˙o„º’ª•_Üˆ‹À{°çßizË¬àn—D7P¢í≠®eæ„ml:;ÙŸ∆∫…ﬁ¿ª•ÛöÜóÌΩ˘Ï∞È”4=taD∑h¢õ\0(QIÅV‘¢ﬁ/⁄ÿtv®⁄∆y}[ˆs%‘~Ëövù¶È°#∫E›@âJ\n¥¢ıéµ•9ﬁ†ºI˝^Çcﬁ;z∑Òn†z,Ô>˚iÓdM]—-öË&\0JTR†µ®wî¥QyÍ¢[4—M\0î®§@+j—ˆuZ–FÂ©ãn—D7P¢í≠ ⁄m€àn—D7P¢í≠ê+heÂ-h£Ú‘E∑h¢õ\0(QIÅV‘¢Ìk¥†ç S›¢ân†D%ZQã∂%Z–FÂ©ãn—D7P¢í≠®E€WiAïß.∫E›@âJ\n¥¢ØØÔ‚≈++Ø–5*O]tã&∫	ÄïhE2ô<~¸G++áiÅ\Zïß.∫E›@âJ\n¥\"ì…<7πmEºL”oØñæóJ•L]Qê5—M\0î®§@+∆∆∆FFÓ3£’æì4óÀô∫0¢ k¢õ\0(QIÅVÃŒŒ¶RüºXŸ∑\"—4[6˚\'≈b—Ù–ÖY›@âJ\n¥ht’ÊÒMß˝W·üÜá3¶-§(»öË&\0JTR†EïJ%ù˛ÃÙÙqêÊﬂÊÊv§Rü,ówö¥ê¢ k¢õ\0(QIÅ÷ïJ•¡¡µ•RQàö™…\\+üLM=ez∏¬ãÇ¨ân†D%⁄bzzZ¶€±±ø‚\0Õ€ä≈«R©‰‘‘øô®P£ k¢õ\0(QIÅv©T*##πt˙ñ|˛ÔÁÊûb?≠\\˛i°è√√CŸlZ^6=DaGA÷D7P¢íÌ555ïÀ˝≈¿¿o&êHÙ˜_?<|áL∑¶á%\Zd=t\0%*)\0ÑY›@âJ\n\0!AA÷D7P¢í@HPê5—M\0î®§\0dMt\0%*)\0ÑY›@âJ\n\0!AA÷D7P¢í@HPê5—M\0î®§\0dMt\0%*)\0ÑY›@âJ\n\0!AA÷D7P¢í@HPê5—M\0î®§\0dMt\0%*)\0ÑY›@âJ\n\0!AA÷D7P¢í@HPê5—M\0î®§\0dMt\0%*)\0ÑY›@âJ\n\0!AA÷D7P¢í@HPê5—M\0î®§\0dMt\0%*)\0ÑY›@âJ\n\0!AA÷D7P¢í@HPê5—M\0î®§\0dMt\0%*)\0ÑY›@âJ\n\0!AA÷D7P¢í@HPê5—M\0î®§\0dMt\0%*)\0ÑY›@âJ\n\0!AA÷D7PÍÎÎ´T*¶è\0@¥’E7PJ&ì≥≥≥¶è\0@¥’E7P\Zúôô1}\0–ÎÊÊÊLE4m(•”È©©)”G\0Ωnvv6ôLö>äh ⁄P Âr˘|ﬁÙQ\0@ØõúúÃd2¶è\"\Zà∂\0îdÆïÈ÷ÙQ\0@Ø≠1}—@¥†T*ïR©îÈ£\0Ä^ó…d&\'\'ME4m¯·/…\0¿¨πππd2…G1j\"⁄3>>æeÀ”G\0Ωã:—ÄüJ•íL&ÁÊÊL\0Ù\"äpPD[\0\rLMM•”i”G\0ΩàO™	äh†±——Q˛;\0∫l|||ÛÊÕ¶è\"bà∂\0¥åååd2ôrπl˙@\0 ˛*ïJ.ó#◊6Åh@◊‰‰d2ôÂ]_\0–!Âry||\\[ﬁá–¢-Ä\0dÕï—V÷‹L&#/5º\0–≤úéççe≥YY`∑lŸ¬+M#⁄¨R©LNN hõNß\0Äñ…r:22R,yﬂWãà∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0à	¢-\0\0\0bÇh\0\0Äò ⁄\0\0 &à∂\0\0\0àâˇ@#ƒJÁx˝Ω\0\0\0\0IENDÆB`Ç',0);

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('next.dbid','22501',10);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.history','create(5.20.0.1)',1);
insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('schema.version','5.20.0.1',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('10002','studentLeaveProcess:1:5004','10001','10001','startevent1',NULL,NULL,'Start','startEvent',NULL,'2016-12-08 10:17:27','2016-12-08 10:17:27',25,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('10004','studentLeaveProcess:1:5004','10001','10001','usertask1','10005',NULL,'Â≠¶ÁîüÂ°´ÂÜôËØ∑ÂÅáÂçï','userTask',NULL,'2016-12-08 10:17:27','2016-12-08 10:17:27',982,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('10007','studentLeaveProcess:1:5004','10001','10001','usertask2','10008',NULL,'Áè≠ÈïøÂÆ°Êâπ','userTask',NULL,'2016-12-08 10:17:27','2016-12-28 16:38:21',1750854975,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('12505','studentLeaveProcess:1:5004','10001','10001','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2016-12-28 16:38:21','2016-12-28 16:38:21',1,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('12506','studentLeaveProcess:1:5004','10001','10001','usertask4','12507',NULL,'Á≥ªËæÖÂØºÂëòÂÆ°Êâπ','userTask',NULL,'2016-12-28 16:38:21','2017-01-05 10:08:22',667801583,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('12513','studentLeaveProcess:1:5004','7501','7501','endevent1',NULL,NULL,'End','endEvent',NULL,'2016-12-28 16:39:04','2016-12-28 16:39:04',1,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('15003','studentLeaveProcess:1:5004','10001','10001','endevent1',NULL,NULL,'End','endEvent',NULL,'2017-01-05 10:08:22','2017-01-05 10:08:22',0,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17502','studentLeaveProcess:1:5004','17501','17501','startevent1',NULL,NULL,'Start','startEvent',NULL,'2017-01-12 22:31:53','2017-01-12 22:31:53',34,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17504','studentLeaveProcess:1:5004','17501','17501','usertask1','17505',NULL,'Â≠¶ÁîüÂ°´ÂÜôËØ∑ÂÅáÂçï','userTask',NULL,'2017-01-12 22:31:53','2017-01-12 22:31:54',1157,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17507','studentLeaveProcess:1:5004','17501','17501','usertask2','17508',NULL,'Áè≠ÈïøÂÆ°Êâπ','userTask',NULL,'2017-01-12 22:31:54','2017-01-12 22:33:40',106801,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17514','studentLeaveProcess:1:5004','17501','17501','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-01-12 22:33:40','2017-01-12 22:33:40',1,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17515','studentLeaveProcess:1:5004','17501','17501','usertask4','17516',NULL,'Á≥ªËæÖÂØºÂëòÂÆ°Êâπ','userTask',NULL,'2017-01-12 22:33:40','2017-01-12 22:35:07',87470,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('17520','studentLeaveProcess:1:5004','17501','17501','endevent1',NULL,NULL,'End','endEvent',NULL,'2017-01-12 22:35:07','2017-01-12 22:35:07',0,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20002','studentLeaveProcess:1:5004','20001','20001','startevent1',NULL,NULL,'Start','startEvent',NULL,'2017-01-17 21:46:45','2017-01-17 21:46:45',26,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20004','studentLeaveProcess:1:5004','20001','20001','usertask1','20005',NULL,'Â≠¶ÁîüÂ°´ÂÜôËØ∑ÂÅáÂçï','userTask',NULL,'2017-01-17 21:46:45','2017-01-17 21:46:45',993,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20007','studentLeaveProcess:1:5004','20001','20001','usertask2','20008',NULL,'Áè≠ÈïøÂÆ°Êâπ','userTask',NULL,'2017-01-17 21:46:45','2017-01-17 21:47:07',22649,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20014','studentLeaveProcess:1:5004','20001','20001','exclusivegateway1',NULL,NULL,'Exclusive Gateway','exclusiveGateway',NULL,'2017-01-17 21:47:07','2017-01-17 21:47:07',1,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('20015','studentLeaveProcess:1:5004','20001','20001','usertask5','20016',NULL,'Â≠¶ÁîüÂ§ÑÂÆ°Êâπ','userTask',NULL,'2017-01-17 21:47:07',NULL,NULL,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('7502','studentLeaveProcess:1:5004','7501','7501','startevent1',NULL,NULL,'Start','startEvent',NULL,'2016-12-08 10:16:28','2016-12-08 10:16:28',16,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('7504','studentLeaveProcess:1:5004','7501','7501','usertask1','7505',NULL,'Â≠¶ÁîüÂ°´ÂÜôËØ∑ÂÅáÂçï','userTask',NULL,'2016-12-08 10:16:28','2016-12-08 10:16:28',851,'');
insert  into `act_hi_actinst`(`ID_`,`PROC_DEF_ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`ACT_ID_`,`TASK_ID_`,`CALL_PROC_INST_ID_`,`ACT_NAME_`,`ACT_TYPE_`,`ASSIGNEE_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`TENANT_ID_`) values ('7507','studentLeaveProcess:1:5004','7501','7501','usertask2','7508',NULL,'Áè≠ÈïøÂÆ°Êâπ','userTask',NULL,'2016-12-08 10:16:28','2016-12-28 16:39:04',1750956681,'');

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('12501','comment','2016-12-28 16:38:21','ÁéãÂÖ´[Áè≠Èïø]','10008','10001','AddComment','ÂêåÊÑè','Õ¨“‚');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('12509','comment','2016-12-28 16:39:04','ÁéãÂÖ´[Áè≠Èïø]','7508','7501','AddComment','‰∏çÂêåÊÑè','≤ªÕ¨“‚');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('15001','comment','2017-01-05 10:08:22','ËµñÊúà‰∫¨[Á≥ªËæÖÂØºÂëò]','12507','10001','AddComment','ÂèØ‰ª•','ø…“‘');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('17510','comment','2017-01-12 22:33:40','ÁéãÂÖ´[Áè≠Èïø]','17508','17501','AddComment','ÊâπÊ≥®','≈˙◊¢');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('17518','comment','2017-01-12 22:35:07','ËµñÊúà‰∫¨[Á≥ªËæÖÂØºÂëò]','17516','17501','AddComment','ÊâπÊ≥®Âêß','≈˙◊¢∞…');
insert  into `act_hi_comment`(`ID_`,`TYPE_`,`TIME_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`ACTION_`,`MESSAGE_`,`FULL_MSG_`) values ('20010','comment','2017-01-17 21:47:07','ÁéãÂÖ´[Áè≠Èïø]','20008','20001','AddComment','ÂêåÊÑè‰∫Ü','Õ¨“‚¡À');

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('10006','xs','candidate',NULL,'10005',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('10009','bz','candidate',NULL,'10008',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('12504',NULL,'participant','ÁéãÂÖ´[Áè≠Èïø]',NULL,'10001');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('12508','xfdy','candidate',NULL,'12507',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('12512',NULL,'participant','ÁéãÂÖ´[Áè≠Èïø]',NULL,'7501');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('15002',NULL,'participant','ËµñÊúà‰∫¨[Á≥ªËæÖÂØºÂëò]',NULL,'10001');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17506','xs','candidate',NULL,'17505',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17509','bz','candidate',NULL,'17508',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17513',NULL,'participant','ÁéãÂÖ´[Áè≠Èïø]',NULL,'17501');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17517','xfdy','candidate',NULL,'17516',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('17519',NULL,'participant','ËµñÊúà‰∫¨[Á≥ªËæÖÂØºÂëò]',NULL,'17501');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('20006','xs','candidate',NULL,'20005',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('20009','bz','candidate',NULL,'20008',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('20013',NULL,'participant','ÁéãÂÖ´[Áè≠Èïø]',NULL,'20001');
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('20017','xsc','candidate',NULL,'20016',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('7506','xs','candidate',NULL,'7505',NULL);
insert  into `act_hi_identitylink`(`ID_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`) values ('7509','bz','candidate',NULL,'7508',NULL);

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('10001','10001',NULL,'studentLeaveProcess:1:5004','2016-12-08 10:17:27','2017-01-05 10:08:22',2418655587,NULL,'startevent1','endevent1',NULL,NULL,'',NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('17501','17501',NULL,'studentLeaveProcess:1:5004','2017-01-12 22:31:53','2017-01-12 22:35:07',194474,NULL,'startevent1','endevent1',NULL,NULL,'',NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('20001','20001',NULL,'studentLeaveProcess:1:5004','2017-01-17 21:46:45',NULL,NULL,NULL,'startevent1',NULL,NULL,NULL,'',NULL);
insert  into `act_hi_procinst`(`ID_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PROC_DEF_ID_`,`START_TIME_`,`END_TIME_`,`DURATION_`,`START_USER_ID_`,`START_ACT_ID_`,`END_ACT_ID_`,`SUPER_PROCESS_INSTANCE_ID_`,`DELETE_REASON_`,`TENANT_ID_`,`NAME_`) values ('7501','7501',NULL,'studentLeaveProcess:1:5004','2016-12-08 10:16:28','2016-12-28 16:39:04',1750956688,NULL,'startevent1','endevent1',NULL,NULL,'',NULL);

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('10005','studentLeaveProcess:1:5004','usertask1','10001','10001','Â≠¶ÁîüÂ°´ÂÜôËØ∑ÂÅáÂçï',NULL,NULL,NULL,NULL,'2016-12-08 10:17:27',NULL,'2016-12-08 10:17:27',958,'completed',50,NULL,NULL,NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('10008','studentLeaveProcess:1:5004','usertask2','10001','10001','Áè≠ÈïøÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2016-12-08 10:17:27',NULL,'2016-12-28 16:38:21',1750854927,'completed',50,NULL,'audit_bz.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('12507','studentLeaveProcess:1:5004','usertask4','10001','10001','Á≥ªËæÖÂØºÂëòÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2016-12-28 16:38:21',NULL,'2017-01-05 10:08:22',667801561,'completed',50,NULL,'audit_ld.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('17505','studentLeaveProcess:1:5004','usertask1','17501','17501','Â≠¶ÁîüÂ°´ÂÜôËØ∑ÂÅáÂçï',NULL,NULL,NULL,NULL,'2017-01-12 22:31:54',NULL,'2017-01-12 22:31:54',140,'completed',50,NULL,NULL,NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('17508','studentLeaveProcess:1:5004','usertask2','17501','17501','Áè≠ÈïøÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2017-01-12 22:31:54',NULL,'2017-01-12 22:33:40',106779,'completed',50,NULL,'audit_bz.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('17516','studentLeaveProcess:1:5004','usertask4','17501','17501','Á≥ªËæÖÂØºÂëòÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2017-01-12 22:33:40',NULL,'2017-01-12 22:35:07',87463,'completed',50,NULL,'audit_ld.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('20005','studentLeaveProcess:1:5004','usertask1','20001','20001','Â≠¶ÁîüÂ°´ÂÜôËØ∑ÂÅáÂçï',NULL,NULL,NULL,NULL,'2017-01-17 21:46:45',NULL,'2017-01-17 21:46:45',971,'completed',50,NULL,NULL,NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('20008','studentLeaveProcess:1:5004','usertask2','20001','20001','Áè≠ÈïøÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2017-01-17 21:46:45',NULL,'2017-01-17 21:47:07',22620,'completed',50,NULL,'audit_bz.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('20016','studentLeaveProcess:1:5004','usertask5','20001','20001','Â≠¶ÁîüÂ§ÑÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2017-01-17 21:47:07',NULL,NULL,NULL,NULL,50,NULL,'audit_ld.jsp',NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('7505','studentLeaveProcess:1:5004','usertask1','7501','7501','Â≠¶ÁîüÂ°´ÂÜôËØ∑ÂÅáÂçï',NULL,NULL,NULL,NULL,'2016-12-08 10:16:28',NULL,'2016-12-08 10:16:28',811,'completed',50,NULL,NULL,NULL,'');
insert  into `act_hi_taskinst`(`ID_`,`PROC_DEF_ID_`,`TASK_DEF_KEY_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`OWNER_`,`ASSIGNEE_`,`START_TIME_`,`CLAIM_TIME_`,`END_TIME_`,`DURATION_`,`DELETE_REASON_`,`PRIORITY_`,`DUE_DATE_`,`FORM_KEY_`,`CATEGORY_`,`TENANT_ID_`) values ('7508','studentLeaveProcess:1:5004','usertask2','7501','7501','Áè≠ÈïøÂÆ°Êâπ',NULL,NULL,NULL,NULL,'2016-12-08 10:16:28',NULL,'2016-12-28 16:39:04',1750956670,'completed',50,NULL,'audit_bz.jsp',NULL,'');

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('10003','10001','10001',NULL,'leaveId','integer',1,NULL,NULL,2,'2',NULL,'2016-12-08 10:17:27','2017-01-05 10:08:22');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12502','10001','10001',NULL,'msg','string',1,NULL,NULL,NULL,'ÈÄöËøá',NULL,'2016-12-28 16:38:21','2017-01-05 10:08:22');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12503','10001','10001',NULL,'days','integer',1,NULL,NULL,3,'3',NULL,'2016-12-28 16:38:21','2017-01-05 10:08:22');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12510','7501','7501',NULL,'msg','string',0,NULL,NULL,NULL,'Êú™ÈÄöËøá',NULL,'2016-12-28 16:39:04','2016-12-28 16:39:04');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('12511','7501','7501',NULL,'days','integer',0,NULL,NULL,3,'3',NULL,'2016-12-28 16:39:04','2016-12-28 16:39:04');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('17503','17501','17501',NULL,'leaveId','integer',1,NULL,NULL,1,'1',NULL,'2017-01-12 22:31:53','2017-01-12 22:35:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('17511','17501','17501',NULL,'msg','string',1,NULL,NULL,NULL,'ÈÄöËøá',NULL,'2017-01-12 22:33:40','2017-01-12 22:35:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('17512','17501','17501',NULL,'days','integer',1,NULL,NULL,3,'3',NULL,'2017-01-12 22:33:40','2017-01-12 22:35:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('20003','20001','20001',NULL,'leaveId','integer',0,NULL,NULL,3,'3',NULL,'2017-01-17 21:46:45','2017-01-17 21:46:45');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('20011','20001','20001',NULL,'msg','string',0,NULL,NULL,NULL,'ÈÄöËøá',NULL,'2017-01-17 21:47:07','2017-01-17 21:47:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('20012','20001','20001',NULL,'days','integer',0,NULL,NULL,30,'30',NULL,'2017-01-17 21:47:07','2017-01-17 21:47:07');
insert  into `act_hi_varinst`(`ID_`,`PROC_INST_ID_`,`EXECUTION_ID_`,`TASK_ID_`,`NAME_`,`VAR_TYPE_`,`REV_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`,`CREATE_TIME_`,`LAST_UPDATED_TIME_`) values ('7503','7501','7501',NULL,'leaveId','integer',1,NULL,NULL,2,'2',NULL,'2016-12-08 10:16:28','2016-12-28 16:39:04');

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('bz',NULL,'Áè≠Èïø',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('bzr',NULL,'Áè≠‰∏ª‰ªª',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('gly',NULL,'ÁÆ°ÁêÜÂëò',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('xfdy',NULL,'Á≥ªËæÖÂØºÂëò',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('xs',NULL,'Â≠¶Áîü',NULL);
insert  into `act_id_group`(`ID_`,`REV_`,`NAME_`,`TYPE_`) values ('xsc',NULL,'Â≠¶ÁîüÂ§Ñ',NULL);

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('cc2','bz');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('wangba','bz');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('ss','bzr');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('szx','bzr');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('sjb','gly');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('lyj','xfdy');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('cc2','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('lisi','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('ss','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('wangba','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('zhangsan','xs');
insert  into `act_id_membership`(`USER_ID_`,`GROUP_ID_`) values ('dzt','xsc');

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('cc2',NULL,'Áéã','‰∫åÂ∞è','sds@qq.com','12',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('dzt',NULL,'Êùú','Â≠êËÖæ','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('lisi',NULL,'Êùé','Âõõ','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('lyj',NULL,'Ëµñ','Êúà‰∫¨','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('sjb',NULL,'Ê≤à','ÈùôÊñå','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('ss',NULL,'sd','sd','sds@qq.com','d',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('szx',NULL,'Âè≤','ÁèçÊπò','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('wangba',NULL,'Áéã','ÂÖ´','123@qq.com','123',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('xx',NULL,'1','1','sds@qq.com','1',NULL);
insert  into `act_id_user`(`ID_`,`REV_`,`FIRST_`,`LAST_`,`EMAIL_`,`PWD_`,`PICTURE_ID_`) values ('zhangsan',NULL,'Âº†','‰∏â','123@qq.com','123',NULL);

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

insert  into `act_re_deployment`(`ID_`,`NAME_`,`CATEGORY_`,`TENANT_ID_`,`DEPLOY_TIME_`) values ('5001','Â≠¶ÁîüËØ∑ÂÅáÊµÅÁ®ãÊµãËØï02.zip',NULL,'','2016-11-22 09:45:51');

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

insert  into `act_re_procdef`(`ID_`,`REV_`,`CATEGORY_`,`NAME_`,`KEY_`,`VERSION_`,`DEPLOYMENT_ID_`,`RESOURCE_NAME_`,`DGRM_RESOURCE_NAME_`,`DESCRIPTION_`,`HAS_START_FORM_KEY_`,`HAS_GRAPHICAL_NOTATION_`,`SUSPENSION_STATE_`,`TENANT_ID_`) values ('studentLeaveProcess:1:5004',1,'http://www.activiti.org/test','Student Levae process','studentLeaveProcess',1,'5001','StudentLeaveProcess01.bpmn','StudentLeaveProcess01.png',NULL,0,1,1,'');

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

insert  into `act_ru_execution`(`ID_`,`REV_`,`PROC_INST_ID_`,`BUSINESS_KEY_`,`PARENT_ID_`,`PROC_DEF_ID_`,`SUPER_EXEC_`,`ACT_ID_`,`IS_ACTIVE_`,`IS_CONCURRENT_`,`IS_SCOPE_`,`IS_EVENT_SCOPE_`,`SUSPENSION_STATE_`,`CACHED_ENT_STATE_`,`TENANT_ID_`,`NAME_`,`LOCK_TIME_`) values ('20001',3,'20001',NULL,NULL,'studentLeaveProcess:1:5004',NULL,'usertask5',1,0,1,0,1,2,'',NULL,NULL);

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('20013',1,NULL,'participant','ÁéãÂÖ´[Áè≠Èïø]',NULL,'20001',NULL);
insert  into `act_ru_identitylink`(`ID_`,`REV_`,`GROUP_ID_`,`TYPE_`,`USER_ID_`,`TASK_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`) values ('20017',1,'xsc','candidate',NULL,'20016',NULL,NULL);

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

insert  into `act_ru_task`(`ID_`,`REV_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`PROC_DEF_ID_`,`NAME_`,`PARENT_TASK_ID_`,`DESCRIPTION_`,`TASK_DEF_KEY_`,`OWNER_`,`ASSIGNEE_`,`DELEGATION_`,`PRIORITY_`,`CREATE_TIME_`,`DUE_DATE_`,`CATEGORY_`,`SUSPENSION_STATE_`,`TENANT_ID_`,`FORM_KEY_`) values ('20016',1,'20001','20001','studentLeaveProcess:1:5004','Â≠¶ÁîüÂ§ÑÂÆ°Êâπ',NULL,NULL,'usertask5',NULL,NULL,NULL,50,'2017-01-17 21:47:07',NULL,NULL,1,'','audit_ld.jsp');

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('20003',1,'integer','leaveId','20001','20001',NULL,NULL,NULL,3,'3',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('20011',1,'string','msg','20001','20001',NULL,NULL,NULL,NULL,'ÈÄöËøá',NULL);
insert  into `act_ru_variable`(`ID_`,`REV_`,`TYPE_`,`NAME_`,`EXECUTION_ID_`,`PROC_INST_ID_`,`TASK_ID_`,`BYTEARRAY_ID_`,`DOUBLE_`,`LONG_`,`TEXT_`,`TEXT2_`) values ('20012',1,'integer','days','20001','20001',NULL,NULL,NULL,30,'30',NULL);

/*Table structure for table `t_leave` */

DROP TABLE IF EXISTS `t_leave`;

CREATE TABLE `t_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(64) DEFAULT NULL,
  `leaveDate` datetime DEFAULT NULL,
  `leaveDays` int(11) DEFAULT NULL,
  `leaveReason` text,
  `state` varchar(20) DEFAULT NULL,
  `processInstanceId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_leave` */

insert  into `t_leave`(`id`,`userId`,`leaveDate`,`leaveDays`,`leaveReason`,`state`,`processInstanceId`) values (1,'lisi','2016-11-28 15:18:28',3,'ËÇöÂ≠êÁñº','ÂÆ°Ê†∏ÈÄöËøá','17501');
insert  into `t_leave`(`id`,`userId`,`leaveDate`,`leaveDays`,`leaveReason`,`state`,`processInstanceId`) values (2,'lisi','2016-12-08 09:59:04',3,'ÂõûÂÆ∂ÁúãÁóÖ','ÂÆ°Ê†∏ÈÄöËøá','10001');
insert  into `t_leave`(`id`,`userId`,`leaveDate`,`leaveDays`,`leaveReason`,`state`,`processInstanceId`) values (3,'lisi','2017-01-17 21:46:43',30,'ÂõûÂéªÁé©','ÂÆ°Ê†∏‰∏≠','20001');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
