-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothes-web-shop`
--

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `role_id`) VALUES
('14f40b93-5f1e-459f-b2ea-fa72ce724fc8', 'hung@gmail.com', '$2b$10$oC7gN6VwK1kEEWAgKApuTOinjTHqf/OSysOhU96nEwhS.8BBx37VO', 2),
('1ca2f9f9-6f0a-4bb1-b404-bfca5d900c6c', 'minh@gmail.com', '$2b$10$wbiTajwynughf0pBJv97b.tByg4SVWDIstXZXttKyHLmIRYB275lC', 2),
('48dc67cb-4f4b-451a-858d-ab4871a74ce8', 'duy@gmail.com', '$2b$10$5GVDobChG8UQomWlN28N/uUT8RgVtzJQBI6QXjFETE/eIPhp/p06e', 2),
('57344864-8985-42bf-92d5-b60751df65ff', 'khoa@gmail.com', '$2b$10$ZwWtuMG6GbGioKK4QlG.SeELNk5YdhfdIpm5/inZIRTvETeoBADf2', 2),
('8122d05f-513a-4b12-bd99-1b4e34ef8f3e', 'trong@gmail.com', '$2b$10$9G9lh4Ii1T7MyB/JuEkG9uNqSaZcalS5tQrTPfu45NynMZDDOD/56', 2),
('8d097ddc-c9a2-4c0a-8e60-bdc7c115d519', 'danh@gmail.com', '$2b$10$ZKWWd50RKECq3a8j.b0fn.CWeMjVwYnryETfHWV6TVKZeiEH3CtxS', 2),
('9a2d12e6-0990-48e7-9f9a-98ffa7fc7768', 'an@gmail.com', '$2b$10$M.7KB8pIVdmU3FLWYvVJh.hq62XVDVr.gujPYBq9lyEdyXrOx4yQC', 1),
('ac0df2ff-dded-49bc-9c2c-da8ebe204296', 'phat@gmail.com', '$2b$10$Xxwnl35b0T1BBJ5dOaZ/pedV4.qosesOldtUEDSJUrRCiPHatrQ7e', 1),
('e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0', 'tin@gmail.com', '$2b$10$8skwyL4IXIy2V80MiaZ2AOtC9fKxMWUAwc/MzeO647VR4g6sUcRF6', 2),
('fae061a3-29eb-4295-9bd5-0f7b4dc8747b', 'huu@gmail.com', '$2b$10$Vnf66uUglVnu3rhAQMWC1O/ZE3a/0atNaEEQ.9TP4SrDh52NLLAhy', 2);

--
-- Dumping data for table `customer_infos`
--

INSERT INTO `customer_infos` (`customer_info_id`, `customer_name`, `phone_number`, `address`, `user_id`) VALUES
(1, 'Nguyễn Thanh Danh', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', '8d097ddc-c9a2-4c0a-8e60-bdc7c115d519'),
(2, 'Nguyễn Trần Quốc Duy', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', '48dc67cb-4f4b-451a-858d-ab4871a74ce8'),
(3, 'Trần Đình Hưng', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', '14f40b93-5f1e-459f-b2ea-fa72ce724fc8'),
(4, 'Hứa Tuấn Hữu', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 'fae061a3-29eb-4295-9bd5-0f7b4dc8747b'),
(5, 'Võ Tiến Khoa', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', '57344864-8985-42bf-92d5-b60751df65ff'),
(6, 'Vũ Đức Minh', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', '1ca2f9f9-6f0a-4bb1-b404-bfca5d900c6c'),
(7, 'Vương Trung Tín', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 'e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0'),
(8, 'Lý Hùng Trọng', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', '8122d05f-513a-4b12-bd99-1b4e34ef8f3e');

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `title`, `level`, `parent_id`) VALUES
(1, 'Áo Nam', 1, NULL),
(2, 'Quần Nam', 1, NULL),
(3, 'Quần Lót Nam', 1, NULL),
(4, 'Áo T-Shirt', 2, 1),
(5, 'Áo Polo', 2, 1),
(6, 'Áo Sơ Mi', 2, 1),
(7, 'Quần Short', 2, 2),
(8, 'Quần Jeans', 2, 2),
(9, 'Quần Brief (Tam Giác)', 2, 3),
(10, 'Quần Trunk (Boxer)', 2, 3),
(11, 'Quần Brief Boxer (Boxer Dài)', 2, 3);

--
-- Dumping data for table `colours`
--

INSERT INTO `colours` (`colour_id`, `colour_name`) VALUES
(1, 'Trắng'),
(2, 'Đen'),
(3, 'Xám'),
(4, 'Xám Đen'),
(5, 'Xanh Đậm'),
(6, 'Xanh Nhạt'),
(7, 'Xanh Aqua'),
(8, 'Xanh Navy'),
(9, 'Xanh Rêu');

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`size_id`, `size_name`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL'),
(5, '2XL'),
(6, '3XL'),
(7, '29'),
(8, '30');

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `rating`, `sold`, `feedback_quantity`, `created_at`, `deleted_at`, `category_id`) VALUES
(1, 'Áo thun thể thao nam Active ProMax', '<h4>Đặc điểm nổi bật Áo thun thể thao nam Active ProMax</h4><p>Nếu bạn đã sử dụng chiếc Áo thể thao nam Promax-S1 thì không nên thể bỏ lỡ chiếc áo thun thể thao nam Active Promax bởi những đặc điểm nổi bật :</p><ul><li>Công nghệ xử lý hoàn thiện: Quick-Dry (Nhanh khô) và Wicking (thấm hút nhanh).</li><li>Đây còn là chiếc áo được dệt và nhuộm theo quy trình không nước thải, hướng đến mục tiêu thời trang bền vững.</li><li>Không nhăn và tạo cảm giác thoáng mát khi vận động.</li></ul><h4>Chất liệu Áo thun thể thao nam Active ProMax</h4><p>Vẫn là chất liệu đặc trưng 100% Recycle Polyester chiếc áo thun thể thao này đi theo hướng thời trang bền vững, được may theo công nghệ Wicking (thấm hút) và Quickdry (nhanh khô).</p><p>Được sản xuất và hoàn thiện tại nhà máy Nobland, Bình Dương - thuộc tập đoàn Nobland, một tập đoàn về sản xuất đồ may mặc lớn trên thị trường và nhà máy Nobland được thành lập tại Việt Nam từ năm 2003.</p><p>Chúng tôi luôn tự hào về những nơi sản xuất ra những chiếc áo thun nam để có thể phục vụ các bạn.</p><h4>Thiết kế Áo thun thể thao nam Active ProMax</h4><p>Với thiết kế kiểu dáng áo thun nam dáng suông giúp các nam giới có thể chơi thể thao tự tin, thoải mái nhất.Kiểu dáng áo thun thể thao vừa vặn với dáng nam giới Việt Nam tạo nên sự năng động, cá tính khi chơi thể thao.</p><h4>Cách bảo quản áo thun thể thao nam Active Promax</h4><p><strong>Cách sử dụng:&nbsp;</strong><br>Nên giặt với nước lạnh dưới 40 độ và tuyệt đối không nên giặt với nước nóng sẽ làm co giãn sợi vải và bị dão áo.<br>Không nên phơi trực tiếp bề mặt áo phải dưới ánh nắng mặt trời và nên sử dụng móc treo đồ để tránh gây nếp nhăn cho áo thun thể thao.<br><strong>Bảo quản:</strong><br>Không nên để áo thun ở những nơi ẩm ướt, với tính chất hút ẩm, hút nước tốt, áo thun dễ bị ẩm mốc, thậm chí để lại những vết ố trên vải áo.</p>', 2.6667, 5, 3, '2023-03-04 03:40:56', NULL, 4),
(2, 'Quần Jeans Clean Denim dáng Regular S3', '<h4>Đặc điểm nổi bật Quần Jeans Clean Denim dáng Regular S3</h4><p>Với nguyên liệu và quy cách nhuộm mới đảm bảo sẽ là chiếc Jeans bền màu và thân thiện môi trường hãy cùng xem những quy trình nổi bật &nbsp;để tạo ra chiếc quần Jeans này nhé:</p><ul><li>Sợi vải được nhuộm theo quy trình sạch và bền vững</li><li>Định lượng vải siêu nhẹ mang lại cảm giác thoải mái</li><li>Quần có độ co giãn tốt 4 chiều</li><li>Định lượng vải nhẹ chỉ với 13.7 Oz</li></ul><h4>Thiết kế của quần Jeans Clean Denim dáng Regular S3</h4><p>Với tiêu chí luôn mang lại \"sự thoải mái\" lên hàng đầu chúng tôi đã đưa vào chiếc quần Jeans nam với những thiết kế rất tỉ mỉ và chất lượng</p><ul><li>Co giãn tốt với chất liệu Cotton kết hợp Elastane đem đến độ co giãn thoải mái</li><li>Túi sâu đựng những sản phẩm cá nhân tiện lợi</li><li>Kiểu dáng Slimfit, co giãn tốt, không bo ống phù hợp mặc đa chức năng</li></ul><h4>Chất liệu quần Jeans Clean Denim dáng Regular S3</h4><ul><li>Vải Denim được dệt toàn bộ tại nhà máy Nhơn Trạch, Đồng Nai của Saitex</li><li>Chất liệu: 99% Regenerative Cotton (Cotton Tái sinh) + 1% Elastane, tạo sự co giãn đem đến sự thoải mái khi vận động</li><li>Định lượng vải nhẹ chỉ với 13.7 Oz</li><li>Kéo sợi và dệt nhuộm theo quy trình sạch và bền vững tại Việt Nam</li></ul><h4>Cách mix đồ với quần Jeans Clean Denim dáng Regular S3</h4><p>Ngoài những chiếc quần short thì với bất kì chàng trai nào trong tủ đồ cũng cần phải có một chiếc quần jeans nam, mỗi khi bước xuống phố thì một set đồ bao gồm chiếc quần jeans phối cùng chiếc áo thun, hay một chiếc áo polo sẽ khiến cho chàng trai trở nên gọn gàng và lịch lãm hơn rất nhiều.</p><p>&nbsp;</p><h4>Cách bảo quản quần Jeans Clean Denim dáng Regular S3</h4><ul><li>Không giặt quần jean thường xuyên: Quần Jeans đen rất dễ bị bay màu theo thời gian.</li><li>Lộn mặt trái ra bên ngoài khi giặt: Lộn mặt trái ra bên ngoài sẽ giúp mặt nhuộm màu không tiếp xúc nhiều với nước và xà phòng.</li><li>Chọn chu kỳ quay và nhiệt độ thấp nhất: Thuốc nhuộm của quần jeans dễ bị nhả màu khi giặt giũ là do chịu áp lực quay của máy giặt cũng như nhiệt độ của nước.</li><li>Sử dụng nước giặt có độ tẩy nhẹ hoặc nước giặt giữ màu: Hiện nay trên thị trường có rất nhiều nước giặt giữ màu sắc quần.</li></ul>', 0, 3, 0, '2023-03-04 03:50:20', NULL, 8);

--
-- Dumping data for table `product_price_histories`
--

INSERT INTO `product_price_histories` (`product_id`, `created_at`, `price`) VALUES
(1, '2023-03-04 03:40:56', 179000),
(2, '2023-03-04 03:50:20', 599000);

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`product_variant_id`, `quantity`, `state`, `created_at`, `deleted_at`, `product_id`, `colour_id`, `size_id`) VALUES
(1, 12, 1, '2023-03-04 03:40:56', NULL, 1, 1, 1),
(2, 12, 0, '2023-03-04 03:40:56', NULL, 1, 1, 2),
(3, 12, 1, '2023-03-04 03:40:57', NULL, 1, 1, 3),
(4, 12, 1, '2023-03-04 03:40:57', NULL, 1, 1, 4),
(5, 12, 0, '2023-03-04 03:40:57', NULL, 1, 1, 5),
(6, 12, 0, '2023-03-04 03:40:57', NULL, 1, 1, 6),
(7, 11, 1, '2023-03-04 03:40:57', NULL, 1, 2, 1),
(8, 12, 1, '2023-03-04 03:40:57', NULL, 1, 2, 2),
(9, 12, 1, '2023-03-04 03:40:58', NULL, 1, 2, 3),
(10, 12, 1, '2023-03-04 03:40:58', NULL, 1, 2, 4),
(11, 12, 1, '2023-03-04 03:40:58', NULL, 1, 2, 5),
(12, 12, 1, '2023-03-04 03:40:58', NULL, 1, 2, 6),
(13, 12, 1, '2023-03-04 03:40:58', NULL, 1, 7, 1),
(14, 12, 0, '2023-03-04 03:40:59', NULL, 1, 7, 2),
(15, 12, 1, '2023-03-04 03:40:59', NULL, 1, 7, 3),
(16, 12, 1, '2023-03-04 03:41:00', NULL, 1, 7, 4),
(17, 12, 0, '2023-03-04 03:41:00', NULL, 1, 7, 5),
(18, 12, 1, '2023-03-04 03:41:00', NULL, 1, 7, 6),
(19, 12, 1, '2023-03-04 03:50:20', NULL, 2, 5, 7),
(20, 12, 0, '2023-03-04 03:50:20', NULL, 2, 5, 8),
(21, 0, 1, '2023-03-04 03:50:20', NULL, 2, 6, 7),
(22, 3, 1, '2023-03-04 03:50:21', NULL, 2, 6, 8);

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `path`, `product_variant_id`) VALUES
(1, 'http://localhost:8080/static/images/35bd44e7-3969-4a28-9c32-077b9f85162c.jpg', 1),
(2, 'http://localhost:8080/static/images/ee109d4c-be51-4e7e-b3f3-fdb0ecb03947.jpg', 1),
(3, 'http://localhost:8080/static/images/9ce5f946-bd51-46e8-9d69-ada0a74a4419.jpg', 1),
(4, 'http://localhost:8080/static/images/f7379efd-e529-47af-af2d-a2b453e17414.jpg', 2),
(5, 'http://localhost:8080/static/images/4d4f7b5e-2e77-4680-98b2-00a0a8cd4d8a.jpg', 2),
(6, 'http://localhost:8080/static/images/54497cd9-4661-4238-a7f7-5297650fc741.jpg', 2),
(7, 'http://localhost:8080/static/images/b61668db-eea8-43d6-aa33-7582f0bb0c7e.jpg', 3),
(8, 'http://localhost:8080/static/images/aa0c7d50-73ed-499c-aff9-9e159ac9571a.jpg', 3),
(9, 'http://localhost:8080/static/images/2edc21e6-a676-4172-890c-55b20723f8e5.jpg', 3),
(10, 'http://localhost:8080/static/images/8b53c96d-8b50-4603-b422-068f961b5ae9.jpg', 4),
(11, 'http://localhost:8080/static/images/3bdbb49e-5f00-43a3-b191-f904e4a9dfaf.jpg', 4),
(12, 'http://localhost:8080/static/images/fdcea22a-0527-4d30-a5df-072172d4b9da.jpg', 4),
(13, 'http://localhost:8080/static/images/a5aa74ad-6dc3-4272-a5a0-9142ff739d71.jpg', 5),
(14, 'http://localhost:8080/static/images/67403633-6ea9-4496-a96c-132fa2ab8fa4.jpg', 5),
(15, 'http://localhost:8080/static/images/47739ffb-f5ab-466b-afd7-f2057a3b73b2.jpg', 5),
(16, 'http://localhost:8080/static/images/ccfcb878-10b2-443b-aba4-04ba965228a2.jpg', 6),
(17, 'http://localhost:8080/static/images/e30e8250-0e48-48b9-a5b4-9656a94b51ab.jpg', 6),
(18, 'http://localhost:8080/static/images/c02d89cf-1aa0-49b0-9f60-6df55ecd8fc9.jpg', 6),
(19, 'http://localhost:8080/static/images/a7cfe483-a292-4483-9acf-837d1cf736da.jpg', 7),
(20, 'http://localhost:8080/static/images/e12ea1e2-03f5-4b17-bbd1-37c06744c5d8.jpg', 7),
(21, 'http://localhost:8080/static/images/d2c4c48c-7bbd-4199-b4ad-18e252579772.jpg', 7),
(22, 'http://localhost:8080/static/images/2976d224-ee7a-4a3f-a55a-b3151adcd93a.jpg', 8),
(23, 'http://localhost:8080/static/images/47cf0a65-365b-4ec9-a88c-304e588fee19.jpg', 8),
(24, 'http://localhost:8080/static/images/262af682-dc22-40ed-83cf-c3e88906a12c.jpg', 8),
(25, 'http://localhost:8080/static/images/ddc99cfc-c8b1-4f40-8b01-700e30963aba.jpg', 9),
(26, 'http://localhost:8080/static/images/f15ebb1c-a06a-40f2-ae43-da122fdc922a.jpg', 9),
(27, 'http://localhost:8080/static/images/71ecf252-daea-47fe-bcff-8dec96b304d8.jpg', 9),
(28, 'http://localhost:8080/static/images/99c58d8e-66e9-4a9e-b8fd-ed05a7eeba7a.jpg', 10),
(29, 'http://localhost:8080/static/images/2b83bb47-acd8-4333-9ae3-c4bc554b916c.jpg', 10),
(30, 'http://localhost:8080/static/images/0708ee53-46b4-45ec-b4f1-b58308684d7c.jpg', 10),
(31, 'http://localhost:8080/static/images/890d3212-626d-4351-a52e-d6a4087f6777.jpg', 11),
(32, 'http://localhost:8080/static/images/87865f13-9f1a-45a7-9f43-e89b54d28117.jpg', 11),
(33, 'http://localhost:8080/static/images/e2619ac9-bcf0-4286-91bb-4eda76a75b5e.jpg', 11),
(34, 'http://localhost:8080/static/images/8627315c-80df-4116-8cc2-faa6fcf8ddd5.jpg', 12),
(35, 'http://localhost:8080/static/images/bcae5588-d75b-493a-82ee-87e70d78a8e1.jpg', 12),
(36, 'http://localhost:8080/static/images/af96922a-c52f-4b4e-bd36-24e3ace05d93.jpg', 12),
(37, 'http://localhost:8080/static/images/b7f3bbe0-b69e-4f95-82f7-0da2086574b9.jpg', 13),
(38, 'http://localhost:8080/static/images/6786fee4-5d82-42a1-888a-d27cedd0f239.jpg', 13),
(39, 'http://localhost:8080/static/images/669a63d3-3b13-4b4b-a781-81e293e75f0d.jpg', 13),
(40, 'http://localhost:8080/static/images/ee2a127b-8dc1-479d-a973-298674c92fba.jpg', 14),
(41, 'http://localhost:8080/static/images/2ab436a3-93e3-4c72-87b1-1b44bb570ff4.jpg', 14),
(42, 'http://localhost:8080/static/images/009447f4-aca6-454b-989d-930087c39b38.jpg', 14),
(43, 'http://localhost:8080/static/images/ed6fe3ca-b35b-4335-853e-b10c0a63d109.jpg', 15),
(44, 'http://localhost:8080/static/images/68a308dd-9d51-4584-a3a8-daa5aa5d63ed.jpg', 15),
(45, 'http://localhost:8080/static/images/ccd291a5-ca6e-4c4c-8197-1b2eb01c7012.jpg', 15),
(46, 'http://localhost:8080/static/images/3cdfe621-a586-4d83-841d-d29eaad1b6b1.jpg', 16),
(47, 'http://localhost:8080/static/images/138ae840-41e7-46ca-9b78-c91ad419f093.jpg', 16),
(48, 'http://localhost:8080/static/images/ffd97e91-d210-4bdb-a27f-6ae38f463c26.jpg', 16),
(49, 'http://localhost:8080/static/images/59eec383-e034-4ed4-9d39-917c90f80a95.jpg', 17),
(50, 'http://localhost:8080/static/images/18d4c96d-0a61-4be7-9d06-072fb4ca9e74.jpg', 17),
(51, 'http://localhost:8080/static/images/c8fa8a85-49e9-4fe0-b015-a8050c8507d7.jpg', 17),
(52, 'http://localhost:8080/static/images/dc939839-44bd-4636-94a6-a2cff78e3f9c.jpg', 18),
(53, 'http://localhost:8080/static/images/3542ce68-8ba4-496b-a1e8-9af4ac1ab0cc.jpg', 18),
(54, 'http://localhost:8080/static/images/8ab27714-9da3-4d94-ac95-719eb86fb01f.jpg', 18),
(55, 'http://localhost:8080/static/images/81a212a5-f49b-4ee8-a43b-b9e30f10f1c8.jpg', 19),
(56, 'http://localhost:8080/static/images/88fcfc0d-454c-41ce-a281-301de0596885.jpg', 19),
(57, 'http://localhost:8080/static/images/4d2ced7b-877a-49d1-9b14-ca52eaf576f8.jpg', 19),
(58, 'http://localhost:8080/static/images/a2e2f42b-8e39-4530-b54b-22b7cd74a647.jpg', 20),
(59, 'http://localhost:8080/static/images/cb668394-0f3c-47c2-b86c-5134c02119bd.jpg', 20),
(60, 'http://localhost:8080/static/images/4f1cb816-b628-4853-9630-be88d24ae67b.jpg', 20),
(61, 'http://localhost:8080/static/images/d365588f-8e80-4719-a833-3e43244ce0de.jpg', 21),
(62, 'http://localhost:8080/static/images/2dacf5ac-96b3-4825-b75c-7a6968241a34.jpg', 21),
(63, 'http://localhost:8080/static/images/0384d1d2-d6c6-4555-a7fd-a34202992c53.jpg', 21),
(64, 'http://localhost:8080/static/images/24b871e5-7ec2-4a0d-834b-dd524cfb8a76.jpg', 22),
(65, 'http://localhost:8080/static/images/6a2ba58c-8909-4f2f-a16c-3dcc9cf29cb2.jpg', 22),
(66, 'http://localhost:8080/static/images/3feebfb3-dd80-44ad-9e4c-c9556c1bff2b.jpg', 22);

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_name`, `email`, `phone_number`, `address`, `total_product_value`, `delivery_charges`, `total_order_value`, `user_id`) VALUES
('71828451735555', 'Vương Trung Tín', 'tin@gmail.com', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 957000, 20000, 977000, 'e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0'),
('71828456877430', 'Vương Trung Tín', 'tin@gmail.com', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 957000, 20000, 977000, 'e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0'),
('71828458724551', 'Nguyễn Thanh Danh', 'danh@gmail.com', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 778000, 20000, 798000, '8d097ddc-c9a2-4c0a-8e60-bdc7c115d519'),
('71852912157786', 'Vương Trung Tín', 'tin@gmail.com', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 957000, 20000, 977000, 'e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0'),
('71852912205857', 'Vương Trung Tín', 'tin@gmail.com', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 957000, 20000, 977000, 'e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0'),
('71852912226347', 'Vương Trung Tín', 'tin@gmail.com', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 957000, 20000, 977000, 'e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0'),
('71852987268026', 'Nguyễn Thanh Danh', 'danh@gmail.com', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 957000, 20000, 977000, '8d097ddc-c9a2-4c0a-8e60-bdc7c115d519'),
('71852987278236', 'Nguyễn Thanh Danh', 'danh@gmail.com', '0932528331', '51A9 Đường Trần Nam Phú, Phường An Khánh, Quận Ninh Kiều, Thành Phố Cần Thơ', 957000, 20000, 977000, '8d097ddc-c9a2-4c0a-8e60-bdc7c115d519');

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `product_variant_id`, `order_item_index`, `price`, `quantity`, `total_value`) VALUES
('71828451735555', 4, 0, 179000, 1, 179000),
('71828451735555', 8, 1, 179000, 1, 179000),
('71828451735555', 22, 2, 599000, 1, 599000),
('71828456877430', 3, 0, 179000, 2, 358000),
('71828456877430', 22, 1, 599000, 1, 599000),
('71828458724551', 13, 0, 179000, 1, 179000),
('71828458724551', 19, 1, 599000, 1, 599000),
('71852912157786', 3, 0, 179000, 2, 358000),
('71852912157786', 19, 1, 599000, 1, 599000),
('71852912205857', 3, 0, 179000, 2, 358000),
('71852912205857', 19, 1, 599000, 1, 599000),
('71852912226347', 3, 0, 179000, 2, 358000),
('71852912226347', 19, 1, 599000, 1, 599000),
('71852987268026', 3, 0, 179000, 2, 358000),
('71852987268026', 19, 1, 599000, 1, 599000),
('71852987278236', 3, 0, 179000, 2, 358000),
('71852987278236', 19, 1, 599000, 1, 599000);

