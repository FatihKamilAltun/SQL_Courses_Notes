-- AGGREGATE METHOD KULLANIMI --
/*
-Agregate Methodları (SUM,COUNT,MIN,MAX,AVG)'dır
-SUM	: Toplar
-COUNT	: Sayar
-MIN 	: En küçük değer
-MAX 	: En büyük değer
-AVG 	: Ortalama
-Subquery icinde de kullanılır
-Ancak sorgu tek bir deger dödürüyor olmalıdır
SYNTAX : sum() şeklinde olmalı sum () yani arasında boşluk olmamalıdır
*/
select * from calisanlar2;

-- Çalışanlar2 tablosundaki en yuksek maas değerini listeleyiniz
select max(maas) from calisanlar2;

-- Çalışanlar tablosundaki maaslarin toplamini listeleyiniz
select sum(maas) from calisanlar2;

-- Çalışanlar tablosundaki maas ortalamalarini listeleyiniz
select avg(maas) from calisanlar2;
select round(avg(maas)) from calisanlar2;
select round(avg(maas),2) from calisanlar2;

-- Çalışanlar2 tablosundaki en dusuk maas değerini listeleyiniz
select min(maas) from calisanlar2;

-- Çalışanlar tablosundaki kaç kişinin maas aldıgını listeleyin
select count(maas) from calisanlar2;

select * from calisanlar2;
select * from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- toplam maaşini listeleyiniz
select marka_isim, calisan_sayisi, (select sum(maas)from calisanlar2 
where marka_isim=isyeri) as toplam_maas from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim, calisan_sayisi, (select max(maas) from calisanlar2 where marka_isim=isyeri) as max_maas,
								   (select min(maas) from calisanlar2 where marka_isim=isyeri) as min_maas
								   from markalar;
								   
--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu 
--listeleyen bir SORGU yaziniz.
select marka_id, marka_isim, (select count(sehir) from calisanlar2 where marka_isim=isyeri) as sehir_sayisi from markalar;

--Interview Question: En yüksek ikinci maas değerini çağırın.
select * from calisanlar2;
select max(maas) as enyuksek_ikinci_maas from calisanlar2
where maas < (select max(maas) from calisanlar2);

----Interview Question: En düşük ikinci maas değerini çağırın.
select min(maas) as en_dusuk_ikinci_maas from calisanlar2
where maas> (select min(maas) from calisanlar2);

--En yüksek üçüncü maas değerini bulun
select max(maas) as enyuksek_ucuncu_maas from calisanlar2
where maas<(select max(maas) from calisanlar2 where maas<(select max(maas) from calisanlar2));

--En düşük üçüncü maas değerini bulun



































