# SQL Sorgu Alıştırmaları

Bu hafta SQL sorguları üzerine çalışıyorsunuz. Bugünkü alıştırmada sıfırdan bir veritabanı oluşturacak ve aşağıda istenenleri SQL sorgu olarak oluşturacaksınız.

# Proje Kurulumu

Projeyi forklayın ve clonlayın. Tamamladığınızda da pushlayın.

## Görev 1: Kütüphane Bilgi Sistemi için Tablo Tasarımı

Bu veritabanı, bir okulun kütüphanesinden öğrencilerin aldıkları kitapların bilgisini barındıracak.
Aşağıda tablolar ve şemaları verilmiş.

[ ] Bu tabloların tasarımını online olarak veya bilgisayarınızda bir yazılım kullanarak dizayn ediniz. (örn: [drawsql.app](https://drawsql.app/)
[ ] Resim olarak proje dosyasına ekleyiniz.

-- Tablolar

`ogrenci` tablosu öğrencilerin listesini tutar.

| field    | data type        | metadata                                      |
| :------- | :--------------- | :-------------------------------------------- |
| id       | unsigned integer | primary key, auto-increments, generated by db |
| ad       | string           | required                                      |
| soyad    | string           | required                                      |
| dtarih   | string           | required                                      |
| cinsiyet | string           | required                                      |
| sinif    | string           | required                                      |
| puan     | unsigned integer | required                                      |

`islem` tablosu öğrencilerin kütüphaneden aldıkları kitapların bilgilerini tutar

| field      | data type        | metadata                                      |
| :--------- | :--------------- | :-------------------------------------------- |
| id         | unsigned integer | primary key, auto-increments, generated by db |
| ogrenci_id | unsigned integer | foreign key referencing ogrenci.id, required  |
| kitap_id   | unsigned integer | foreign key referencing kitap.id, required    |
| atarih     | string           | required                                      |
| vtarih     | string           | required                                      |

`kitap` tablosu kütüphanedeki kitapların bilgisini tutar

| field       | data type        | metadata                                      |
| :---------- | :--------------- | :-------------------------------------------- |
| id          | unsigned integer | primary key, auto-increments, generated by db |
| ad          | string           | required                                      |
| sayfasayisi | unsigned integer | required                                      |
| puan        | unsigned integer | required                                      |
| yazar_id    | unsigned integer | foreign key referencing yazar.id, required    |
| tur_id      | unsigned integer | foreign key referencing tur.id, required      |

`yazar` tablosu kitapların yazarları bilgisini tutar

| field | data type        | metadata                                      |
| :---- | :--------------- | :-------------------------------------------- |
| id    | unsigned integer | primary key, auto-increments, generated by db |
| ad    | string           | required                                      |
| soyad | string           | required                                      |

`tur` tablosu kitapların türlerini tutar.

| field | data type        | metadata                                      |
| :---- | :--------------- | :-------------------------------------------- |
| id    | unsigned integer | primary key, auto-increments, generated by db |
| ad    | string           | required                                      |

### Görev 2: SQL İfadeleri

[ ] Görev 1'de tasarımını yaptığınız tabloları DB'de oluşturan komutları kutuphane_bilgi_sistemi.sql dosyasında oluşturunuz.

#### Görev 3:

[ ] veriler.sql içindeki hataları düzelterek, verileri veritabanınıza ekleyiniz.

##### Görev 4:

[ ] Aşağıda istenen değişiklikleri tablolarda yapacak SQL ifadeleri yazınız.

1- öğrenci tablosuna 'sehir' alanı ekleyiniz.

Alter Table ogrenci Add Column sehir varchar(20) NOT NULL AFTER ogrsoyad ;

2- tablolarda veri olarak tarih geçen alanlarda veri tipini string yerine DateTime olarak ayarlayınız.

Alter Table ogrenci Change Column dtarih dtarih DATETIME NOT NULL; Alter Table islem Change Column atarih atarih DATETIME NOT NULL; Alter Table islem Change Column vtarih vtarih DATETIME NOT NULL;

3- öğrenci tablosuna 'dogum_yeri' alanı ekleyiniz ve default değerini 'Türkiye' yapınız.

Alter Table ogrenci Add Column dogum_yeri varchar(10) NOT NULL DEFAULT Türkiye AFTER dtarih

4- öğrenci tablosundan 'puan' alanını siliniz.

Alter Table ogrenci Drop Column puan

5- öğrenciler tablosundaki kiz öğrencileri alarak kiz_ogrenciler tablosu oluşturunuz.

Create Table kiz_ogrenciler as select \* from ogrenci where cinsiyet="K"

6- kiz_ogrenciler tablosunu siliniz.

Drop Table kiz_ogrenciler

7- kiz_yurdu tablosu oluşturunuz(sadece 'ad' alanı olsun). 1 kayıt ekleyiniz. öğrenci tablosundaki kız öğrencileri kullanarak kiz_yurdunda_kalanlar tablosu oluşturunuz

Create Table kiz_yurdu (ad varchar(20) NOT NULL) Create Table kiz_yurdunda_kalanlar as select \* from ogrenci where cinsiyet="K"

8- kiz_ogrenciler tablosunun adını kogrenciler olarak değiştiriniz

Alter table kiz_ogrenciler rename to kogrenciler;

9- yazar tablosundaki 'ad' alanının adını 'name' olarak güncelleyiniz.

Alter table yazar rename column yazarad to yazarname;

10- yazar tablosuna 'ulke' ve 'universite' alanları ekleyiniz 'ulke'nin default değeri 'Türkiye' olsun.

Alter Table yazar Add Column ulke varchar(10) NOT NULL DEFAULT Türkiye AFTER yazarsoyad Alter Table yazar Add Column universite varchar(50) NULL AFTER yazarsoyad

11- tablo ilişkilerine 5'er tane örnek veriniz (1-1, 1-n, n-n)

1.n : bir postun birden fazla yorumu olması 1-1: birey tckn n-n : öğretmen öğrenci
