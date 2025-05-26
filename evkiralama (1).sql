-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 May 2025, 18:52:34
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `evkiralama`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(150) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'False',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title`, `keywords`, `description`, `image`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Daire', 'daire', 'daire', NULL, 'kiralik-daire', 'true', NULL, NULL),
(2, 0, 'Residence', 'Residence', 'Residence', NULL, 'residence', 'true', NULL, NULL),
(3, 0, 'Müstakil Ev', 'Müstakil Ev', 'Müstakil Ev', NULL, 'mustakil-ev', 'true', NULL, NULL),
(4, 0, 'Villa', 'Villa', 'Villa', NULL, 'villa', 'true', NULL, NULL),
(6, 0, 'Apartman', 'apartman', 'apartman', NULL, 'apartman', 'true', NULL, NULL),
(7, 0, 'Yazlık', 'yazlik ev', 'Yazlık ev', NULL, 'yazlik', 'false', NULL, '2025-05-25 12:43:13');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `status` varchar(5) NOT NULL DEFAULT 'False',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `position`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Siteye Nasıl Kaydolurum?', '<p><em><strong>REGISTER KISMINDAN KAYDOLABİLİRSİNİZ..</strong></em></p>', 1, 'true', '2021-01-24 08:23:26', '2021-01-24 08:24:56'),
(2, 'Nasıl İlan ekleyebilirim?', '<p><em><strong>İLAN EKLE BUTONUNDAN TIKLAYABİLİRSİNİZ...</strong></em></p>', 2, 'true', '2021-01-24 08:24:18', '2021-01-24 08:24:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `filemanager`
--

CREATE TABLE `filemanager` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `ext` varchar(4) NOT NULL,
  `file_size` double(8,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `absolute_url` varchar(255) NOT NULL,
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`extra`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `houses`
--

CREATE TABLE `houses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(75) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `metrekare` int(11) DEFAULT NULL,
  `isitma` varchar(255) DEFAULT NULL,
  `odasayisi` int(11) DEFAULT NULL,
  `katsayisi` int(11) DEFAULT NULL,
  `esya` varchar(255) DEFAULT NULL,
  `binayasi` int(11) DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `aidat` double(8,2) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `status` varchar(5) DEFAULT 'False',
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `houses`
--

