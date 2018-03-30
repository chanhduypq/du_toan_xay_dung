/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : du_toan_xay_dung

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-30 11:51:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for du_toan
-- ----------------------------
DROP TABLE IF EXISTS `du_toan`;
CREATE TABLE `du_toan` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `so_quyet_dinh` bigint(21) DEFAULT NULL,
  `ngay_quyet_dinh` timestamp NULL DEFAULT NULL,
  `noi_dung_quyet_dinh` text,
  `user_id` int(11) DEFAULT NULL,
  `tong_tien` bigint(21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of du_toan
-- ----------------------------

-- ----------------------------
-- Table structure for du_toan_chi_tiet
-- ----------------------------
DROP TABLE IF EXISTS `du_toan_chi_tiet`;
CREATE TABLE `du_toan_chi_tiet` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `du_toan_id` int(11) NOT NULL,
  `ky_hieu` varchar(11) NOT NULL,
  `doi_tuong` varchar(255) NOT NULL,
  `don_vi` varchar(255) DEFAULT NULL,
  `don_gia` int(10) NOT NULL,
  `khoi_luong` float(10,1) NOT NULL,
  `thanh_tien` float(11,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of du_toan_chi_tiet
-- ----------------------------

-- ----------------------------
-- Table structure for footer
-- ----------------------------
DROP TABLE IF EXISTS `footer`;
CREATE TABLE `footer` (
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of footer
-- ----------------------------
INSERT INTO `footer` VALUES ('<p style=\"text-align:center\">&copy;C&ocirc;ng ty Cổ phần Thủy điện miền Trung</p>\r\n\r\n<p style=\"text-align:center\">Li&ecirc;n hệ: Ph&ograve;ng Kỹ thuật - P4</p>\r\n');

-- ----------------------------
-- Table structure for header_pdf
-- ----------------------------
DROP TABLE IF EXISTS `header_pdf`;
CREATE TABLE `header_pdf` (
  `content` longtext,
  `json` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of header_pdf
-- ----------------------------
INSERT INTO `header_pdf` VALUES ('<table style=\"width:100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align:center; width:50%\">\r\n			<h3><strong>[1]</strong>TẬP ĐO&Agrave;N ĐIỆN LỰC VIỆT NAM</h3>\r\n\r\n			<h3><strong>[3]</strong>TỔNG C&Ocirc;NG TY ĐIỆN LỰC MIỀN TRUNG</h3>\r\n			</td>\r\n			<td style=\"text-align:center; width:50%\">\r\n			<h3><strong>[2]</strong>&Ocirc;N TẬP TRỰC TUYẾN</h3>\r\n\r\n			<h3><strong>[4]</strong>C&Ocirc;NG NH&Acirc;N KỸ THUẬT SƠ CẤP NĂM 2017</h3>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\" style=\"text-align:center; width:100%\">\r\n			<h3><strong>[5]</strong>KẾT QUẢ LUYỆN THI KIẾN THỨC AN TO&Agrave;N ĐIỆN</h3>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n', '[\"C\\u00d4NG TY C\\u1ed4 PH\\u1ea6N TH\\u1ee6Y \\u0110I\\u1ec6N MI\\u1ec0N TRUNG\",\"K\\u1ef2 THI TR\\u1eaeC NGHI\\u1ec6M AN TO\\u00c0N \\u0110I\\u1ec6N\",\"PH\\u00d2NG K\\u1ef8 THU\\u1eacT\",\" B\\u1eacC AN TO\\u00c0N \\u0110I\\u1ec6N {level} N\\u0102M {nam}\",\"K\\u1ebeT QU\\u1ea2 THI KI\\u1ebeN TH\\u1ee8C AN TO\\u00c0N \\u0110I\\u1ec6N\"]');

-- ----------------------------
-- Table structure for header_text
-- ----------------------------
DROP TABLE IF EXISTS `header_text`;
CREATE TABLE `header_text` (
  `text` varchar(255) NOT NULL,
  `dynamic` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of header_text
-- ----------------------------
INSERT INTO `header_text` VALUES ('Quản lý xây dựng', '0');

-- ----------------------------
-- Table structure for hinh_nen
-- ----------------------------
DROP TABLE IF EXISTS `hinh_nen`;
CREATE TABLE `hinh_nen` (
  `file_name` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hinh_nen
-- ----------------------------
INSERT INTO `hinh_nen` VALUES ('/images/database/hinhnen/_ccba5432efd2074fe7c15b991cb449545ab53b470f5828.14995862.jpg');

-- ----------------------------
-- Table structure for home_content
-- ----------------------------
DROP TABLE IF EXISTS `home_content`;
CREATE TABLE `home_content` (
  `content` longtext,
  `bg` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of home_content
-- ----------------------------
INSERT INTO `home_content` VALUES ('<p>Xin ch&agrave;o mọi người.</p>\r\n', '');

-- ----------------------------
-- Table structure for logo
-- ----------------------------
DROP TABLE IF EXISTS `logo`;
CREATE TABLE `logo` (
  `file_name` varchar(1000) NOT NULL,
  `dynamic` int(1) DEFAULT NULL,
  `show` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logo
-- ----------------------------
INSERT INTO `logo` VALUES ('/images/database/logo/_37215048fbcc4e18469cabca7545e3505abdba432f77b3.84487846.png', '0', '1');

-- ----------------------------
-- Table structure for thiet_bi
-- ----------------------------
DROP TABLE IF EXISTS `thiet_bi`;
CREATE TABLE `thiet_bi` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `so_quyet_dinh` varchar(255) DEFAULT NULL,
  `ngay_quyet_dinh` timestamp NULL DEFAULT NULL,
  `noi_dung_quyet_dinh` text,
  `user_id` int(11) DEFAULT NULL,
  `tong_tien` bigint(21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thiet_bi
-- ----------------------------

-- ----------------------------
-- Table structure for thiet_bi_chi_tiet
-- ----------------------------
DROP TABLE IF EXISTS `thiet_bi_chi_tiet`;
CREATE TABLE `thiet_bi_chi_tiet` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `thiet_bi_id` int(11) NOT NULL,
  `ten_vttb` varchar(255) NOT NULL,
  `dac_tinh_ky_thuat` text NOT NULL,
  `don_vi` varchar(255) DEFAULT NULL,
  `don_gia` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `thanh_tien` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of thiet_bi_chi_tiet
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `danh_xung` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'Danh xưng (anh/chị)',
  `full_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'Tên đầy đủ (Minh Kỳ)',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_download` tinyint(1) DEFAULT NULL,
  `is_upload` tinyint(1) DEFAULT NULL,
  `is_thongke` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Anh', 'Dương Viết Cương', 'cuongchp@gmail.com', '', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1', '1', '1', '1');
INSERT INTO `user` VALUES ('2', 'Anh', 'tuệ', 'chanhduypq@gmail.com', null, 'ca9bcd61ff000dcc95ff7f12c08eb39ddcaf41af', null, '1', '1', '1');

-- ----------------------------
-- View structure for layout_content
-- ----------------------------
DROP VIEW IF EXISTS `layout_content`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `layout_content` AS SELECT header_text.text as header_text,header_text.dynamic as dynamic_header_text,logo.file_name,logo.`show`,logo.dynamic as dynamic_logo,footer.text as footer_text,hinh_nen.file_name as hinh_nen_file_name from hinh_nen,footer,header_text,logo ;
