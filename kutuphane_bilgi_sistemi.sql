-- SQL ifadelerinizi buraya yazınız.

CREATE TABLE `ogrenci`(
    `ogrno` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ograd` VARCHAR(20) NOT NULL,
    `ogrsoyad` VARCHAR(20) NOT NULL,
    `cinsiyet` VARCHAR(1) NOT NULL,
    `dtarih` DATETIME NOT NULL,
    `sinif` VARCHAR(5) NOT NULL,
    `puan` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `ogrenci` ADD PRIMARY KEY `ogrenci_ogrno_primary`(`ogrno`);
CREATE TABLE `tur`(
    `turno` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `turadi` VARCHAR(20) NOT NULL
);
ALTER TABLE
    `tur` ADD PRIMARY KEY `tur_turno_primary`(`turno`);
CREATE TABLE `kitap`(
    `kitapno` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `kitapadi` VARCHAR(50) NOT NULL,
    `sayfasayisi` INT UNSIGNED NOT NULL,
    `puan` INT UNSIGNED NOT NULL,
    `yazarno` BIGINT UNSIGNED NOT NULL,
    `turno` BIGINT UNSIGNED NOT NULL
);
ALTER TABLE
    `kitap` ADD PRIMARY KEY `kitap_kitapno_primary`(`kitapno`);
CREATE TABLE `yazar`(
    `yazarno` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `yazarad` VARCHAR(20) NOT NULL,
    `yazarsoyad` VARCHAR(20) NOT NULL
);
ALTER TABLE
    `yazar` ADD PRIMARY KEY `yazar_yazarno_primary`(`yazarno`);
CREATE TABLE `islem`(
    `islemno` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ogrno` BIGINT UNSIGNED NOT NULL,
    `kitapno` BIGINT UNSIGNED NOT NULL,
    `atarih` DATETIME NOT NULL,
    `vtarih` DATETIME NOT NULL
);
ALTER TABLE
    `islem` ADD PRIMARY KEY `islem_islemno_primary`(`islemno`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_yazarno_foreign` FOREIGN KEY(`yazarno`) REFERENCES `yazar`(`yazarno`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_kitapno_foreign` FOREIGN KEY(`kitapno`) REFERENCES `kitap`(`kitapno`);
ALTER TABLE
    `islem` ADD CONSTRAINT `islem_ogrno_foreign` FOREIGN KEY(`ogrno`) REFERENCES `ogrenci`(`ogrno`);
ALTER TABLE
    `kitap` ADD CONSTRAINT `kitap_turno_foreign` FOREIGN KEY(`turno`) REFERENCES `tur`(`turno`);