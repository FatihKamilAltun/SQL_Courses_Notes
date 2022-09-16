--SUBQUERIES --> SORGU içinde çalışan SORGUYA(Alt Sorgu) denir
CREATE TABLE calisanlar2
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
INSERT INTO calisanlar2 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar2 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar2 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar2 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar2 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar2;
select * from markalar;


--SORU -- calisan sayisi 15.000’den cok olan markalarin 
--isimlerini ve bu markada calisanlarin 
--isimlerini ve maaşlarini listeleyin.

SELECT isim, maas, isyeri from calisanlar2
WHERE isyeri IN (SELECT marka_isim from markalar where calisan_sayisi>15000);

--SORU -- marka_id’si 101’den büyük olan
--marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.
SELECT isim, maas, sehir from calisanlar2
where isyeri in (select marka_isim from markalar where marka_id>101);

--SORU -- Ankara’da calisani olan markalarin 
--marka id'lerini ve calisan sayilarini listeleyiniz.

SELECT marka_id, calisan_sayisi from markalar
where marka_isim in (select isyeri from calisanlar2 where sehir='Ankara');