--
-- Dumping data for table `order_status_change_histories`
--

INSERT INTO `order_status_change_histories` (`order_id`, `state_id`, `created_at`) VALUES
('71828451735555', 1, '2023-03-25 01:43:36'),
('71828451735555', 2, '2023-03-25 01:49:27'),
('71828451735555', 3, '2023-03-25 01:49:36'),
('71828451735555', 4, '2023-03-25 01:49:45'),
('71828456877430', 1, '2023-03-25 01:41:11'),
('71828456877430', 2, '2023-03-25 01:49:22'),
('71828456877430', 3, '2023-03-25 01:49:34'),
('71828456877430', 4, '2023-03-25 01:49:43'),
('71828458724551', 1, '2023-03-25 01:45:19'),
('71828458724551', 2, '2023-03-25 01:49:30'),
('71828458724551', 3, '2023-03-25 01:49:38'),
('71828458724551', 4, '2023-03-25 01:49:47'),
('71852912157786', 1, '2023-03-16 03:22:48'),
('71852912205857', 1, '2023-03-16 03:23:13'),
('71852912205857', 2, '2023-03-19 02:13:45'),
('71852912226347', 1, '2023-03-16 03:23:19'),
('71852912226347', 2, '2023-03-19 03:08:52'),
('71852912226347', 3, '2023-03-19 03:12:13'),
('71852987268026', 1, '2023-03-16 03:26:34'),
('71852987268026', 2, '2023-03-19 03:31:15'),
('71852987268026', 5, '2023-03-19 03:31:42'),
('71852987278236', 1, '2023-03-16 03:26:32'),
('71852987278236', 2, '2023-03-19 03:34:33'),
('71852987278236', 3, '2023-03-19 03:34:42'),
('71852987278236', 6, '2023-03-19 03:56:06');

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`feedback_id`, `rate`, `content`, `user_id`, `product_variant_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'áo xấu quá!!!', 'e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0', 3, '2023-04-07 04:22:39', '2023-04-07 04:22:39'),
(2, 2, 'áo quá rộng', 'e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0', 4, '2023-04-07 04:23:24', '2023-04-07 04:23:24'),
(3, 5, 'áo đẹp', 'e1e3af7e-5ea7-4f6d-b488-0feb60d8e5c0', 8, '2023-04-07 04:23:46', '2023-04-07 04:23:46');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