INSERT INTO `houses` (`id`, `title`, `keywords`, `description`, `image`, `category_id`, `user_id`, `address`, `phone`, `metrekare`, `isitma`, `odasayisi`, `katsayisi`, `esya`, `binayasi`, `price`, `aidat`, `detail`, `slug`, `status`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'Bahçelievler metrobüse 5 dk kiralık 3+1 dublex daire', 'Bahçelievler metrobüse 5 dk kiralık 3+1 dublex daire', 'Bahçelievler metrobüse 5 dk kiralık 3+1 dublex daire', 'images/notYfhw1nsNpd7140IiMITm2GjszcCzsDS3q5Cmb.webp', 1, 1, 'İstanbul - Bahçelievler - Bahçelievler Mahallesi', '08601213252', 140, 'Doğalgaz', 4, 2, 'Eşyasız', 2, 67000.00, 100.00, '<p>İlan Bilgileri</p>\r\n\r\n<p>İlan Numarası</p>\r\n\r\n<p>10450301</p>\r\n\r\n<p>İlan G&uuml;ncelleme Tarihi</p>\r\n\r\n<p>30 Aralık 2021</p>\r\n\r\n<p>Kategorisi</p>\r\n\r\n<p>Kiralık</p>\r\n\r\n<p>Br&uuml;t Metrekare</p>\r\n\r\n<p>140 M2</p>\r\n\r\n<p>Binanın Yaşı</p>\r\n\r\n<p>5-10</p>\r\n\r\n<p>Binanın Kat Sayısı</p>\r\n\r\n<p>5</p>\r\n\r\n<p>Kullanım Durumu</p>\r\n\r\n<p>Boş</p>\r\n\r\n<p>Yapı Tipi</p>\r\n\r\n<p>Betonarme</p>\r\n\r\n<p>Eşya Durumu</p>\r\n\r\n<p>Eşyalı</p>\r\n\r\n<p>Depozito</p>\r\n\r\n<p>2 TL</p>\r\n\r\n<p>Banyo Sayısı</p>\r\n\r\n<p>2</p>\r\n\r\n<p>Fiyat Durumu</p>\r\n\r\n<p>Birim Fiyat</p>\r\n\r\n<p>İlan Oluşturma Tarihi</p>\r\n\r\n<p>30 Aralık 2021</p>\r\n\r\n<p>T&uuml;r&uuml;</p>\r\n\r\n<p>Konut</p>\r\n\r\n<p>Net Metrekare</p>\r\n\r\n<p>130 M2</p>\r\n\r\n<p>Oda Sayısı</p>\r\n\r\n<p>3+1</p>\r\n\r\n<p>Bulunduğu Kat</p>\r\n\r\n<p>&Ccedil;atı Dubleks</p>\r\n\r\n<p>Isıtma Tipi</p>\r\n\r\n<p>Kombi Doğalgaz</p>\r\n\r\n<p>Yapı Durumu</p>\r\n\r\n<p>İkinci El</p>\r\n\r\n<p>Site İ&ccedil;erisinde</p>\r\n\r\n<p>Hayır</p>\r\n\r\n<p>Aidat</p>\r\n\r\n<p>100 TL</p>\r\n\r\n<p>Takas</p>\r\n\r\n<p>Yok</p>\r\n\r\n<p>WC Sayısı</p>\r\n\r\n<p>2</p>\r\n\r\n<p>G&ouml;r&uuml;nt&uuml;l&uuml; Gezilebilir Mi?</p>\r\n\r\n<p>Hayır</p>\r\n\r\n<p>Daha Fazla G&ouml;ster</p>\r\n\r\n<p>İlan A&ccedil;ıklaması</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>YABANCIYA UYGUN !!!!!!!!!!!!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>BAH&Ccedil;ELİEVLERDE METROB&Uuml;SE Y&Uuml;R&Uuml;ME MESAFESİ 5 DK&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>MERKEZİ KONUMDA</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>OKUL HASTANE RESTORANLAR VE DİĞER TOPLU ULAŞIMLARIN MERKEZİNDE</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>3+1 DUBLEX</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>MANZARALI VE GENİŞ TERASLI</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ASANS&Ouml;RL&Uuml;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>DETAYLI BİLGİ VE SUNUM İ&Ccedil;İN ARAYIN!!!!!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>İlan &Ouml;zellikleri</p>\r\n\r\n<p>İ&ccedil; &Ouml;zellikler</p>\r\n\r\n<p><em>done</em>Kiler</p>\r\n\r\n<p><em>done</em>Dolaplı Mutfak</p>\r\n\r\n<p><em>done</em>Hazır Mutfak</p>\r\n\r\n<p><em>done</em>Mutfak Mobilyası</p>\r\n\r\n<p><em>done</em>Bulaşık Makinesi</p>\r\n\r\n<p><em>done</em>Marley</p>\r\n\r\n<p><em>done</em>Set&uuml;st&uuml; Ocak</p>\r\n\r\n<p><em>done</em>Ocak Doğalgazı</p>\r\n\r\n<p><em>done</em>Fırın</p>\r\n\r\n<p><em>done</em>Ankastre Mutfak</p>\r\n\r\n<p><em>done</em>Laminant Mutfak</p>\r\n\r\n<p><em>done</em>Sıcak Su</p>\r\n\r\n<p><em>done</em>Duşakabinli</p>\r\n\r\n<p><em>done</em>&Ccedil;amaşır Makinesi</p>\r\n\r\n<p><em>done</em>Ebeveyn Banyo</p>\r\n\r\n<p><em>done</em>Kartonpiyer</p>\r\n\r\n<p><em>done</em>Giyinme Odası</p>\r\n\r\n<p><em>done</em>&Ccedil;elik Kapı</p>\r\n\r\n<p><em>done</em>Parke</p>\r\n\r\n<p><em>done</em>Spot Işık</p>\r\n\r\n<p><em>done</em>&Ccedil;amaşır Odası</p>\r\n\r\n<p><em>done</em>Y&uuml;ksek Tavan</p>\r\n\r\n<p><em>done</em>Beyaz Eşya</p>\r\n\r\n<p><em>done</em>Laminant</p>\r\n\r\n<p><em>done</em>Wi-Fi</p>\r\n\r\n<p><em>done</em>Intercom</p>\r\n\r\n<p><em>done</em>Kablo TV - Uydu</p>\r\n\r\n<p><em>done</em>ADSL</p>\r\n\r\n<p><em>done</em>Fiber</p>\r\n\r\n<p>Dış &Ouml;zellikler</p>\r\n\r\n<p><em>done</em>G&uuml;ney Cepheli</p>\r\n\r\n<p><em>done</em>Doğu Cepheli</p>\r\n\r\n<p><em>done</em>Engelliye Uygun</p>\r\n\r\n<p><em>done</em>A&ccedil;ık Otopark</p>\r\n\r\n<p><em>done</em>Ş&ouml;mine</p>\r\n\r\n<p><em>done</em>Asans&ouml;r</p>\r\n\r\n<p><em>done</em>Ses Yalıtımı</p>\r\n\r\n<p><em>done</em>G&ouml;r&uuml;nt&uuml;l&uuml; Diafon</p>\r\n\r\n<p><em>done</em>Isıcam</p>\r\n\r\n<p><em>done</em>Apartman G&ouml;revlisi</p>\r\n\r\n<p>Konum &Ouml;zellikleri</p>\r\n\r\n<p><em>done</em>Dolmuş</p>\r\n\r\n<p><em>done</em>Okula Yakın</p>\r\n\r\n<p><em>done</em>Anayol</p>\r\n\r\n<p><em>done</em>E-5</p>\r\n\r\n<p><em>done</em>Minib&uuml;s</p>\r\n\r\n<p><em>done</em>Otob&uuml;s</p>\r\n\r\n<p><em>done</em>Hastaneye Yakın</p>\r\n\r\n<p><em>done</em>Metrob&uuml;s</p>\r\n\r\n<p><em>done</em>Otoban</p>\r\n\r\n<p><em>done</em>Caddeye Yakın</p>\r\n\r\n<p><em>done</em>Şehir Manzaralı</p>\r\n\r\n<p>Yakınında Neler Var?</p>\r\n\r\n<p><img alt=\"Tüm Kategoriler\" src=\"https://www.emlakjet.com/static/img/near-locations/all.svg\" style=\"height:22px; width:22px\" />T&uuml;m Kategoriler<img alt=\"Ulaşım\" src=\"https://www.emlakjet.com/static/img/near-locations/transport-w@3x.png\" style=\"height:22px; width:22px\" />Ulaşım<img alt=\"Okullar\" src=\"https://www.emlakjet.com/static/img/near-locations/education.svg\" style=\"height:22px; width:22px\" />Okullar<img alt=\"Marketler\" src=\"https://www.emlakjet.com/static/img/near-locations/market.svg\" style=\"height:22px; width:22px\" />Marketler<img alt=\"Kafe/Restoranlar\" src=\"https://www.emlakjet.com/static/img/near-locations/restaurant.svg\" style=\"height:22px; width:22px\" />Kafe/Restoranlar<img alt=\"Sağlık Kurumları\" src=\"https://www.emlakjet.com/static/img/near-locations/hospital.svg\" style=\"height:22px; width:22px\" />Sağlık Kurumları</p>\r\n\r\n<p>İETT Bah&ccedil;elievler Metrob&uuml;s Durağı299.8 m<em>chevron_right</em></p>\r\n\r\n<p>M1A - Bah&ccedil;elievler Asans&ouml;r299.9 m<em>chevron_right</em></p>\r\n\r\n<p>M1A - Bah&ccedil;elievler Metro İstasyonu401.1 m<em>chevron_right</em></p>', 'bahcelievler-metrobuse-5-dk-kiralik-31-dublex-daire-10450301', 'true', NULL, NULL, '2021-12-30 07:15:19', '2025-05-25 04:08:59'),
(9, 'TEB\'TEN TARABYA VADİ KONAKLARI BÜYÜK BAHÇE KATI 2+1', 'TEB\'TEN TARABYA VADİ KONAKLARI BÜYÜK BAHÇE KATI 2+1', 'TEB\'TEN TARABYA VADİ KONAKLARI BÜYÜK BAHÇE KATI 2+1', 'images/rd9ONxusX9fqlAz6fosf1yfxkEazDwihIHewm6eb.jpg', 1, 1, 'İstanbul Sarıyer Ferahevler', '555555555', 24, 'Doğalgaz', 6, 5, 'Eşyasız', 1, 50000.00, 500.00, '<ul>\r\n	<li>İstanbul</li>\r\n	<li>Sarıyer</li>\r\n	<li>Ferahevler</li>\r\n	<li>Kiralık</li>\r\n	<li>Daire</li>\r\n	<li>2 + 1</li>\r\n	<li>90 m2</li>\r\n</ul>\r\n\r\n<p>İlan Bilgileri</p>\r\n\r\n<ul>\r\n	<li>İlan no125623-39</li>\r\n	<li>Son G&uuml;ncelleme Tarihi6 G&uuml;n &Ouml;nce</li>\r\n	<li>İlan DurumuKiralık</li>\r\n	<li>Konut ŞekliDaire</li>\r\n	<li>Oda + Salon Sayısı2 + 1</li>\r\n	<li>Br&uuml;t / Net M290 m2/ 75 m2</li>\r\n	<li>Bulunduğu KatBah&ccedil;e Katı</li>\r\n	<li>Bina YaşıSıfır Bina</li>\r\n	<li>Isınma TipiKombi</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Kat Sayısı5 Katlı</li>\r\n	<li>Eşya DurumuEşyalı Değil</li>\r\n	<li>Banyo Sayısı1</li>\r\n	<li>Yapı TipiBetonarme</li>\r\n	<li>Yapının DurumuSıfır</li>\r\n	<li>Kullanım DurumuBoş</li>\r\n	<li>CepheKuzey, G&uuml;ney, Doğu, Batı</li>\r\n	<li>Yakıt TipiDoğalgaz</li>\r\n	<li>Yetkili OfisEvet</li>\r\n</ul>\r\n\r\n<p>İlan A&ccedil;ıklaması</p>\r\n\r\n<p>DAİRE B&Uuml;Y&Uuml;K VE L ŞEKLINDE BAH&Ccedil;EYE SAHİPTİR.</p>\r\n\r\n<p>SIFIR 3. ETAP<br />\r\n24 SAAT G&Uuml;VENLİK<br />\r\nY&Uuml;ZME HAVUZU, SAUNA, FİTNES, HAMAM<br />\r\n&Ccedil;OCUK OYUN PARKI<br />\r\nA&Ccedil;IK VE KAPALI OTOPARK</p>\r\n\r\n<p>RANDEVU VE BİLGİ İ&Ccedil;İN<br />\r\nT&Uuml;RKİYE EMLAK&Ccedil;ILAR BİRLİĞİ</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>İ&ccedil; &Ouml;zellikler</p>\r\n\r\n<ul>\r\n	<li>ADSL</li>\r\n	<li>Ahşap Doğrama</li>\r\n	<li>Alarm</li>\r\n	<li>Ankastre Mutfak</li>\r\n	<li>Balkon</li>\r\n	<li>Beyaz Eşyalı</li>\r\n	<li>&Ccedil;amaşır Odası</li>\r\n	<li>&Ccedil;elik Kapı</li>\r\n	<li>Duşakabin</li>\r\n	<li>G&ouml;mme Dolap</li>\r\n	<li>G&ouml;r&uuml;nt&uuml;l&uuml; Diafon</li>\r\n	<li>Hilton Banyo</li>\r\n	<li>Isıcam</li>\r\n	<li>Kablo TV-Uydu</li>\r\n	<li>Kartonpiyer</li>\r\n	<li>Klima</li>\r\n	<li>Mutfak Doğalgazı</li>\r\n	<li>Panel Kapı</li>\r\n	<li>Parke</li>\r\n	<li>Parke - Laminant</li>\r\n	<li>Parke - Lamine</li>\r\n	<li>Saten Al&ccedil;ı</li>\r\n	<li>Saten Boya</li>\r\n	<li>Sauna</li>\r\n	<li>Spot Işık</li>\r\n	<li>Vestiyer</li>\r\n	<li>Yerden Isıtma</li>\r\n</ul>\r\n\r\n<p>Dış &Ouml;zellikler</p>\r\n\r\n<ul>\r\n	<li>Ahşap Doğrama</li>\r\n	<li>Asans&ouml;r</li>\r\n	<li>Bah&ccedil;eli</li>\r\n	<li>Fitness</li>\r\n	<li>G&uuml;venlik</li>\r\n	<li>Hidrofor</li>\r\n	<li>Isı Yalıtım</li>\r\n	<li>Jenerat&ouml;r</li>\r\n	<li>Otopark - A&ccedil;ık</li>\r\n	<li>Otopark - Kapalı</li>\r\n	<li>Oyun Parkı</li>\r\n	<li>PVC Doğrama</li>\r\n	<li>Site i&ccedil;erisinde</li>\r\n	<li>Su deposu</li>\r\n	<li>Yangın Merdiveni</li>\r\n	<li>Y&uuml;zme Havuzu</li>\r\n</ul>\r\n\r\n<p>Konum</p>\r\n\r\n<ul>\r\n	<li>Boğaz k&ouml;pr&uuml;lerine yakın</li>\r\n	<li>Cadde &Uuml;zerinde</li>\r\n	<li>Caddeye yakın</li>\r\n	<li>Deniz Ulaşımına yakın</li>\r\n	<li>Denize yakın</li>\r\n	<li>E-5&#39;e yakın</li>\r\n	<li>Manzara</li>\r\n	<li>Manzara - Boğaz</li>\r\n	<li>Manzara - Doğa</li>\r\n	<li>Manzara - Şehir</li>\r\n	<li>Merkezde</li>\r\n	<li>Metroya yakın</li>\r\n	<li>Minib&uuml;s / Dolmuşa yakın</li>\r\n	<li>Otobana yakın</li>\r\n	<li>&Ouml;n cephe</li>\r\n	<li>TEM&#39;e yakın</li>\r\n	<li>Toplu Ulaşıma yakın</li>\r\n</ul>', 'istanbul-sariyer-ferahevler-kiralik', 'true', NULL, NULL, '2022-01-02 11:40:47', '2025-05-25 04:08:33'),
(10, 'Ulus Prestijli Binada Lüx 3+1 Asansörlü Otoparklı', 'Ulus Prestijli Binada Lüx 3+1 Asansörlü Otoparklı', 'Ulus Prestijli Binada Lüx 3+1 Asansörlü Otoparklı', 'images/cNASLTO7kNvFUktuKO6byBHoQCGAnHPG2YrYPLnd.jpg', 1, 1, 'İstanbul Beşiktaş Ulus Kiralık', '46456456456', 54, 'Doğalgaz', 5, 2, 'Eşyalı', 5, 65000.00, 500.00, '<p>İlan Bilgileri</p>\r\n\r\n<ul>\r\n	<li>İlan no2600-17025</li>\r\n	<li>Son G&uuml;ncelleme Tarihi4 G&uuml;n &Ouml;nce</li>\r\n	<li>İlan DurumuKiralık</li>\r\n	<li>Konut ŞekliDaire</li>\r\n	<li>Oda + Salon Sayısı3 + 1</li>\r\n	<li>Br&uuml;t / Net M2170 m2/ 150 m2</li>\r\n	<li>Bulunduğu Kat3. Kat</li>\r\n	<li>Bina Yaşı7 Yaşında</li>\r\n	<li>Isınma TipiMerkezi (Pay &Ouml;l&ccedil;er)</li>\r\n	<li>Kat Sayısı5 Katlı</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Eşya DurumuEşyalı Değil</li>\r\n	<li>Banyo Sayısı2</li>\r\n	<li>Yapı TipiBetonarme</li>\r\n	<li>Yapının DurumuSıfır</li>\r\n	<li>Kullanım DurumuBoş</li>\r\n	<li>Aidat1 TL</li>\r\n	<li>CepheG&uuml;ney, Doğu, Batı</li>\r\n	<li>Depozito1 TL</li>\r\n	<li>Yakıt TipiDoğalgaz</li>\r\n	<li>Yetkili OfisEvet</li>\r\n</ul>\r\n\r\n<p>İlan A&ccedil;ıklaması</p>\r\n\r\n<p>Ulus Prestijli Binada L&uuml;x 3+1 Asans&ouml;rl&uuml; Otoparklı daire<br />\r\nDetaylı bilgi ve randevu i&ccedil;in bizi arayınız...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>İ&ccedil; &Ouml;zellikler</p>\r\n\r\n<ul>\r\n	<li>ADSL</li>\r\n	<li>Balkon</li>\r\n	<li>Beyaz Eşyalı</li>\r\n	<li>&Ccedil;amaşır Odası</li>\r\n	<li>&Ccedil;elik Kapı</li>\r\n	<li>Duşakabin</li>\r\n	<li>Duvar Kağıdı</li>\r\n	<li>Ebeveyn Banyolu</li>\r\n	<li>Giyinme Odası</li>\r\n	<li>G&ouml;mme Dolap</li>\r\n	<li>G&ouml;r&uuml;nt&uuml;l&uuml; Diafon</li>\r\n	<li>Hazır Mutfak</li>\r\n	<li>Hilton Banyo</li>\r\n	<li>Isıcam</li>\r\n	<li>Jakuzi</li>\r\n	<li>Kablo TV-Uydu</li>\r\n	<li>Kapalı Balkon</li>\r\n	<li>Kartonpiyer</li>\r\n	<li>Klima</li>\r\n	<li>Panjur</li>\r\n	<li>Parke</li>\r\n	<li>Parke - Lamine</li>\r\n	<li>Saten Al&ccedil;ı</li>\r\n	<li>Saten Boya</li>\r\n	<li>Spot Işık</li>\r\n	<li>Ş&ouml;mine</li>\r\n	<li>Teras</li>\r\n	<li>Vestiyer</li>\r\n	<li>Yerden Isıtma</li>\r\n</ul>\r\n\r\n<p>Dış &Ouml;zellikler</p>\r\n\r\n<ul>\r\n	<li>Ahşap Doğrama</li>\r\n	<li>Asans&ouml;r</li>\r\n	<li>Bah&ccedil;eli</li>\r\n	<li>G&uuml;venlik</li>\r\n	<li>Hidrofor</li>\r\n	<li>Jenerat&ouml;r</li>\r\n	<li>Kapıcı</li>\r\n	<li>Otopark - A&ccedil;ık</li>\r\n	<li>Oyun Parkı</li>\r\n	<li>Site i&ccedil;erisinde</li>\r\n	<li>Su deposu</li>\r\n	<li>Tenis Kortu</li>\r\n	<li>Yangın Merdiveni</li>\r\n	<li>Y&uuml;zme Havuzu</li>\r\n</ul>\r\n\r\n<p>Konum</p>\r\n\r\n<ul>\r\n	<li>Cadde &Uuml;zerinde</li>\r\n	<li>Caddeye yakın</li>\r\n	<li>Deniz Ulaşımına yakın</li>\r\n	<li>Manzara - Deniz</li>\r\n	<li>Manzara - Doğa</li>\r\n	<li>Manzara - Şehir</li>\r\n	<li>Merkezde</li>\r\n	<li>Metroya yakın</li>\r\n	<li>&Ouml;n cephe</li>\r\n	<li>Toplu Ulaşıma yakın</li>\r\n</ul>', 'istanbul-besiktas-ulus-kiralik', 'true', 40.9177360, 29.2998720, '2022-01-02 11:45:13', '2025-05-25 06:35:56'),
(11, 'Emlak İlanı 1', 'ev, ilan 1, kiralık', 'Bu 1 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Antalya - Merkez Mah.', '05911251008', 110, 'Doğalgaz', 2, 6, 'Eşyalı', 14, 35370.00, 668.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-1-l7rys', 'true', 39.7022790, 27.0042490, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(12, 'Emlak İlanı 2', 'ev, ilan 2, kiralık', 'Bu 2 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Bursa - Merkez Mah.', '05281985215', 111, 'Soba', 3, 9, 'Eşyasız', 19, 69385.00, 480.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-2-s4mvx', 'true', 39.7755470, 28.2107250, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(13, 'Emlak İlanı 3', 'ev, ilan 3, kiralık', 'Bu 3 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Ankara - Merkez Mah.', '05145268101', 93, 'Merkezi', 5, 6, 'Eşyasız', 10, 105605.00, 84.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-3-xapzn', 'true', 40.4058630, 29.1116650, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(14, 'Emlak İlanı 4', 'ev, ilan 4, kiralık', 'Bu 4 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'İstanbul - Merkez Mah.', '05779584403', 68, 'Soba', 5, 10, 'Eşyasız', 10, 83942.00, 298.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-4-ncpzx', 'true', 38.4856510, 28.7970690, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(15, 'Emlak İlanı 5', 'ev, ilan 5, kiralık', 'Bu 5 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Antalya - Merkez Mah.', '05601437180', 149, 'Doğalgaz', 4, 5, 'Eşyasız', 19, 46607.00, 935.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-5-ag3aa', 'true', 41.0754100, 28.4820140, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(16, 'Emlak İlanı 6', 'ev, ilan 6, kiralık', 'Bu 6 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Bursa - Merkez Mah.', '05556803668', 83, 'Merkezi', 1, 4, 'Eşyasız', 5, 51330.00, 92.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-6-sael2', 'true', 39.6579880, 28.0530200, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(17, 'Emlak İlanı 7', 'ev, ilan 7, kiralık', 'Bu 7 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Eskişehir - Merkez Mah.', '05530579883', 55, 'Klima', 3, 5, 'Eşyasız', 13, 79954.00, 638.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-7-lohfd', 'true', 40.6576800, 29.1210960, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(18, 'Emlak İlanı 8', 'ev, ilan 8, kiralık', 'Bu 8 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Ankara - Merkez Mah.', '05949200460', 200, 'Doğalgaz', 3, 2, 'Eşyasız', 19, 116739.00, 379.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-8-vkqpy', 'true', 41.7616780, 27.3147680, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(19, 'Emlak İlanı 9', 'ev, ilan 9, kiralık', 'Bu 9 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Ankara - Merkez Mah.', '05538138062', 172, 'Klima', 5, 2, 'Eşyasız', 1, 31722.00, 132.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-9-3vfbb', 'true', 39.0226730, 28.0459040, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(20, 'Emlak İlanı 10', 'ev, ilan 10, kiralık', 'Bu 10 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Ankara - Merkez Mah.', '05552489083', 200, 'Klima', 2, 10, 'Eşyalı', 5, 140071.00, 439.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-10-mruah', 'true', 41.8120920, 27.5556330, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(21, 'Emlak İlanı 11', 'ev, ilan 11, kiralık', 'Bu 11 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Antalya - Merkez Mah.', '05963297217', 118, 'Soba', 1, 6, 'Eşyalı', 4, 31929.00, 934.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-11-uctz7', 'true', 41.2895810, 27.9391280, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(22, 'Emlak İlanı 12', 'ev, ilan 12, kiralık', 'Bu 12 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Ankara - Merkez Mah.', '05770620350', 98, 'Soba', 4, 8, 'Eşyalı', 18, 95853.00, 701.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-12-pzupp', 'true', 38.8728640, 28.8665140, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(23, 'Emlak İlanı 13', 'ev, ilan 13, kiralık', 'Bu 13 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Eskişehir - Merkez Mah.', '05359504065', 196, 'Soba', 2, 1, 'Eşyasız', 18, 74903.00, 17.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-13-kiyw8', 'true', 40.7608370, 28.8134730, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(24, 'Emlak İlanı 14', 'ev, ilan 14, kiralık', 'Bu 14 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Bursa - Merkez Mah.', '05297072164', 92, 'Klima', 4, 7, 'Eşyasız', 2, 85046.00, 186.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-14-iklmw', 'true', 40.0334540, 29.4414940, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(25, 'Emlak İlanı 15', 'ev, ilan 15, kiralık', 'Bu 15 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Eskişehir - Merkez Mah.', '05326604341', 167, 'Klima', 2, 4, 'Eşyalı', 3, 33951.00, 843.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-15-4vp3x', 'true', 41.3604270, 27.3254100, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(26, 'Emlak İlanı 16', 'ev, ilan 16, kiralık', 'Bu 16 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'İzmir - Merkez Mah.', '05769672588', 169, 'Merkezi', 5, 6, 'Eşyasız', 5, 38593.00, 303.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-16-icjjl', 'true', 40.3786980, 29.2176460, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(27, 'Emlak İlanı 17', 'ev, ilan 17, kiralık', 'Bu 17 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'İstanbul - Merkez Mah.', '05463591176', 162, 'Soba', 1, 3, 'Eşyasız', 18, 36872.00, 959.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-17-psehe', 'true', 41.4696250, 29.4563790, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(28, 'Emlak İlanı 18', 'ev, ilan 18, kiralık', 'Bu 18 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Antalya - Merkez Mah.', '05633249875', 86, 'Doğalgaz', 5, 1, 'Eşyalı', 8, 143694.00, 638.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-18-fuy8w', 'true', 38.3641030, 29.5819210, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(29, 'Emlak İlanı 19', 'ev, ilan 19, kiralık', 'Bu 19 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'İzmir - Merkez Mah.', '05566573390', 120, 'Merkezi', 3, 10, 'Eşyasız', 14, 92164.00, 417.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-19-lftdd', 'true', 39.1636200, 29.4377390, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(30, 'Emlak İlanı 20', 'ev, ilan 20, kiralık', 'Bu 20 numaralı emlak ilanıdır.', 'images/demo.jpg', 2, 1, 'Ankara - Merkez Mah.', '05563836173', 48, 'Doğalgaz', 4, 3, 'Eşyasız', 1, 33212.00, 207.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-20-nbofy', 'true', 38.9490330, 29.6335660, '2025-05-25 06:48:45', '2025-05-25 06:48:45'),
(31, 'Emlak İlanı 1', 'ev, ilan 1, kiralık', 'Bu 1 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'İzmir - Merkez Mah.', '05100348029', 134, 'Doğalgaz', 2, 10, 'Eşyalı', 9, 149775.00, 569.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-1-ocg2q', 'true', 41.6482780, 29.7267520, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(32, 'Emlak İlanı 2', 'ev, ilan 2, kiralık', 'Bu 2 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Ankara - Merkez Mah.', '05723518683', 107, 'Merkezi', 3, 5, 'Eşyasız', 3, 80077.00, 994.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-2-tbdha', 'true', 41.8031350, 29.1213240, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(33, 'Emlak İlanı 3', 'ev, ilan 3, kiralık', 'Bu 3 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Bursa - Merkez Mah.', '05768643742', 116, 'Klima', 1, 4, 'Eşyalı', 18, 90476.00, 626.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-3-78xar', 'true', 38.2227540, 28.1941640, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(34, 'Emlak İlanı 4', 'ev, ilan 4, kiralık', 'Bu 4 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Eskişehir - Merkez Mah.', '05137508879', 129, 'Klima', 1, 5, 'Eşyasız', 15, 116972.00, 90.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-4-ictij', 'true', 38.8700530, 27.8490420, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(35, 'Emlak İlanı 5', 'ev, ilan 5, kiralık', 'Bu 5 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'İstanbul - Merkez Mah.', '05712859412', 156, 'Soba', 1, 2, 'Eşyalı', 8, 47940.00, 707.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-5-gl6ci', 'true', 41.2984960, 27.6628960, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(36, 'Emlak İlanı 6', 'ev, ilan 6, kiralık', 'Bu 6 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Eskişehir - Merkez Mah.', '05350986602', 108, 'Doğalgaz', 4, 8, 'Eşyalı', 13, 134429.00, 188.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-6-s64xa', 'true', 41.1984890, 28.7979910, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(37, 'Emlak İlanı 7', 'ev, ilan 7, kiralık', 'Bu 7 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'İzmir - Merkez Mah.', '05230195944', 50, 'Doğalgaz', 2, 2, 'Eşyalı', 9, 142261.00, 686.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-7-pcgds', 'true', 40.4460750, 27.6389020, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(38, 'Emlak İlanı 8', 'ev, ilan 8, kiralık', 'Bu 8 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Ankara - Merkez Mah.', '05139863498', 119, 'Klima', 4, 4, 'Eşyasız', 18, 49170.00, 754.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-8-4kxzw', 'true', 41.9479610, 28.1233600, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(39, 'Emlak İlanı 9', 'ev, ilan 9, kiralık', 'Bu 9 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Eskişehir - Merkez Mah.', '05934176097', 176, 'Doğalgaz', 1, 10, 'Eşyasız', 15, 136368.00, 809.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-9-lrwci', 'true', 39.4330560, 29.0776190, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(40, 'Emlak İlanı 10', 'ev, ilan 10, kiralık', 'Bu 10 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Eskişehir - Merkez Mah.', '05962826318', 60, 'Doğalgaz', 2, 5, 'Eşyalı', 14, 55500.00, 480.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-10-4eifa', 'true', 41.3980010, 28.9996850, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(41, 'Emlak İlanı 11', 'ev, ilan 11, kiralık', 'Bu 11 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Antalya - Merkez Mah.', '05401770215', 168, 'Doğalgaz', 4, 4, 'Eşyalı', 3, 25353.00, 260.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-11-grtht', 'true', 41.9144980, 27.6605220, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(42, 'Emlak İlanı 12', 'ev, ilan 12, kiralık', 'Bu 12 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Bursa - Merkez Mah.', '05211154060', 173, 'Klima', 2, 8, 'Eşyalı', 12, 8145.00, 378.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-12-qjgyz', 'true', 41.9437480, 27.4594850, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(43, 'Emlak İlanı 13', 'ev, ilan 13, kiralık', 'Bu 13 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'İzmir - Merkez Mah.', '05814019200', 180, 'Klima', 4, 10, 'Eşyalı', 3, 5272.00, 344.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-13-ftmav', 'true', 41.9124170, 28.3420850, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(44, 'Emlak İlanı 14', 'ev, ilan 14, kiralık', 'Bu 14 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'İstanbul - Merkez Mah.', '05462129751', 153, 'Klima', 4, 9, 'Eşyasız', 5, 41783.00, 613.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-14-qzeiy', 'true', 40.6877350, 28.9860310, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(45, 'Emlak İlanı 15', 'ev, ilan 15, kiralık', 'Bu 15 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Ankara - Merkez Mah.', '05206839594', 53, 'Klima', 2, 7, 'Eşyalı', 4, 5612.00, 296.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-15-twi04', 'true', 41.2904760, 29.6040350, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(46, 'Emlak İlanı 16', 'ev, ilan 16, kiralık', 'Bu 16 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Antalya - Merkez Mah.', '05555703161', 177, 'Doğalgaz', 4, 6, 'Eşyalı', 11, 6330.00, 629.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-16-pn565', 'true', 39.7277950, 27.6408560, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(47, 'Emlak İlanı 17', 'ev, ilan 17, kiralık', 'Bu 17 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Eskişehir - Merkez Mah.', '05909546967', 191, 'Merkezi', 4, 2, 'Eşyalı', 7, 22264.00, 286.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-17-65yhy', 'true', 41.6523700, 27.8467360, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(48, 'Emlak İlanı 18', 'ev, ilan 18, kiralık', 'Bu 18 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'İzmir - Merkez Mah.', '05395845245', 107, 'Klima', 3, 3, 'Eşyasız', 17, 133614.00, 515.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-18-trd62', 'true', 40.2937300, 29.7428400, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(49, 'Emlak İlanı 19', 'ev, ilan 19, kiralık', 'Bu 19 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'İzmir - Merkez Mah.', '05946137369', 69, 'Klima', 4, 5, 'Eşyalı', 8, 130483.00, 328.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-19-tjrgi', 'true', 40.0968960, 27.4561180, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(50, 'Emlak İlanı 20', 'ev, ilan 20, kiralık', 'Bu 20 numaralı emlak ilanıdır.', 'images/demo.jpg', 3, 1, 'Antalya - Merkez Mah.', '05537127846', 150, 'Doğalgaz', 2, 4, 'Eşyalı', 2, 131228.00, 991.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-20-536ek', 'true', 40.2010430, 27.9613120, '2025-05-25 06:49:10', '2025-05-25 06:49:10'),
(51, 'Emlak İlanı 1', 'ev, ilan 1, kiralık', 'Bu 1 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'İstanbul - Merkez Mah.', '05774161095', 85, 'Soba', 1, 4, 'Eşyalı', 20, 10036.00, 56.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-1-v0tp2', 'true', 41.7345020, 27.5289510, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(52, 'Emlak İlanı 2', 'ev, ilan 2, kiralık', 'Bu 2 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Eskişehir - Merkez Mah.', '05528029960', 118, 'Soba', 2, 4, 'Eşyalı', 0, 44938.00, 853.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-2-9xjg5', 'true', 38.0421870, 29.1235630, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(53, 'Emlak İlanı 3', 'ev, ilan 3, kiralık', 'Bu 3 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'İzmir - Merkez Mah.', '05940570744', 94, 'Merkezi', 4, 8, 'Eşyasız', 12, 127255.00, 152.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-3-nayhm', 'true', 40.9078950, 29.8486000, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(54, 'Emlak İlanı 4', 'ev, ilan 4, kiralık', 'Bu 4 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Ankara - Merkez Mah.', '05358325254', 150, 'Soba', 2, 7, 'Eşyasız', 0, 81543.00, 63.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-4-yx4kg', 'true', 38.9809800, 27.9921280, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(55, 'Emlak İlanı 5', 'ev, ilan 5, kiralık', 'Bu 5 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Ankara - Merkez Mah.', '05504924687', 173, 'Doğalgaz', 2, 7, 'Eşyalı', 10, 65558.00, 443.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-5-wetsf', 'true', 38.7980390, 29.3991350, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(56, 'Emlak İlanı 6', 'ev, ilan 6, kiralık', 'Bu 6 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'İzmir - Merkez Mah.', '05109254335', 155, 'Doğalgaz', 4, 6, 'Eşyasız', 15, 85610.00, 715.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-6-2mqy4', 'true', 38.5531350, 29.5218590, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(57, 'Emlak İlanı 7', 'ev, ilan 7, kiralık', 'Bu 7 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'İzmir - Merkez Mah.', '05368235815', 46, 'Klima', 4, 3, 'Eşyasız', 4, 29215.00, 346.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-7-yhbgz', 'true', 40.3129030, 28.1418470, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(58, 'Emlak İlanı 8', 'ev, ilan 8, kiralık', 'Bu 8 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Ankara - Merkez Mah.', '05849669631', 164, 'Klima', 4, 6, 'Eşyasız', 14, 80746.00, 669.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-8-cvwh9', 'true', 40.8403580, 29.7795560, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(59, 'Emlak İlanı 9', 'ev, ilan 9, kiralık', 'Bu 9 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Bursa - Merkez Mah.', '05145170470', 47, 'Merkezi', 3, 2, 'Eşyasız', 14, 86710.00, 863.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-9-klocw', 'true', 40.1529710, 28.5168010, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(60, 'Emlak İlanı 10', 'ev, ilan 10, kiralık', 'Bu 10 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Eskişehir - Merkez Mah.', '05754551045', 119, 'Doğalgaz', 5, 3, 'Eşyasız', 6, 37193.00, 215.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-10-s4qt2', 'true', 39.3399280, 29.8821370, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(61, 'Emlak İlanı 11', 'ev, ilan 11, kiralık', 'Bu 11 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'İstanbul - Merkez Mah.', '05429370997', 106, 'Klima', 4, 10, 'Eşyalı', 6, 7833.00, 615.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-11-gopcx', 'true', 38.3122160, 27.0118840, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(62, 'Emlak İlanı 12', 'ev, ilan 12, kiralık', 'Bu 12 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Antalya - Merkez Mah.', '05306711996', 138, 'Klima', 2, 9, 'Eşyasız', 8, 138368.00, 381.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-12-d0o3z', 'true', 41.5256450, 27.3547870, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(63, 'Emlak İlanı 13', 'ev, ilan 13, kiralık', 'Bu 13 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'İzmir - Merkez Mah.', '05466875615', 74, 'Klima', 1, 4, 'Eşyalı', 16, 29439.00, 349.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-13-5hhos', 'true', 38.7465460, 28.5221260, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(64, 'Emlak İlanı 14', 'ev, ilan 14, kiralık', 'Bu 14 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Eskişehir - Merkez Mah.', '05294595605', 94, 'Merkezi', 3, 10, 'Eşyasız', 19, 87681.00, 81.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-14-b3cyz', 'true', 40.4346310, 28.8576760, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(65, 'Emlak İlanı 15', 'ev, ilan 15, kiralık', 'Bu 15 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Bursa - Merkez Mah.', '05403539047', 182, 'Doğalgaz', 2, 6, 'Eşyalı', 0, 77441.00, 175.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-15-ufeiq', 'true', 38.3364180, 28.1998020, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(66, 'Emlak İlanı 16', 'ev, ilan 16, kiralık', 'Bu 16 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Antalya - Merkez Mah.', '05557138884', 111, 'Soba', 2, 4, 'Eşyalı', 2, 11103.00, 47.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-16-rxbux', 'true', 40.4064070, 27.2720910, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(67, 'Emlak İlanı 17', 'ev, ilan 17, kiralık', 'Bu 17 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'İstanbul - Merkez Mah.', '05116641623', 182, 'Klima', 4, 3, 'Eşyasız', 18, 145771.00, 135.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-17-b5ovt', 'true', 38.3834890, 27.0068530, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(68, 'Emlak İlanı 18', 'ev, ilan 18, kiralık', 'Bu 18 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'İstanbul - Merkez Mah.', '05446376559', 99, 'Merkezi', 4, 2, 'Eşyalı', 10, 114613.00, 783.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-18-nahyh', 'true', 40.9845160, 29.6577250, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(69, 'Emlak İlanı 19', 'ev, ilan 19, kiralık', 'Bu 19 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Eskişehir - Merkez Mah.', '05835295826', 50, 'Doğalgaz', 2, 3, 'Eşyalı', 7, 103629.00, 583.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-19-lwwv2', 'true', 40.6194930, 27.7928270, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(70, 'Emlak İlanı 20', 'ev, ilan 20, kiralık', 'Bu 20 numaralı emlak ilanıdır.', 'images/demo.jpg', 4, 1, 'Eskişehir - Merkez Mah.', '05639530410', 77, 'Merkezi', 2, 6, 'Eşyasız', 12, 88212.00, 85.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-20-zsb7d', 'true', 40.1377350, 28.1221800, '2025-05-25 06:49:21', '2025-05-25 06:49:21'),
(71, 'Emlak İlanı 1', 'ev, ilan 1, kiralık', 'Bu 1 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Eskişehir - Merkez Mah.', '05407507949', 185, 'Soba', 2, 10, 'Eşyasız', 13, 87134.00, 699.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-1-vbpcz', 'true', 38.2841880, 27.2666420, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(72, 'Emlak İlanı 2', 'ev, ilan 2, kiralık', 'Bu 2 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Antalya - Merkez Mah.', '05954413801', 58, 'Doğalgaz', 2, 7, 'Eşyalı', 9, 142171.00, 145.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-2-w2blr', 'true', 40.9347160, 28.5166200, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(73, 'Emlak İlanı 3', 'ev, ilan 3, kiralık', 'Bu 3 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'İzmir - Merkez Mah.', '05935687333', 151, 'Doğalgaz', 5, 8, 'Eşyasız', 15, 112780.00, 410.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-3-sijxl', 'true', 38.2965720, 28.8692860, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(74, 'Emlak İlanı 4', 'ev, ilan 4, kiralık', 'Bu 4 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Ankara - Merkez Mah.', '05167819079', 166, 'Soba', 1, 1, 'Eşyasız', 20, 33455.00, 739.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-4-angdn', 'true', 39.4172340, 27.5302400, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(75, 'Emlak İlanı 5', 'ev, ilan 5, kiralık', 'Bu 5 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Eskişehir - Merkez Mah.', '05978164867', 84, 'Doğalgaz', 5, 10, 'Eşyalı', 0, 80375.00, 601.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-5-hxle9', 'true', 39.6017610, 29.7704450, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(76, 'Emlak İlanı 6', 'ev, ilan 6, kiralık', 'Bu 6 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Ankara - Merkez Mah.', '05490111850', 150, 'Doğalgaz', 2, 5, 'Eşyasız', 18, 101683.00, 460.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-6-44pb6', 'true', 41.7384990, 28.3254210, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(77, 'Emlak İlanı 7', 'ev, ilan 7, kiralık', 'Bu 7 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Ankara - Merkez Mah.', '05974747699', 98, 'Doğalgaz', 5, 8, 'Eşyasız', 7, 108522.00, 908.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-7-bu8e8', 'true', 41.9865570, 28.9009590, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(78, 'Emlak İlanı 8', 'ev, ilan 8, kiralık', 'Bu 8 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'İzmir - Merkez Mah.', '05629118509', 175, 'Klima', 5, 2, 'Eşyasız', 7, 47571.00, 17.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-8-sp50u', 'true', 39.0417090, 27.4032410, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(79, 'Emlak İlanı 9', 'ev, ilan 9, kiralık', 'Bu 9 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'İzmir - Merkez Mah.', '05797343180', 64, 'Doğalgaz', 5, 5, 'Eşyalı', 19, 51961.00, 618.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-9-nbuca', 'true', 41.8373770, 27.5998740, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(80, 'Emlak İlanı 10', 'ev, ilan 10, kiralık', 'Bu 10 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Bursa - Merkez Mah.', '05755214704', 176, 'Doğalgaz', 3, 7, 'Eşyasız', 2, 122888.00, 648.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-10-tvcfv', 'true', 41.5291350, 29.4665830, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(81, 'Emlak İlanı 11', 'ev, ilan 11, kiralık', 'Bu 11 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'İzmir - Merkez Mah.', '05433088226', 47, 'Soba', 4, 6, 'Eşyasız', 7, 12810.00, 825.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-11-tdars', 'true', 40.1543660, 28.7061590, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(82, 'Emlak İlanı 12', 'ev, ilan 12, kiralık', 'Bu 12 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Ankara - Merkez Mah.', '05314656838', 189, 'Merkezi', 2, 6, 'Eşyasız', 8, 8051.00, 152.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-12-nqyvn', 'true', 41.6088990, 27.0283620, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(83, 'Emlak İlanı 13', 'ev, ilan 13, kiralık', 'Bu 13 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Antalya - Merkez Mah.', '05111916411', 82, 'Doğalgaz', 1, 7, 'Eşyasız', 5, 60358.00, 553.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-13-txss7', 'true', 40.3563880, 29.0125590, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(84, 'Emlak İlanı 14', 'ev, ilan 14, kiralık', 'Bu 14 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'İstanbul - Merkez Mah.', '05707388086', 156, 'Doğalgaz', 2, 3, 'Eşyalı', 9, 61090.00, 755.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-14-nbdwh', 'true', 41.2199100, 29.4306390, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(85, 'Emlak İlanı 15', 'ev, ilan 15, kiralık', 'Bu 15 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Eskişehir - Merkez Mah.', '05598619113', 178, 'Soba', 4, 8, 'Eşyalı', 9, 135819.00, 65.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-15-vccvt', 'true', 38.9088980, 29.4236050, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(86, 'Emlak İlanı 16', 'ev, ilan 16, kiralık', 'Bu 16 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Bursa - Merkez Mah.', '05599217312', 183, 'Doğalgaz', 5, 5, 'Eşyasız', 2, 131688.00, 147.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-16-j2yfj', 'true', 41.9652930, 27.0476620, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(87, 'Emlak İlanı 17', 'ev, ilan 17, kiralık', 'Bu 17 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'İstanbul - Merkez Mah.', '05212256917', 142, 'Doğalgaz', 1, 5, 'Eşyalı', 10, 15192.00, 864.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-17-qynoc', 'true', 38.6710140, 28.1278220, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(88, 'Emlak İlanı 18', 'ev, ilan 18, kiralık', 'Bu 18 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Antalya - Merkez Mah.', '05505557028', 109, 'Soba', 5, 3, 'Eşyasız', 18, 73922.00, 890.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-18-jzjpl', 'true', 38.0050890, 29.9577810, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(89, 'Emlak İlanı 19', 'ev, ilan 19, kiralık', 'Bu 19 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Eskişehir - Merkez Mah.', '05239245247', 96, 'Soba', 3, 4, 'Eşyalı', 16, 76992.00, 329.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-19-mtajx', 'true', 41.5131720, 28.6502480, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(90, 'Emlak İlanı 20', 'ev, ilan 20, kiralık', 'Bu 20 numaralı emlak ilanıdır.', 'images/demo.jpg', 6, 1, 'Ankara - Merkez Mah.', '05187777559', 157, 'Doğalgaz', 2, 1, 'Eşyalı', 2, 91423.00, 516.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-20-7l7h1', 'true', 39.4491670, 28.8657470, '2025-05-25 06:49:26', '2025-05-25 06:49:26'),
(91, 'Emlak İlanı 1', 'ev, ilan 1, kiralık', 'Bu 1 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'İzmir - Merkez Mah.', '05516729314', 78, 'Klima', 2, 3, 'Eşyalı', 13, 143312.00, 860.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-1-p9vf6', 'true', 38.0652610, 27.8905130, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(92, 'Emlak İlanı 2', 'ev, ilan 2, kiralık', 'Bu 2 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Ankara - Merkez Mah.', '05219515608', 70, 'Merkezi', 2, 8, 'Eşyasız', 18, 5872.00, 765.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-2-kxqdx', 'true', 41.8202640, 29.1836770, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(93, 'Emlak İlanı 3', 'ev, ilan 3, kiralık', 'Bu 3 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Antalya - Merkez Mah.', '05709375257', 185, 'Doğalgaz', 3, 8, 'Eşyasız', 3, 18631.00, 994.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-3-vvyyg', 'true', 39.0230920, 29.7671100, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(94, 'Emlak İlanı 4', 'ev, ilan 4, kiralık', 'Bu 4 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Ankara - Merkez Mah.', '05394770015', 45, 'Doğalgaz', 4, 7, 'Eşyalı', 4, 61975.00, 389.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-4-ihisc', 'true', 38.6571980, 27.0324150, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(95, 'Emlak İlanı 5', 'ev, ilan 5, kiralık', 'Bu 5 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Bursa - Merkez Mah.', '05876540258', 123, 'Klima', 5, 8, 'Eşyasız', 3, 89429.00, 200.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-5-vrucq', 'true', 40.3498090, 29.4538410, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(96, 'Emlak İlanı 6', 'ev, ilan 6, kiralık', 'Bu 6 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'İstanbul - Merkez Mah.', '05851356523', 105, 'Klima', 2, 4, 'Eşyalı', 10, 144178.00, 726.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-6-r10jj', 'true', 40.1626800, 27.2499130, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(97, 'Emlak İlanı 7', 'ev, ilan 7, kiralık', 'Bu 7 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Ankara - Merkez Mah.', '05911373853', 52, 'Doğalgaz', 1, 10, 'Eşyalı', 18, 99983.00, 815.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-7-pxzzh', 'true', 41.7116060, 27.0226450, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(98, 'Emlak İlanı 8', 'ev, ilan 8, kiralık', 'Bu 8 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'İstanbul - Merkez Mah.', '05160314714', 110, 'Doğalgaz', 1, 1, 'Eşyasız', 4, 120708.00, 737.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-8-2o9tm', 'true', 41.1714850, 28.7606360, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(99, 'Emlak İlanı 9', 'ev, ilan 9, kiralık', 'Bu 9 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'İstanbul - Merkez Mah.', '05884847374', 84, 'Klima', 1, 4, 'Eşyasız', 3, 54395.00, 812.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-9-gptp6', 'true', 40.0200980, 28.4546240, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(100, 'Emlak İlanı 10', 'ev, ilan 10, kiralık', 'Bu 10 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Antalya - Merkez Mah.', '05700609986', 110, 'Doğalgaz', 2, 1, 'Eşyalı', 7, 53379.00, 779.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-10-lvxty', 'true', 40.7899000, 27.5351110, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(101, 'Emlak İlanı 11', 'ev, ilan 11, kiralık', 'Bu 11 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'İzmir - Merkez Mah.', '05572213937', 186, 'Doğalgaz', 1, 2, 'Eşyalı', 8, 99051.00, 676.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-11-kiybn', 'true', 40.5941030, 28.5643140, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(102, 'Emlak İlanı 12', 'ev, ilan 12, kiralık', 'Bu 12 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Eskişehir - Merkez Mah.', '05484401124', 89, 'Doğalgaz', 5, 7, 'Eşyalı', 5, 74389.00, 220.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-12-0goum', 'true', 41.7922580, 29.8403950, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(103, 'Emlak İlanı 13', 'ev, ilan 13, kiralık', 'Bu 13 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Eskişehir - Merkez Mah.', '05673862133', 51, 'Klima', 3, 1, 'Eşyalı', 15, 102424.00, 710.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-13-6jkcm', 'true', 41.7078930, 29.5913380, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(104, 'Emlak İlanı 14', 'ev, ilan 14, kiralık', 'Bu 14 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Antalya - Merkez Mah.', '05226416799', 67, 'Merkezi', 5, 7, 'Eşyasız', 1, 59736.00, 47.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-14-ahzjm', 'true', 39.8732530, 29.2848340, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(105, 'Emlak İlanı 15', 'ev, ilan 15, kiralık', 'Bu 15 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Eskişehir - Merkez Mah.', '05550957147', 131, 'Klima', 4, 1, 'Eşyasız', 14, 106199.00, 980.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-15-jsohp', 'true', 41.5998490, 27.3663210, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(106, 'Emlak İlanı 16', 'ev, ilan 16, kiralık', 'Bu 16 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Antalya - Merkez Mah.', '05991428248', 58, 'Merkezi', 5, 4, 'Eşyalı', 7, 64117.00, 743.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-16-sisuw', 'true', 40.6813540, 28.2104300, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(107, 'Emlak İlanı 17', 'ev, ilan 17, kiralık', 'Bu 17 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Antalya - Merkez Mah.', '05656130637', 149, 'Soba', 4, 9, 'Eşyalı', 9, 84838.00, 242.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-17-oro92', 'true', 38.8110380, 29.4489980, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(108, 'Emlak İlanı 18', 'ev, ilan 18, kiralık', 'Bu 18 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Antalya - Merkez Mah.', '05202822720', 95, 'Merkezi', 2, 6, 'Eşyasız', 4, 64726.00, 883.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-18-utn2l', 'true', 38.7678030, 29.0001920, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(109, 'Emlak İlanı 19', 'ev, ilan 19, kiralık', 'Bu 19 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Eskişehir - Merkez Mah.', '05882584592', 107, 'Soba', 1, 10, 'Eşyasız', 12, 87088.00, 59.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-19-upiyi', 'true', 39.5383480, 27.9320800, '2025-05-25 06:49:33', '2025-05-25 06:49:33'),
(110, 'Emlak İlanı 20', 'ev, ilan 20, kiralık', 'Bu 20 numaralı emlak ilanıdır.', 'images/demo.jpg', 7, 1, 'Antalya - Merkez Mah.', '05783547637', 121, 'Soba', 1, 10, 'Eşyalı', 15, 96249.00, 395.00, '<p>Detay bilgisi: örnek içerik.</p>', 'emlak-ilani-20-zqznr', 'true', 41.4793650, 27.8120130, '2025-05-25 06:49:33', '2025-05-25 06:49:33');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `image` varchar(75) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `images`
--

INSERT INTO `images` (`id`, `title`, `image`, `house_id`, `created_at`, `updated_at`) VALUES
(4, '1', 'images/demo.jpg', 2, '2021-01-20 13:31:17', '2021-01-20 13:31:17'),
(5, '2', 'images/demo.jpg', 2, '2021-01-20 13:31:26', '2021-01-20 13:31:26'),
(6, '3', 'images/demo.jpg', 2, '2021-01-20 13:31:33', '2021-01-20 13:31:33'),
(7, '1', 'images/demo.jpg', 3, '2021-01-22 06:51:40', '2021-01-22 06:51:40'),
(8, '2', 'images/demo.jpg', 3, '2021-01-22 06:51:49', '2021-01-22 06:51:49'),
(10, '1', 'images/demo.jpg', 5, '2021-01-24 10:00:07', '2021-01-24 10:00:07'),
(11, '2', 'images/demo.jpg', 5, '2021-01-24 10:00:15', '2021-01-24 10:00:15'),
(12, '3', 'images/demo.jpg', 5, '2021-01-24 10:00:24', '2021-01-24 10:00:24'),
(13, '1', 'images/demo.jpg', 6, '2021-01-24 10:10:06', '2021-01-24 10:10:06'),
(14, '2', 'images/demo.jpg', 6, '2021-01-24 10:10:16', '2021-01-24 10:10:16'),
(15, 'foto1', 'images/demo.jpg', 1, '2021-12-30 07:55:27', '2021-12-30 07:55:27'),
(16, 'foto2', 'images/demo.jpg', 1, '2021-12-30 07:55:34', '2021-12-30 07:55:34'),
(17, 'foto', 'images/demo.jpg', 9, '2022-01-02 11:41:06', '2022-01-02 11:41:06'),
(18, 'foto1', 'images/demo.jpg', 9, '2022-01-02 11:41:12', '2022-01-02 11:41:12'),
(19, 'foto2', 'images/demo.jpg', 9, '2022-01-02 11:41:18', '2022-01-02 11:41:18'),
(20, 'foto', 'images/demo.jpg', 10, '2022-01-02 11:45:23', '2022-01-02 11:45:23'),
(21, 'foto2', 'images/demo.jpg', 10, '2022-01-02 11:45:28', '2022-01-02 11:45:28'),
(23, 'foto1', 'images/demo.jpg', 1, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(24, 'foto2', 'images/demo.jpg', 1, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(25, 'foto1', 'images/demo.jpg', 9, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(26, 'foto2', 'images/demo.jpg', 9, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(27, 'foto1', 'images/demo.jpg', 10, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(28, 'foto2', 'images/demo.jpg', 10, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(29, 'foto1', 'images/demo.jpg', 11, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(30, 'foto2', 'images/demo.jpg', 11, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(31, 'foto3', 'images/demo.jpg', 11, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(32, 'foto1', 'images/demo.jpg', 12, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(33, 'foto2', 'images/demo.jpg', 12, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(34, 'foto1', 'images/demo.jpg', 13, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(35, 'foto2', 'images/demo.jpg', 13, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(36, 'foto1', 'images/demo.jpg', 14, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(37, 'foto2', 'images/demo.jpg', 14, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(38, 'foto3', 'images/demo.jpg', 14, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(39, 'foto1', 'images/demo.jpg', 15, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(40, 'foto2', 'images/demo.jpg', 15, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(41, 'foto3', 'images/demo.jpg', 15, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(42, 'foto1', 'images/demo.jpg', 16, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(43, 'foto2', 'images/demo.jpg', 16, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(44, 'foto1', 'images/demo.jpg', 17, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(45, 'foto1', 'images/demo.jpg', 18, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(46, 'foto2', 'images/demo.jpg', 18, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(47, 'foto3', 'images/demo.jpg', 18, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(48, 'foto1', 'images/demo.jpg', 19, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(49, 'foto2', 'images/demo.jpg', 19, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(50, 'foto3', 'images/demo.jpg', 19, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(51, 'foto1', 'images/demo.jpg', 20, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(52, 'foto1', 'images/demo.jpg', 21, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(53, 'foto2', 'images/demo.jpg', 21, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(54, 'foto3', 'images/demo.jpg', 21, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(55, 'foto1', 'images/demo.jpg', 22, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(56, 'foto2', 'images/demo.jpg', 22, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(57, 'foto1', 'images/demo.jpg', 23, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(58, 'foto1', 'images/demo.jpg', 24, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(59, 'foto2', 'images/demo.jpg', 24, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(60, 'foto1', 'images/demo.jpg', 25, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(61, 'foto2', 'images/demo.jpg', 25, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(62, 'foto1', 'images/demo.jpg', 26, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(63, 'foto2', 'images/demo.jpg', 26, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(64, 'foto1', 'images/demo.jpg', 27, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(65, 'foto2', 'images/demo.jpg', 27, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(66, 'foto3', 'images/demo.jpg', 27, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(67, 'foto1', 'images/demo.jpg', 28, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(68, 'foto2', 'images/demo.jpg', 28, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(69, 'foto1', 'images/demo.jpg', 29, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(70, 'foto2', 'images/demo.jpg', 29, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(71, 'foto3', 'images/demo.jpg', 29, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(72, 'foto1', 'images/demo.jpg', 30, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(73, 'foto2', 'images/demo.jpg', 30, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(74, 'foto3', 'images/demo.jpg', 30, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(75, 'foto1', 'images/demo.jpg', 31, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(76, 'foto1', 'images/demo.jpg', 32, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(77, 'foto2', 'images/demo.jpg', 32, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(78, 'foto1', 'images/demo.jpg', 33, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(79, 'foto1', 'images/demo.jpg', 34, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(80, 'foto2', 'images/demo.jpg', 34, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(81, 'foto3', 'images/demo.jpg', 34, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(82, 'foto1', 'images/demo.jpg', 35, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(83, 'foto1', 'images/demo.jpg', 36, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(84, 'foto2', 'images/demo.jpg', 36, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(85, 'foto3', 'images/demo.jpg', 36, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(86, 'foto1', 'images/demo.jpg', 37, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(87, 'foto2', 'images/demo.jpg', 37, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(88, 'foto1', 'images/demo.jpg', 38, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(89, 'foto1', 'images/demo.jpg', 39, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(90, 'foto1', 'images/demo.jpg', 40, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(91, 'foto1', 'images/demo.jpg', 41, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(92, 'foto2', 'images/demo.jpg', 41, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(93, 'foto1', 'images/demo.jpg', 42, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(94, 'foto2', 'images/demo.jpg', 42, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(95, 'foto3', 'images/demo.jpg', 42, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(96, 'foto1', 'images/demo.jpg', 43, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(97, 'foto1', 'images/demo.jpg', 44, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(98, 'foto1', 'images/demo.jpg', 45, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(99, 'foto1', 'images/demo.jpg', 46, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(100, 'foto1', 'images/demo.jpg', 47, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(101, 'foto2', 'images/demo.jpg', 47, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(102, 'foto3', 'images/demo.jpg', 47, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(103, 'foto1', 'images/demo.jpg', 48, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(104, 'foto2', 'images/demo.jpg', 48, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(105, 'foto3', 'images/demo.jpg', 48, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(106, 'foto1', 'images/demo.jpg', 49, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(107, 'foto1', 'images/demo.jpg', 50, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(108, 'foto1', 'images/demo.jpg', 51, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(109, 'foto1', 'images/demo.jpg', 52, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(110, 'foto1', 'images/demo.jpg', 53, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(111, 'foto2', 'images/demo.jpg', 53, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(112, 'foto1', 'images/demo.jpg', 54, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(113, 'foto2', 'images/demo.jpg', 54, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(114, 'foto3', 'images/demo.jpg', 54, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(115, 'foto1', 'images/demo.jpg', 55, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(116, 'foto2', 'images/demo.jpg', 55, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(117, 'foto1', 'images/demo.jpg', 56, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(118, 'foto2', 'images/demo.jpg', 56, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(119, 'foto3', 'images/demo.jpg', 56, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(120, 'foto1', 'images/demo.jpg', 57, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(121, 'foto2', 'images/demo.jpg', 57, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(122, 'foto3', 'images/demo.jpg', 57, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(123, 'foto1', 'images/demo.jpg', 58, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(124, 'foto2', 'images/demo.jpg', 58, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(125, 'foto1', 'images/demo.jpg', 59, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(126, 'foto1', 'images/demo.jpg', 60, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(127, 'foto2', 'images/demo.jpg', 60, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(128, 'foto1', 'images/demo.jpg', 61, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(129, 'foto2', 'images/demo.jpg', 61, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(130, 'foto1', 'images/demo.jpg', 62, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(131, 'foto2', 'images/demo.jpg', 62, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(132, 'foto1', 'images/demo.jpg', 63, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(133, 'foto1', 'images/demo.jpg', 64, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(134, 'foto2', 'images/demo.jpg', 64, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(135, 'foto3', 'images/demo.jpg', 64, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(136, 'foto1', 'images/demo.jpg', 65, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(137, 'foto1', 'images/demo.jpg', 66, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(138, 'foto2', 'images/demo.jpg', 66, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(139, 'foto3', 'images/demo.jpg', 66, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(140, 'foto1', 'images/demo.jpg', 67, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(141, 'foto1', 'images/demo.jpg', 68, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(142, 'foto1', 'images/demo.jpg', 69, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(143, 'foto2', 'images/demo.jpg', 69, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(144, 'foto1', 'images/demo.jpg', 70, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(145, 'foto2', 'images/demo.jpg', 70, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(146, 'foto3', 'images/demo.jpg', 70, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(147, 'foto1', 'images/demo.jpg', 71, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(148, 'foto2', 'images/demo.jpg', 71, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(149, 'foto3', 'images/demo.jpg', 71, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(150, 'foto1', 'images/demo.jpg', 72, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(151, 'foto2', 'images/demo.jpg', 72, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(152, 'foto3', 'images/demo.jpg', 72, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(153, 'foto1', 'images/demo.jpg', 73, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(154, 'foto1', 'images/demo.jpg', 74, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(155, 'foto1', 'images/demo.jpg', 75, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(156, 'foto2', 'images/demo.jpg', 75, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(157, 'foto1', 'images/demo.jpg', 76, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(158, 'foto2', 'images/demo.jpg', 76, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(159, 'foto1', 'images/demo.jpg', 77, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(160, 'foto1', 'images/demo.jpg', 78, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(161, 'foto2', 'images/demo.jpg', 78, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(162, 'foto3', 'images/demo.jpg', 78, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(163, 'foto1', 'images/demo.jpg', 79, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(164, 'foto1', 'images/demo.jpg', 80, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(165, 'foto2', 'images/demo.jpg', 80, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(166, 'foto3', 'images/demo.jpg', 80, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(167, 'foto1', 'images/demo.jpg', 81, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(168, 'foto1', 'images/demo.jpg', 82, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(169, 'foto2', 'images/demo.jpg', 82, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(170, 'foto3', 'images/demo.jpg', 82, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(171, 'foto1', 'images/demo.jpg', 83, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(172, 'foto2', 'images/demo.jpg', 83, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(173, 'foto1', 'images/demo.jpg', 84, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(174, 'foto2', 'images/demo.jpg', 84, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(175, 'foto1', 'images/demo.jpg', 85, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(176, 'foto2', 'images/demo.jpg', 85, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(177, 'foto3', 'images/demo.jpg', 85, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(178, 'foto1', 'images/demo.jpg', 86, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(179, 'foto2', 'images/demo.jpg', 86, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(180, 'foto1', 'images/demo.jpg', 87, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(181, 'foto2', 'images/demo.jpg', 87, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(182, 'foto1', 'images/demo.jpg', 88, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(183, 'foto2', 'images/demo.jpg', 88, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(184, 'foto1', 'images/demo.jpg', 89, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(185, 'foto2', 'images/demo.jpg', 89, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(186, 'foto3', 'images/demo.jpg', 89, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(187, 'foto1', 'images/demo.jpg', 90, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(188, 'foto2', 'images/demo.jpg', 90, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(189, 'foto3', 'images/demo.jpg', 90, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(190, 'foto1', 'images/demo.jpg', 91, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(191, 'foto2', 'images/demo.jpg', 91, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(192, 'foto1', 'images/demo.jpg', 92, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(193, 'foto2', 'images/demo.jpg', 92, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(194, 'foto3', 'images/demo.jpg', 92, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(195, 'foto1', 'images/demo.jpg', 93, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(196, 'foto2', 'images/demo.jpg', 93, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(197, 'foto3', 'images/demo.jpg', 93, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(198, 'foto1', 'images/demo.jpg', 94, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(199, 'foto1', 'images/demo.jpg', 95, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(200, 'foto2', 'images/demo.jpg', 95, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(201, 'foto3', 'images/demo.jpg', 95, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(202, 'foto1', 'images/demo.jpg', 96, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(203, 'foto1', 'images/demo.jpg', 97, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(204, 'foto2', 'images/demo.jpg', 97, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(205, 'foto3', 'images/demo.jpg', 97, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(206, 'foto1', 'images/demo.jpg', 98, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(207, 'foto2', 'images/demo.jpg', 98, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(208, 'foto1', 'images/demo.jpg', 99, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(209, 'foto2', 'images/demo.jpg', 99, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(210, 'foto3', 'images/demo.jpg', 99, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(211, 'foto1', 'images/demo.jpg', 100, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(212, 'foto2', 'images/demo.jpg', 100, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(213, 'foto1', 'images/demo.jpg', 101, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(214, 'foto1', 'images/demo.jpg', 102, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(215, 'foto2', 'images/demo.jpg', 102, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(216, 'foto3', 'images/demo.jpg', 102, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(217, 'foto1', 'images/demo.jpg', 103, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(218, 'foto2', 'images/demo.jpg', 103, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(219, 'foto1', 'images/demo.jpg', 104, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(220, 'foto1', 'images/demo.jpg', 105, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(221, 'foto1', 'images/demo.jpg', 106, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(222, 'foto1', 'images/demo.jpg', 107, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(223, 'foto2', 'images/demo.jpg', 107, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(224, 'foto1', 'images/demo.jpg', 108, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(225, 'foto2', 'images/demo.jpg', 108, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(226, 'foto1', 'images/demo.jpg', 109, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(227, 'foto1', 'images/demo.jpg', 110, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(228, 'foto2', 'images/demo.jpg', 110, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(229, 'foto3', 'images/demo.jpg', 110, '2025-05-25 07:05:30', '2025-05-25 07:05:30'),
(230, 'foto1', 'images/demo.jpg', 1, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(231, 'foto2', 'images/demo.jpg', 1, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(232, 'foto1', 'images/demo.jpg', 9, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(233, 'foto2', 'images/demo.jpg', 9, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(234, 'foto1', 'images/demo.jpg', 10, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(235, 'foto2', 'images/demo.jpg', 10, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(236, 'foto3', 'images/demo.jpg', 10, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(237, 'foto1', 'images/demo.jpg', 11, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(238, 'foto1', 'images/demo.jpg', 12, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(239, 'foto2', 'images/demo.jpg', 12, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(240, 'foto3', 'images/demo.jpg', 12, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(241, 'foto1', 'images/demo.jpg', 13, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(242, 'foto1', 'images/demo.jpg', 14, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(243, 'foto2', 'images/demo.jpg', 14, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(244, 'foto1', 'images/demo.jpg', 15, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(245, 'foto2', 'images/demo.jpg', 15, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(246, 'foto3', 'images/demo.jpg', 15, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(247, 'foto1', 'images/demo.jpg', 16, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(248, 'foto1', 'images/demo.jpg', 17, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(249, 'foto1', 'images/demo.jpg', 18, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(250, 'foto2', 'images/demo.jpg', 18, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(251, 'foto3', 'images/demo.jpg', 18, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(252, 'foto1', 'images/demo.jpg', 19, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(253, 'foto1', 'images/demo.jpg', 20, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(254, 'foto1', 'images/demo.jpg', 21, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(255, 'foto1', 'images/demo.jpg', 22, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(256, 'foto2', 'images/demo.jpg', 22, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(257, 'foto3', 'images/demo.jpg', 22, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(258, 'foto1', 'images/demo.jpg', 23, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(259, 'foto2', 'images/demo.jpg', 23, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(260, 'foto3', 'images/demo.jpg', 23, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(261, 'foto1', 'images/demo.jpg', 24, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(262, 'foto2', 'images/demo.jpg', 24, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(263, 'foto1', 'images/demo.jpg', 25, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(264, 'foto2', 'images/demo.jpg', 25, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(265, 'foto3', 'images/demo.jpg', 25, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(266, 'foto1', 'images/demo.jpg', 26, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(267, 'foto2', 'images/demo.jpg', 26, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(268, 'foto3', 'images/demo.jpg', 26, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(269, 'foto1', 'images/demo.jpg', 27, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(270, 'foto2', 'images/demo.jpg', 27, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(271, 'foto1', 'images/demo.jpg', 28, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(272, 'foto1', 'images/demo.jpg', 29, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(273, 'foto1', 'images/demo.jpg', 30, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(274, 'foto2', 'images/demo.jpg', 30, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(275, 'foto1', 'images/demo.jpg', 31, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(276, 'foto2', 'images/demo.jpg', 31, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(277, 'foto3', 'images/demo.jpg', 31, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(278, 'foto1', 'images/demo.jpg', 32, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(279, 'foto1', 'images/demo.jpg', 33, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(280, 'foto1', 'images/demo.jpg', 34, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(281, 'foto1', 'images/demo.jpg', 35, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(282, 'foto1', 'images/demo.jpg', 36, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(283, 'foto1', 'images/demo.jpg', 37, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(284, 'foto2', 'images/demo.jpg', 37, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(285, 'foto1', 'images/demo.jpg', 38, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(286, 'foto2', 'images/demo.jpg', 38, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(287, 'foto3', 'images/demo.jpg', 38, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(288, 'foto1', 'images/demo.jpg', 39, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(289, 'foto2', 'images/demo.jpg', 39, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(290, 'foto1', 'images/demo.jpg', 40, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(291, 'foto2', 'images/demo.jpg', 40, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(292, 'foto3', 'images/demo.jpg', 40, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(293, 'foto1', 'images/demo.jpg', 41, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(294, 'foto1', 'images/demo.jpg', 42, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(295, 'foto2', 'images/demo.jpg', 42, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(296, 'foto3', 'images/demo.jpg', 42, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(297, 'foto1', 'images/demo.jpg', 43, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(298, 'foto2', 'images/demo.jpg', 43, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(299, 'foto3', 'images/demo.jpg', 43, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(300, 'foto1', 'images/demo.jpg', 44, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(301, 'foto2', 'images/demo.jpg', 44, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(302, 'foto3', 'images/demo.jpg', 44, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(303, 'foto1', 'images/demo.jpg', 45, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(304, 'foto2', 'images/demo.jpg', 45, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(305, 'foto1', 'images/demo.jpg', 46, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(306, 'foto2', 'images/demo.jpg', 46, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(307, 'foto1', 'images/demo.jpg', 47, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(308, 'foto2', 'images/demo.jpg', 47, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(309, 'foto3', 'images/demo.jpg', 47, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(310, 'foto1', 'images/demo.jpg', 48, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(311, 'foto1', 'images/demo.jpg', 49, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(312, 'foto2', 'images/demo.jpg', 49, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(313, 'foto3', 'images/demo.jpg', 49, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(314, 'foto1', 'images/demo.jpg', 50, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(315, 'foto2', 'images/demo.jpg', 50, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(316, 'foto1', 'images/demo.jpg', 51, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(317, 'foto2', 'images/demo.jpg', 51, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(318, 'foto3', 'images/demo.jpg', 51, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(319, 'foto1', 'images/demo.jpg', 52, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(320, 'foto1', 'images/demo.jpg', 53, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(321, 'foto1', 'images/demo.jpg', 54, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(322, 'foto1', 'images/demo.jpg', 55, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(323, 'foto2', 'images/demo.jpg', 55, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(324, 'foto3', 'images/demo.jpg', 55, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(325, 'foto1', 'images/demo.jpg', 56, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(326, 'foto1', 'images/demo.jpg', 57, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(327, 'foto2', 'images/demo.jpg', 57, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(328, 'foto3', 'images/demo.jpg', 57, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(329, 'foto1', 'images/demo.jpg', 58, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(330, 'foto2', 'images/demo.jpg', 58, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(331, 'foto1', 'images/demo.jpg', 59, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(332, 'foto2', 'images/demo.jpg', 59, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(333, 'foto3', 'images/demo.jpg', 59, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(334, 'foto1', 'images/demo.jpg', 60, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(335, 'foto2', 'images/demo.jpg', 60, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(336, 'foto3', 'images/demo.jpg', 60, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(337, 'foto1', 'images/demo.jpg', 61, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(338, 'foto2', 'images/demo.jpg', 61, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(339, 'foto3', 'images/demo.jpg', 61, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(340, 'foto1', 'images/demo.jpg', 62, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(341, 'foto2', 'images/demo.jpg', 62, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(342, 'foto3', 'images/demo.jpg', 62, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(343, 'foto1', 'images/demo.jpg', 63, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(344, 'foto1', 'images/demo.jpg', 64, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(345, 'foto2', 'images/demo.jpg', 64, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(346, 'foto3', 'images/demo.jpg', 64, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(347, 'foto1', 'images/demo.jpg', 65, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(348, 'foto1', 'images/demo.jpg', 66, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(349, 'foto2', 'images/demo.jpg', 66, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(350, 'foto3', 'images/demo.jpg', 66, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(351, 'foto1', 'images/demo.jpg', 67, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(352, 'foto2', 'images/demo.jpg', 67, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(353, 'foto3', 'images/demo.jpg', 67, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(354, 'foto1', 'images/demo.jpg', 68, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(355, 'foto2', 'images/demo.jpg', 68, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(356, 'foto1', 'images/demo.jpg', 69, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(357, 'foto2', 'images/demo.jpg', 69, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(358, 'foto3', 'images/demo.jpg', 69, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(359, 'foto1', 'images/demo.jpg', 70, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(360, 'foto2', 'images/demo.jpg', 70, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(361, 'foto1', 'images/demo.jpg', 71, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(362, 'foto1', 'images/demo.jpg', 72, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(363, 'foto2', 'images/demo.jpg', 72, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(364, 'foto1', 'images/demo.jpg', 73, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(365, 'foto2', 'images/demo.jpg', 73, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(366, 'foto1', 'images/demo.jpg', 74, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(367, 'foto1', 'images/demo.jpg', 75, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(368, 'foto2', 'images/demo.jpg', 75, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(369, 'foto3', 'images/demo.jpg', 75, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(370, 'foto1', 'images/demo.jpg', 76, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(371, 'foto2', 'images/demo.jpg', 76, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(372, 'foto1', 'images/demo.jpg', 77, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(373, 'foto2', 'images/demo.jpg', 77, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(374, 'foto1', 'images/demo.jpg', 78, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(375, 'foto2', 'images/demo.jpg', 78, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(376, 'foto1', 'images/demo.jpg', 79, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(377, 'foto1', 'images/demo.jpg', 80, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(378, 'foto2', 'images/demo.jpg', 80, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(379, 'foto1', 'images/demo.jpg', 81, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(380, 'foto1', 'images/demo.jpg', 82, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(381, 'foto2', 'images/demo.jpg', 82, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(382, 'foto1', 'images/demo.jpg', 83, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(383, 'foto1', 'images/demo.jpg', 84, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(384, 'foto2', 'images/demo.jpg', 84, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(385, 'foto1', 'images/demo.jpg', 85, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(386, 'foto2', 'images/demo.jpg', 85, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(387, 'foto1', 'images/demo.jpg', 86, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(388, 'foto1', 'images/demo.jpg', 87, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(389, 'foto2', 'images/demo.jpg', 87, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(390, 'foto3', 'images/demo.jpg', 87, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(391, 'foto1', 'images/demo.jpg', 88, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(392, 'foto1', 'images/demo.jpg', 89, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(393, 'foto2', 'images/demo.jpg', 89, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(394, 'foto3', 'images/demo.jpg', 89, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(395, 'foto1', 'images/demo.jpg', 90, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(396, 'foto2', 'images/demo.jpg', 90, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(397, 'foto3', 'images/demo.jpg', 90, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(398, 'foto1', 'images/demo.jpg', 91, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(399, 'foto2', 'images/demo.jpg', 91, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(400, 'foto1', 'images/demo.jpg', 92, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(401, 'foto1', 'images/demo.jpg', 93, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(402, 'foto2', 'images/demo.jpg', 93, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(403, 'foto1', 'images/demo.jpg', 94, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(404, 'foto2', 'images/demo.jpg', 94, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(405, 'foto3', 'images/demo.jpg', 94, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(406, 'foto1', 'images/demo.jpg', 95, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(407, 'foto2', 'images/demo.jpg', 95, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(408, 'foto1', 'images/demo.jpg', 96, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(409, 'foto2', 'images/demo.jpg', 96, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(410, 'foto3', 'images/demo.jpg', 96, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(411, 'foto1', 'images/demo.jpg', 97, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(412, 'foto1', 'images/demo.jpg', 98, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(413, 'foto1', 'images/demo.jpg', 99, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(414, 'foto2', 'images/demo.jpg', 99, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(415, 'foto3', 'images/demo.jpg', 99, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(416, 'foto1', 'images/demo.jpg', 100, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(417, 'foto2', 'images/demo.jpg', 100, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(418, 'foto1', 'images/demo.jpg', 101, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(419, 'foto2', 'images/demo.jpg', 101, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(420, 'foto1', 'images/demo.jpg', 102, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(421, 'foto2', 'images/demo.jpg', 102, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(422, 'foto3', 'images/demo.jpg', 102, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(423, 'foto1', 'images/demo.jpg', 103, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(424, 'foto2', 'images/demo.jpg', 103, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(425, 'foto1', 'images/demo.jpg', 104, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(426, 'foto2', 'images/demo.jpg', 104, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(427, 'foto1', 'images/demo.jpg', 105, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(428, 'foto2', 'images/demo.jpg', 105, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(429, 'foto3', 'images/demo.jpg', 105, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(430, 'foto1', 'images/demo.jpg', 106, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(431, 'foto2', 'images/demo.jpg', 106, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(432, 'foto1', 'images/demo.jpg', 107, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(433, 'foto2', 'images/demo.jpg', 107, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(434, 'foto3', 'images/demo.jpg', 107, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(435, 'foto1', 'images/demo.jpg', 108, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(436, 'foto2', 'images/demo.jpg', 108, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(437, 'foto1', 'images/demo.jpg', 109, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(438, 'foto2', 'images/demo.jpg', 109, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(439, 'foto3', 'images/demo.jpg', 109, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(440, 'foto1', 'images/demo.jpg', 110, '2025-05-25 07:09:02', '2025-05-25 07:09:02'),
(441, 'foto2', 'images/demo.jpg', 110, '2025-05-25 07:09:02', '2025-05-25 07:09:02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `likes` tinyint(1) DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'New',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `house_id`, `likes`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 9, NULL, 'New', '2025-05-24 17:56:06', '2025-05-24 17:56:06'),
(4, 2, 1, NULL, 'New', '2025-05-25 06:54:08', '2025-05-25 06:54:08');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `status` varchar(5) DEFAULT 'New',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_12_30_083636_create_sessions_table', 1),
(7, '2021_12_30_093134_create_reviews_table', 2),
(8, '2021_12_30_093232_review', 2),
(9, '2020_05_02_100001_create_filemanager_table', 3),
(10, '2022_01_02_145108_add_phone_to_users', 4),
(11, '2022_01_02_145118_add_address_to_users', 4),
(12, '2022_01_02_145410_add_phone_to_users', 5),
(13, '2025_05_24_203541_create_likes_table', 6),
(14, '2025_05_25_080818_add_latitude_longitude_to_houses_table', 7);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `house_id` int(11) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `IP` varchar(20) DEFAULT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'New',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `house_id`, `subject`, `review`, `IP`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'yorum', 'yorum', '127.0.0.1', 'New', '2022-01-02 11:32:30', '2022-01-02 11:32:30'),
(2, 2, 1, 'selam', 'deneme yorum', '127.0.0.1', 'New', '2025-03-29 10:52:51', '2025-03-29 10:52:51'),
(4, 2, 9, 'deneme', 'DENEME', '127.0.0.1', 'New', '2025-04-10 06:22:02', '2025-04-10 06:22:02'),
(5, 2, 9, 'selamlar', 'ev çok iyi', '127.0.0.1', 'New', '2025-05-24 18:00:36', '2025-05-24 18:00:36');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'user', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `role_user`
--

CREATE TABLE `role_user` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3VGnBbp25L5VC7cqAqtvKfW9Ged81VaOYcwlXbmV', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRTJ6S1BrNUVUdWhOM29NNWc2bW00Z1RTZURmM1lmWFdUbDI5QjdpWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob3VzZS8xL2JhaGNlbGlldmxlci1tZXRyb2J1c2UtNS1kay1raXJhbGlrLTMxLWR1YmxleC1kYWlyZS0xMDQ1MDMwMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzQ4MTU0NzIzO31zOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJE8zNk51OGp4cmFVZmhORS9nRG9WZk9TNHJpTjUueE5nOXFWN2pidUtzU3dydnkvS3NodHhpIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCRPMzZOdThqeHJhVWZoTkUvZ0RvVmZPUzRyaU41LnhOZzlxVjdqYnVLc1N3cnZ5L0tzaHR4aSI7fQ==', 1748191832);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `company` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(75) NOT NULL DEFAULT '1',
  `smtpserver` varchar(75) DEFAULT NULL,
  `smtpemail` varchar(75) DEFAULT NULL,
  `smtppassword` varchar(15) DEFAULT NULL,
  `smtpport` int(11) DEFAULT 0,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  `aboutus` text DEFAULT NULL,
  `contact` text DEFAULT NULL,
  `references` text DEFAULT NULL,
  `status` varchar(5) DEFAULT 'False',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`id`, `title`, `keywords`, `description`, `company`, `address`, `phone`, `fax`, `email`, `smtpserver`, `smtpemail`, `smtppassword`, `smtpport`, `facebook`, `twitter`, `instagram`, `youtube`, `aboutus`, `contact`, `references`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Emlak Sitesi', 'Emlak Sitesi', 'Emlak Sitesi', 'Emlak Sitesi', 'Konya', '654654654654', '654646464', 'site@info.com', 'smtp.sitemiz.com', 'smtp@email.com', '12345', 578, 'facebook.com', 'twitter.com', 'instagram.com', 'youtube.com', '<h1>D&uuml;nden Bug&uuml;ne</h1>\r\n\r\n<p>&quot;2000 yılında T&uuml;rkiye&rsquo;nin sahibinden.com&rsquo;u olmak i&ccedil;in yola &ccedil;ıktık....&quot;</p>\r\n\r\n<p>T&uuml;rkiye&rsquo;nin ilan ve alışverişte ilk adresi sahibinden.com, 2000 yılında Aksoy Group b&uuml;nyesinde hayata ge&ccedil;irildi. Bir e-ticaret sitesi olmanın &ouml;tesinde, &uuml;lkemizde e-ticaretin doğuşundan bug&uuml;ne olan s&uuml;recin de temsilcisi olan sahibinden.com, T&uuml;rkiye&rsquo;nin en b&uuml;y&uuml;k elektronik ticaret ve ilan platformlarından birisi olma &ouml;zelliğini taşıyor.</p>\r\n\r\n<p>Emlak, Vasıta, Alışveriş, İş Makineleri &amp; Sanayi, Yedek Par&ccedil;a-Aksesuar-Donanım &amp; Tuning, Hizmetler, İş İlanları, Hayvanlar &Acirc;lemi, &Ouml;zel Ders Verenler ve Yardımcı Arayanlar olmak &uuml;zere toplam 10 kategoride hizmet veren sahibinden.com, kullanıcılarının hayatını kolaylaştıracak &uuml;r&uuml;n ve servisleriyle de ulusal ve uluslararası arenada &ccedil;ok sayıda &ouml;d&uuml;l&uuml;n sahibi oldu.</p>\r\n\r\n<p>sahibinden.com ayrıca İstanbul&rsquo;daki genel merkezi sahiplex ile T&uuml;rkiye&rsquo;nin &ldquo;Yeşil Ofis&rdquo; se&ccedil;ilen ilk e-ticaret şirketi unvanına sahip.</p>\r\n\r\n<p>İşine tutkuyla bağlı profesyonel insan kaynağı, g&uuml;&ccedil;l&uuml; teknolojik altyapısı ve m&uuml;şteri odaklı hizmet anlayışı ile sahibinden.com, kullanıcılarının hayatlarına dokunarak değer yaratmak, hayallerine ulaşmalarına aracılık etmek ve en iyi deneyimleri yaşatmak i&ccedil;in t&uuml;m g&uuml;c&uuml;yle &ccedil;alışmaya devam ediyor.</p>', '<h1 bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:20,&quot;w&quot;:943,&quot;h&quot;:31,&quot;abs_x&quot;:356,&quot;abs_y&quot;:862}\">İletişim</h1>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:68,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:910}\">İşletme Adı</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:102,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:944}\">sahibinden.com</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:136,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:978}\">Ticaret &Uuml;nvanı</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:170,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1012}\">Sahibinden Bilgi Teknolojileri Paz.ve Tic. A.Ş.</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:203,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1045}\">Sorumlu Kişi</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:237,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1079}\">Filiz Saran</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:271,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1113}\">Ticaret Sicil No</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:305,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1147}\">433844</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:339,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1181}\">KEP Adresi</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:372,&quot;w&quot;:943,&quot;h&quot;:26,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1214}\"><img bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:372,&quot;w&quot;:161,&quot;h&quot;:21,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1214}\" src=\"https://s0.shbdn.com/assets/images/kep-mail-link:2be714133f5696d2b9e1493e5e88c3a8.png\" style=\"height:21px; width:161px\" /></p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:412,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1254}\">MERSİS Numarası</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:446,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1288}\">0739014655600017</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:480,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1322}\">Merkez Ofis</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:513,&quot;w&quot;:943,&quot;h&quot;:41,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1355}\">Değirmen Yolu Cad. No:28 Asia OfisPark A Blok Kat:2<br bis_size=\"{&quot;x&quot;:329,&quot;y&quot;:517,&quot;w&quot;:0,&quot;h&quot;:14,&quot;abs_x&quot;:665,&quot;abs_y&quot;:1359}\" />\r\n34752 Ataşehir/İstanbul T&uuml;rkiye</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:568,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1410}\">&Ccedil;ağrı Merkezi</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:602,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1444}\">0 850 222 44 44</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:636,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1478}\">Destek Merkezi *</p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:669,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1511}\"><a bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:673,&quot;w&quot;:132,&quot;h&quot;:14,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1515}\" href=\"http://www.sahibinden.com/destek/\">sahibinden.com/destek</a></p>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:703,&quot;w&quot;:943,&quot;h&quot;:859,&quot;abs_x&quot;:356,&quot;abs_y&quot;:1545}\"><a bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:1545,&quot;w&quot;:1476,&quot;h&quot;:14,&quot;abs_x&quot;:356,&quot;abs_y&quot;:2387}\" href=\"https://www.google.com/maps/place/40°57\'43.3%22N+29°06\'38.1%22E/@40.962017,29.110574,17z/data=!3m1!4b1!4m2!3m1!1s0x0:0x0\"><img alt=\"\" bis_size=\"{&quot;x&quot;:21,&quot;y&quot;:704,&quot;w&quot;:1474,&quot;h&quot;:852,&quot;abs_x&quot;:357,&quot;abs_y&quot;:1546}\" src=\"https://image5.sahibinden.com/cms/files/corporate/shbdn-map-2x.png\" /> </a></p>\r\n\r\n<ol bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:1576,&quot;w&quot;:943,&quot;h&quot;:83,&quot;abs_x&quot;:356,&quot;abs_y&quot;:2418}\">\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1576,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2418}\">D-100 Kadık&ouml;y-Ankara y&ouml;n&uuml;nde ilerleyin</li>\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1597,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2439}\">İ&ccedil;erenk&ouml;y-K.Bakkalk&ouml;y &ccedil;ıkışına girin</li>\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1617,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2459}\">Bostancı Oto Sanayi y&ouml;n&uuml;ne d&ouml;n&uuml;n</li>\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1638,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2480}\">Fındıklı y&ouml;n&uuml;ne d&ouml;n&uuml;n, sağdaki ilk binadayız</li>\r\n</ol>\r\n\r\n<ol bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:1672,&quot;w&quot;:943,&quot;h&quot;:41,&quot;abs_x&quot;:356,&quot;abs_y&quot;:2514}\">\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1672,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2514}\">D-100 Ankara-Kadık&ouml;y y&ouml;n&uuml;nde ilerleyin</li>\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1693,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2535}\">Fındıklı y&ouml;n&uuml;ne d&ouml;n&uuml;n, sağdaki ilk binadayız</li>\r\n</ol>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:1727,&quot;w&quot;:943,&quot;h&quot;:20,&quot;abs_x&quot;:356,&quot;abs_y&quot;:2569}\">İlgili kanun ve y&ouml;netmelikler</p>\r\n\r\n<ul bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:1760,&quot;w&quot;:943,&quot;h&quot;:104,&quot;abs_x&quot;:356,&quot;abs_y&quot;:2602}\">\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1760,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2602}\"><a bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1764,&quot;w&quot;:221,&quot;h&quot;:14,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2606}\" href=\"https://yardim.sahibinden.com/hc/tr/articles/360014679213-T%C3%BCketicinin-Korunmas%C4%B1-Hakk%C4%B1nda-Kanun\">T&uuml;keticinin korunması hakkında kanun</a></li>\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1781,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2623}\"><a bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1784,&quot;w&quot;:190,&quot;h&quot;:14,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2626}\" href=\"https://yardim.sahibinden.com/hc/tr/articles/360014678893-Mesafeli-S%C3%B6zle%C5%9Fmeler-Y%C3%B6netmeli%C4%9Fi\">Mesafeli s&ouml;zleşmeler y&ouml;netmeliği</a></li>\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1802,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2644}\"><a bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1805,&quot;w&quot;:285,&quot;h&quot;:14,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2647}\" href=\"https://yardim.sahibinden.com/hc/tr/articles/360014592854-Elektronik-Ticaretin-D%C3%BCzenlenmesi-Hakk%C4%B1nda-Kanun\">Elektronik ticaretin d&uuml;zenlenmesi hakkında kanun</a></li>\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1823,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2665}\"><a bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1826,&quot;w&quot;:342,&quot;h&quot;:14,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2668}\" href=\"https://yardim.sahibinden.com/hc/tr/articles/360014593394-Ticari-%C4%B0leti%C5%9Fim-ve-Ticari-Elektronik-%C4%B0letiler-Hakk%C4%B1nda-Y%C3%B6netmelik\">Ticari iletişim ve ticari elektronik iletiler hakkında y&ouml;netmelik</a></li>\r\n	<li bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1844,&quot;w&quot;:863,&quot;h&quot;:20,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2686}\"><a bis_size=\"{&quot;x&quot;:60,&quot;y&quot;:1847,&quot;w&quot;:486,&quot;h&quot;:14,&quot;abs_x&quot;:396,&quot;abs_y&quot;:2689}\" href=\"https://yardim.sahibinden.com/hc/tr/articles/360014678733-Elektronik-Ticarette-Hizmet-Sa%C4%9Flay%C4%B1c%C4%B1-ve-Arac%C4%B1-Hizmet-Sa%C4%9Flay%C4%B1c%C4%B1lar-Hakk%C4%B1nda-Y%C3%B6netmelik\">Elektronik ticarette hizmet sağlayıcı ve aracı hizmet sağlayıcılar hakkında y&ouml;netmelik</a></li>\r\n</ul>\r\n\r\n<p bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:1877,&quot;w&quot;:943,&quot;h&quot;:39,&quot;abs_x&quot;:356,&quot;abs_y&quot;:2719}\"><img bis_size=\"{&quot;x&quot;:20,&quot;y&quot;:1877,&quot;w&quot;:644,&quot;h&quot;:34,&quot;abs_x&quot;:356,&quot;abs_y&quot;:2719}\" src=\"https://image5.sahibinden.com/cms/files/corporate/contact-dipnot-2x-v2.png\" style=\"height:34px; width:644px\" /></p>', '<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/26.jpg\" /></p>\r\n\r\n	<p>Atat&uuml;rk Dil Tarih Kurumu</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/18.jpg\" /></p>\r\n\r\n	<p>Orta Doğu Teknik &Uuml;niversitesi--Odt&uuml;</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/31.jpg\" /></p>\r\n\r\n	<p>T.C. Ekonomi Bakanlığı</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/6.jpg\" /></p>\r\n\r\n	<p>T.C.Sağlık Bakanlığı</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/33.jpg\" /></p>\r\n\r\n	<p>T&uuml;rkiye İş Kurumu Genel M&uuml;d&uuml;rl&uuml;ğ&uuml; İşkur--İşkur</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/49.jpg\" /></p>\r\n\r\n	<p>Yenilenebilir Enerji Genel M&uuml;d&uuml;rl&uuml;ğ&uuml; - Yegm</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/1.jpg\" /></p>\r\n\r\n	<p>&nbsp;&nbsp;T. C. Başbakanlık Afet Ve Acil Durum Y&ouml;netimi Başkanlığı --Afad</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/1.jpg\" /></p>\r\n\r\n	<p>21.Y.Y. &Ouml;zel Eğitim Hizm.A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_acibadem_logo.jpg\" /></p>\r\n\r\n	<p>Acıbadem</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_akbas_l.jpg\" /></p>\r\n\r\n	<p>Akbaş Holding</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/2.jpg\" /></p>\r\n\r\n	<p>Akbaşlar Tekstil A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/3.jpg\" /></p>\r\n\r\n	<p>Akpres Metal Yed.Par&ccedil;a Mak.San.Tic.Aş</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/4.jpg\" /></p>\r\n\r\n	<p>Aktaş Hava S&uuml;spansiyon Sistemleri San.Tic.A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/basari_aktas_logo.jpg\" /></p>\r\n\r\n	<p>Aktaş Holding</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_aktifbank_logo.jpg\" /></p>\r\n\r\n	<p>Aktif Bank</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_akyapak_l.jpg\" /></p>\r\n\r\n	<p>Akyapak Makine</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_alarko_logo.jpg\" /></p>\r\n\r\n	<p>Alarko</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/b_albaraka_l.jpg\" /></p>\r\n\r\n	<p>Albaraka T&uuml;rk</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_alta_l.jpg\" /></p>\r\n\r\n	<p>Alta Yedek Par&ccedil;a Ve Kalıp San. Tic.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/56.jpg\" /></p>\r\n\r\n	<p>Amerikan El&ccedil;iliği</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_anadoluhayat_logo.jpg\" /></p>\r\n\r\n	<p>Anadolu Hayat</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_anadolusigorta_logo.jpg\" /></p>\r\n\r\n	<p>Anadolu Sigorta</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/basari_aroma_logo.jpg\" /></p>\r\n\r\n	<p>Aroma</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/3.jpg\" /></p>\r\n\r\n	<p>Atat&uuml;rk Orman &Ccedil;iftliği --Ao&ccedil;</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/58.jpg\" /></p>\r\n\r\n	<p>Atılım &Uuml;niversitesi</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_aunde_l.jpg\" /></p>\r\n\r\n	<p>Aunde Teknik</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/5.jpg\" /></p>\r\n\r\n	<p>Aunde Teknik Tekstil San.Ve Tic.A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_avea_logo.jpg\" /></p>\r\n\r\n	<p>Avea</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_aviva_logo.jpg\" /></p>\r\n\r\n	<p>Aviva Sigorta A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_bankpozitif_logo.jpg\" /></p>\r\n\r\n	<p>Bank Pozitif</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/6.jpg\" /></p>\r\n\r\n	<p>Barida Makina San. Tic. Ltd. Şti.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/32.jpg\" /></p>\r\n\r\n	<p>Başkent Doğalgaz</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_beckman_logo.jpg\" /></p>\r\n\r\n	<p>Beckman Coulter</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/basari_beycelik_logo.jpg\" /></p>\r\n\r\n	<p>Bey&ccedil;elik - Gestamp</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/7.jpg\" /></p>\r\n\r\n	<p>Bey&ccedil;elik Gestamp Kalıp Ve Oto Yan San.Paz.Tic.A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/artivearti_basari_biskotl.jpg\" /></p>\r\n\r\n	<p>Biskot Bisk&uuml;vi Fabrikası</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/8.jpg\" /></p>\r\n\r\n	<p>Bor&ccedil;elik &Ccedil;elik San.Tic.A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/37.jpg\" /></p>\r\n\r\n	<p>Boru Hatları İle Petrol Taşıma Anonim Şirketi--Botaş</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_borusan_logo.jpg\" /></p>\r\n\r\n	<p>Borusan Holding</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_borusanlojistik_logo.jpg\" /></p>\r\n\r\n	<p>Borusan Lojistik</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/9.jpg\" /></p>\r\n\r\n	<p>Bosch San. Ve Tic. A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_burgan_logo.jpg\" /></p>\r\n\r\n	<p>Burganbank</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_bursaorganize_l.jpg\" /></p>\r\n\r\n	<p>Bursa Organize Sanayi B&ouml;lge M&uuml;d&uuml;rl&uuml;ğ&uuml;</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/10.jpg\" /></p>\r\n\r\n	<p>Bursa Ticaret Ve Sanayi Odası</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/11.jpg\" /></p>\r\n\r\n	<p>Bursagaz Bursa Şehiri&ccedil;i Doğalgaz Dağıtım Ticaret Ve Taahh&uuml;t A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/12.jpg\" /></p>\r\n\r\n	<p>Bursalı Tekstil Sanayi Ve Ticaret A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/13.jpg\" /></p>\r\n\r\n	<p>Bursalı Tekstil Sanayi Ve Ticaret A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/14.jpg\" /></p>\r\n\r\n	<p>Burtom &Ouml;zel Sağlık Tesisleri A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/b_carrefoursa_l.jpg\" /></p>\r\n\r\n	<p>Carrefoursa (Hp Designjet)</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/55.jpg\" /></p>\r\n\r\n	<p>Cepaş A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_ceva_logo.jpg\" /></p>\r\n\r\n	<p>Ceva Lojistik</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_citi_logo.jpg\" /></p>\r\n\r\n	<p>Citibank</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_cnn_logo.jpg\" /></p>\r\n\r\n	<p>Cnn</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_cocacola_logo.jpg\" /></p>\r\n\r\n	<p>Coca-Cola</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_colgate_logo.jpg\" /></p>\r\n\r\n	<p>Colgate</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/15.jpg\" /></p>\r\n\r\n	<p>Componenta D&ouml;k&uuml;mc&uuml;l&uuml;k Tic. San. A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_corus_logo.jpg\" /></p>\r\n\r\n	<p>Corus &Ccedil;elik</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_crowne_l.jpg\" /></p>\r\n\r\n	<p>Crowne Plaza</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/cvk_l.jpg\" /></p>\r\n\r\n	<p>Cvk Park Bosphorus Hotel</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_calik_logo.jpg\" /></p>\r\n\r\n	<p>&Ccedil;alık Holding</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_celikpan_l.jpg\" /></p>\r\n\r\n	<p>&Ccedil;elikpan</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_deloitte_logo.jpg\" /></p>\r\n\r\n	<p>Deloitte</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_denizbank_logo.jpg\" /></p>\r\n\r\n	<p>Denizbank</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_dhl_logo.jpg\" /></p>\r\n\r\n	<p>Dhl</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/57.jpg\" /></p>\r\n\r\n	<p>Dış İşleri Bakanlığı</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/16.jpg\" /></p>\r\n\r\n	<p>Diniz Adıent Oto Donanım San.Ve Tic.A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_diniz_l.jpg\" /></p>\r\n\r\n	<p>Diniz Holding</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/17.jpg\" /></p>\r\n\r\n	<p>Diniz Holding A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/b_divan_l.jpg\" /></p>\r\n\r\n	<p>Divan Otel</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/22.jpg\" /></p>\r\n\r\n	<p>Diyanet İşleri Başkanlığı</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/21.jpg\" /></p>\r\n\r\n	<p>Diyanet Vakfı</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_dogantelekom_logo.jpg\" /></p>\r\n\r\n	<p>Doğan Telekom</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_doganyayin_logo.jpg\" /></p>\r\n\r\n	<p>Doğan Yayın Holding</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_dsmart_logo.jpg\" /></p>\r\n\r\n	<p>Dsmart</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_durmazlar_l.jpg\" /></p>\r\n\r\n	<p>Durmazlar Makina</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/18.jpg\" /></p>\r\n\r\n	<p>Durmazlar Makina San Ve Tic.A.Ş</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/b_eczacibasi_l.jpg\" /></p>\r\n\r\n	<p>Eczacıbaşı Topluluğu</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/5.jpg\" /></p>\r\n\r\n	<p>Ego Genel M&uuml;d&uuml;rl&uuml;ğ&uuml;</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/50.jpg\" /></p>\r\n\r\n	<p>Elektrik &Uuml;retim Anonim Şirketi - E&uuml;aş</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/elginkan_l.jpg\" /></p>\r\n\r\n	<p>Elginkan</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_elitecard_logo.jpg\" /></p>\r\n\r\n	<p>Elitecard</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/b_elvin_l.jpg\" /></p>\r\n\r\n	<p>Elvin Tekstil</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/artivearti_basari_embill.jpg\" /></p>\r\n\r\n	<p>Embil İla&ccedil; Sanayii</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//1/basari_emerson_logo.jpg\" /></p>\r\n\r\n	<p>Emerson</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/12.jpg\" /></p>\r\n\r\n	<p>Emniyet Genel M&uuml;d&uuml;rl&uuml;ğ&uuml; Bt Daire Başkanlığı</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/13.jpg\" /></p>\r\n\r\n	<p>Emniyet Genel M&uuml;d&uuml;rl&uuml;ğ&uuml; Ka&ccedil;ak&ccedil;ılık Ve Organize İşlerle M&uuml;cadele Daire Başkanlığı</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/14.jpg\" /></p>\r\n\r\n	<p>Emniyet Genel M&uuml;d&uuml;rl&uuml;ğ&uuml; Ter&ouml;rle M&uuml;cadele Daire Başkanlığı</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//5/basari_erikli_logo.jpg\" /></p>\r\n\r\n	<p>Erikli &amp; Nestle Waters</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//2/19.jpg\" /></p>\r\n\r\n	<p>Erkurt Holding A.Ş.</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/8.jpg\" /></p>\r\n\r\n	<p>Eskişehir Doğalgaz Dağıtım&mdash;Esgaz</p>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>\r\n	<p><img alt=\"\" src=\"/images/bhbanner/logolar//3/51.jpg\" /></p>\r\n\r\n	<p>Eti Maden İşletmeleri</p>\r\n	</li>\r\n</ul>', 'true', '2025-03-28 13:11:46', '2025-03-29 08:19:14');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `address`, `phone`) VALUES
(2, 'Duygu Altunay', 'duygu@gmail.com', NULL, '$2y$10$O36Nu8jxraUfhNE/gDoVfOS4riN5.xNg9qV7jbuKsSwrvy/Kshtxi', NULL, NULL, NULL, NULL, 'profile-photos/Ufinc4k001zwdiDpfRWqszJyuhjN2ohWWuCrdJU6.jpg', '2025-03-29 08:14:52', '2025-05-25 03:51:32', NULL, NULL);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `filemanager`
--
ALTER TABLE `filemanager`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Tablo için indeksler `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `filemanager`
--
ALTER TABLE `filemanager`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `houses`
--
ALTER TABLE `houses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- Tablo için AUTO_INCREMENT değeri `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=442;

--
-- Tablo için AUTO_INCREMENT değeri `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
