/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : du_toan_xay_dung

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-04-11 09:51:17
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of du_toan
-- ----------------------------
INSERT INTO `du_toan` VALUES ('1', 'dtxd_1523154263', '243242', '2018-04-01 00:00:00', 'noi dung a', '1', '3483998922');

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of du_toan_chi_tiet
-- ----------------------------
INSERT INTO `du_toan_chi_tiet` VALUES ('1', '1', 'CT1', 'Mài phẳng nút khoan phụt bê tông bằng máy mài(mài phẳng theo đường hàn, không mài phẳng theo COS của ống)', 'vị trí', '638164', '163.0', '104020744.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('2', '1', 'CT2', 'Mài rãnh mối hàn cũ bằng máy mài để phục vụ hàn xử lý kín nước', 'vị trí', '247175', '163.0', '40289524.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('3', '1', 'CT4', 'Mài sạch ba bia sau khi hàn loại 1', 'vị trí', '59441', '163.0', '9688864.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('4', '1', 'CT5', 'Đóng nêm giảm bớt nước các lỗ xuất lộ nước có đk lớn hơn 1mm', 'vị trí', '806754', '35.0', '28236400.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('5', '1', 'CT1', 'Mài phẳng nút khoan phụt bê tông bằng máy mài(mài phẳng theo đường hàn, không thể mài phẳng theo mặt phẳng của ống)', 'vị trí', '638164', '35.0', '22335744.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('6', '1', 'CT6', 'Đường hàn kín nước (dùng tấm bích hàn đắp lên)', 'vị trí', '8267367', '35.0', '289357856.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('7', '1', 'CT7', 'Mài sạch ba bia sau khi hàn loại 2', 'vị trí', '118882', '35.0', '4160861.8');
INSERT INTO `du_toan_chi_tiet` VALUES ('8', '1', 'CT13', 'Kiểm tra vết nứt sau khi hàn xử lý bằng phương pháp thẩm thấu', 'vị trí', '245859', '0.0', '0.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('9', '1', 'CT8', 'Sơn kim hoại bằng hệ sơn PS-01 công trình thủy điện A Lưới đã được phê duyệt(đề nghị CĐT cung cấp sơn) ', 'm2', '462524', '0.0', '0.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('10', '1', 'CT13\'', 'Xử lý kích đường ống cho bằng nhau tại mối hàn nối giữa 02 ống', 'vị trí', '9214421', '1.0', '9214422.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('11', '1', 'CT9\'', 'Mài đường hàn theo vết nứt chu vi', 'vị trí', '2555806', '1.0', '2555806.2');
INSERT INTO `du_toan_chi_tiet` VALUES ('12', '1', 'CT9', 'Hàn vết nứt chu vi bằng phương pháp hàn theo đường ống', 'vị trí', '29668579', '1.0', '29668578.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('13', '1', 'CT12', 'Mài ba via sau khi hàn loại 3', 'vị trí', '265023', '1.0', '265023.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('14', '1', 'CT9\'', 'Mài đường hàn theo vết nứt chu vi và đường sinh', 'vị trí', '2555806', '2.0', '5111612.5');
INSERT INTO `du_toan_chi_tiet` VALUES ('15', '1', 'CT11', 'Hàn vết nứt chu vi hoặc đường sinh bằng phương pháp hàn theo đường ống (hàn bù trực tiếp)', 'vị trí', '15827792', '2.0', '31655584.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('16', '1', 'CT12', 'Mài ba via sau khi hàn loại 3', 'vị trí', '265023', '2.0', '530046.1');
INSERT INTO `du_toan_chi_tiet` VALUES ('17', '1', 'CT13', 'Kiểm tra vết nứt sau khi hàn xử lý bằng phương pháp thẩm thấu(CĐT cung cấp vật tư)', 'vị trí', '245859', '0.0', '0.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('18', '1', 'TT', 'Sơn kim hoại bằng hệ sơn PS-01 công trình thủy điện A Lưới đã được phê duyệt(đề nghị CĐT cung cấp sơn) ', 'm2', '462524', '0.0', '0.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('19', '1', 'CT1', 'Mài phẳng nút khoan phụt bê tông bằng máy mài(mài phẳng theo đường hàn, không mài phẳng theo COS của ống)', 'vị trí', '638164', '247.0', '157626528.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('20', '1', 'CT2', 'Mài rãnh mối hàn cũ bằng máy mài để phục vụ hàn xử lý kín nước', 'vị trí', '247175', '247.0', '61052224.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('21', '1', 'CT3', 'Đường hàn kín nước(lỗ khoan bị thấm nước)bằng que hàn dưới nước Broco Underwater', 'vị trí', '1880749', '247.0', '464545088.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('22', '1', 'CT4', 'Mài sạch ba bia sau khi hàn loại 1', 'vị trí', '59441', '247.0', '14681898.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('23', '1', 'CT5', 'Đóng nêm giảm bớt nước các lỗ xuất lộ nước có đk lớn hơn 1mm', 'vị trí', '806754', '90.0', '72607888.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('24', '1', 'CT1', 'Mài phẳng nút khoan phụt bê tông bằng máy mài(mài phẳng theo đường hàn, không thể mài phẳng theo mặt phẳng của ống)', 'vị trí', '638164', '90.0', '57434768.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('25', '1', 'CT6', 'Đường hàn kín nước (dùng tấm bích hàn đắp lên)', 'vị trí', '8267367', '90.0', '744063040.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('26', '1', 'CT7', 'Mài sạch ba bia sau khi hàn loại 2', 'vị trí', '118882', '90.0', '10699359.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('27', '1', 'CT9\'', 'Mài đường hàn theo vết nứt chu vi', 'vị trí', '2555806', '11.0', '28113868.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('28', '1', 'CT11', 'Khắc phục nước chảy rò rỉ vừa tại vết nứt và hàn vết nứt chu vi bằng phương pháp hàn vá theo chu vi đường ống', 'vị trí', '15827792', '11.0', '174105712.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('29', '1', 'CT12', 'Mài ba via sau khi hàn loại 3', 'vị trí', '265023', '11.0', '2915253.5');
INSERT INTO `du_toan_chi_tiet` VALUES ('30', '1', 'CT14', 'Lắp đặt hệ thống điện phục vụ thi công trong hầm', 'Trọn gói', '219566089', '1.0', '219566096.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('31', '1', 'CT15', 'Tháo dỡ hệ thống điện phục vụ thi công', 'Trọn gói', '49077467', '1.0', '49077468.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('32', '1', 'TT', 'Mua sắm máy nén khí phục vụ thi công (loại Máy nén khí 24m3/h)', 'cái', '7590000', '1.0', '7590000.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('33', '1', 'TT', 'Mua sắm máy mài khí nén', 'cái', '4500000', '4.0', '18000000.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('34', '1', 'TT', 'Đường ống khí nén Ø8', 'm', '35500', '100.0', '3550000.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('35', '1', 'TT', 'Bộ khớp nối nhanh ông khi nén', 'Bộ', '33000', '2.0', '66000.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('36', '1', 'TT', 'Ống ren M50x300(nằm trong các bộ giá đỡ kích)', 'cái', '150000', '6.0', '900000.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('37', '1', 'TT', 'Tấm thép để kích theo biên dạng của ống(3 cái)', 'kg', '35500', '22.6', '802300.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('38', '1', 'TT', 'Sàn thao tác(2cái)', 'kg', '33500', '188.2', '6304700.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('39', '1', 'TT', 'Kích ren 5 tấn', 'cái', '1045000', '3.0', '3135000.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('40', '1', 'TT', 'Giá để máy hàn (2 cái)', 'kg', '33500', '188.2', '6304700.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('41', '1', 'TT', 'Giá đỡ kích (3bộ)', 'kg', '35500', '240.3', '8530650.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('42', '1', 'TT', 'Que hàng Broco underwater', 'Hộp', '10570000', '1.0', '10570000.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('43', '1', 'VCVT', 'Vận chuyển vật tư, thiết bị phục vụ thi công', 'chuyến', '22430370', '1.0', '22430370.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('44', '1', 'TT', 'Chi phí đi lại của cán bộ công nhân', 'người', '800000', '14.0', '11200000.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('45', '1', 'GCM', 'Thuê xe bán tải chở người đi làm tại hầm ngang hầm phụ số 4', 'tháng', '31317960', '1.0', '31317960.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('46', '1', 'GCM', 'Dầu diezen phục vụ máy phát điện 75KVA và xe ô tô ', 'ca', '699840', '60.0', '41990400.0');
INSERT INTO `du_toan_chi_tiet` VALUES ('47', '1', 'CT16', 'Hỗ trợ vật tư và nhân công xử lỹ khống chế việc xì nước tại vị trí Km11+470', 'Trọn gói', '11797915', '1.0', '11797915.0');

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
INSERT INTO `logo` VALUES ('/images/database/logo/_ea5460235427bc49f3f8c13f5a0735a85ac0f2b17060f3.87725081.jpg', '0', '0');

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
