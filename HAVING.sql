/*
-- GROUP BY -- HAVING --
HAVING ifadesinin islevi WHERE ifadesininkine cok benziyor
Ancak kumeleme fonksiyonlari ile WHERE ifadesi birlikte kullanilmadigindan
HAVING ifadesine ihtiyac duyulmustur
GROUP BY ile kullanilir, gruplamadan sonraki sart icin GROUP BY'dan sonra HAVING kullanilir
*/

-- Maaş ortalaması 3000’den fazla olan ülkelerdeki 
-- erkek çalışanların maaş ortalaması.
select ulke, round(avg(maas),2) from personel
where cinsiyet='E'
group by ulke
having avg(maas)>3000;

--ODEV
--Erkek çalışanların sayısı 1’den fazla olan ülkelerin 
--maaş ortalamasını getiren sorgu







