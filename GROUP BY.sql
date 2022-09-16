-- GROUP BY --
/*
GROUP BY cumlecigi bir select ifadesinde satirlari sutunlari 
degerlerine gore ozet olarak gruplamak icin kullanilir
GROPU BY cumlecigi her grup basina satir dondurur
GROUP BY genelde AVG(), COUNT(), MAX(), MIN(), ve SUM() gibi 
aggregate fonksiyonlari ile birlikte kullanilir
*/

CREATE TABLE manav 
(
isim varchar(50), 
urun_adi varchar(50), 
urun_miktari int 
); 
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', null, 2);

create table personel
(id int primary key,
ad varchar(20),
soyad varchar(20),
yas int,
cinsiyet char,
sehir varchar(20),
ulke varchar(20),
maas int
);
insert into personel values(100, 'Eymen',  'Bal', '25', 'E', 'Istanbul', 'Turkiye', '20000');
insert into personel values(101, 'Derya', 'Soylu', '35', 'K', 'Istanbul', 'Turkiye', '25000');
insert into personel values(102, 'Enes', 'Boz', '55', 'E', 'Istanbul', 'Turkiye', '22000');
insert into personel values(103, 'Nil', 'Naz', '45', 'K', 'Trabzon', 'Turkiye', '20000');
insert into personel values(104, 'Ali', 'Can', '28', 'E', 'Ankara', 'Turkiye', '15000');
insert into personel values(105, 'Yusuf', 'Cengiz', '46', 'E', 'Bolu', 'Turkiye', '30000');
insert into personel values(106, 'Ahmet', 'Aslan', '38', 'E', 'Adana', 'Turkiye', '28000');
insert into personel values(107, 'Mehmet', 'Aslan', '29', 'E', 'Gaziantep', 'Turkiye', '21000');
insert into personel values(108, 'Sena', 'Yavuz', '49', 'K', 'New York', 'USA', '40000');
insert into personel values(109, 'Zehra', 'Amber', '52', 'K', 'New York', 'USA', '45000');
insert into personel values(110, 'Fatma', 'Nur', '33', 'K', 'Berlin', 'Almanya', '35000');
insert into personel values(111, 'Mustafa', 'Bay', '44', 'E', 'Paris', 'Fransa', '34000');
insert into personel values(112, 'Murat', 'Kerem', '28', 'E', 'Istanbul', 'Turkiye', '29000');
insert into personel values(113, 'Sinan', 'Ay', '45', 'E', 'Izmir', 'Turkiye', '19000');
insert into personel values(114, 'Figen', 'Bal', '55', 'K', 'Istanbul', 'Turkiye', '25000');
insert into personel values(115, 'Serkan', 'Bayram', '36', 'E', 'Londra', 'Ingiltere', '50000');
insert into personel values(116, 'Hakan', 'Bacak', '29', 'E', 'Londra', 'Ingiltere', '55000');
insert into personel values(117, 'Zafer', 'Yanak', '47', 'E', 'Berlin', 'Almanya', '42000');
insert into personel values(118, 'Birol', 'Kara', '37', 'E', 'Paris', 'Fransa', '41000');
insert into personel values(119, 'Ayten', 'Tan', '32', 'K', 'Roma', 'Italya', '39000');

select * from manav;
select * from personel;

-- kisi ismine göre satılan toplam meyve miktarlarını 
-- gösteren sorguyu yazınız.
select isim, sum(urun_miktari) from manav
group by isim;

-- satılan meyve türüne (urun_adi) göre urun alan 
--kişi sayısını gösteren sorguyu yazınız. 
--NULL olarak girilen meyveyi listelemesin.
select urun_adi, count(isim) as kisi_sayisi from manav 
where urun_adi is not null 
group by urun_adi;

-- satılan meyve türüne (urun_adi) göre satılan (urun_miktari )
--MIN ve MAX urun miktarlarini, MAX urun miktarina göre sıralayarak 
--listeyen sorguyu yazınız.
select urun_adi, min(urun_miktari) as min_urn_miktari, max(urun_miktari) as max_urn_miktari from manav
where urun_adi is not null
group by urun_adi
order by max_urn_miktari;

-- kisi ismine ve urun adına göre satılan ürünlerin toplamını gruplandıran
-- ve isime göre ters sırasıda listeyen sorguyu yazınız.
select isim, urun_adi, SUM(urun_miktari) as toplam_urun from manav
group by isim, urun_adi
order by isim desc;

-- personelin calıştığı ülkeleri listeleyiniz
select ulke from personel group by ulke;

-- Ülkelere göre ortalama maaşları listeleyiniz
select ulke,round(avg(maas),2) as ort_maas from personel
group by ulke;

-- Maas ortalamasını bayanlar ve baylar olarak sorgulayınız
select cinsiyet, round(avg(maas),2) as ortalama_maas
from personel
group by cinsiyet;

-- Personelin, ulkelere göre ve şehirlere göre gruplayarak sorgulayın
select ulke, sehir from personel
group by ulke, sehir;

-- Personelin, ulkelere göre ve şehirler göre calışan sayısını sorgulayın.
select ulke,sehir, count(sehir) as calisan_sayisi from personel
group by ulke,sehir;

-- Her ulke için bay ve bayan çalışan sayısı ve yaş ortalamasını sorgulayınız.
select ulke, cinsiyet,count(*) as calisan_sayisi,round(avg(yas),2) from personel
group by ulke,cinsiyet;

-- Her ulke için bay ve bayan çalışan sayısı ve 
--yaş ortalamasını  ve maası 30000 den büyük olanları sorgulayınız.
select ulke,cinsiyet, round(avg(yas),2), count(*)  from personel
where maas>30000
group by ulke,cinsiyet;

-- Her ulke için; bay ve bayan çalışan sayısı, 
-- yaş ortalamasını, maaşı 30000 den büyük olanları
-- ve ortalama yaşı büyükten küçüğe doğru sıralayınız.
select ulke, cinsiyet, round(avg(yas),2) as ortalama_yas, count(*) from personel 
where maas>30000
group by ulke, cinsiyet
order by ortalama_yas desc;
