/*
SELECT - LIKE koşulu
LIKE  : sorgulama yaparken belirli kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : sorgulama yaparken buyuk/kucuk harfe duyarsız olarak eslestirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*	

% --> 0 veya daha fazla karakteri belirtir
_ --> Tek bir karakteri belirtir

*/

-- ismi A harfi ile baslayan personeli listele
select * from personel where isim LIKE 'A%';

-- ismi t harfi ile biten personeli listele
select * from personel where isim like '%t';

-- isminin 2. harfi e olan personeli listeleyiniz
select * from personel where isim like '_a%';

-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select * from personel;
select * from personel where isim ~~* 'a%n';

-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
select * from personel where isim ilike '_a_u%';

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select * from personel where isim ilike '%e%' and isim ilike '%r%'; 

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select * from personel where isim ilike '_e%' and isim ilike '%y%';

-- a harfi olmayan personeli listeleyin
select * from personel where isim not ilike '%a%';

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel where isim like 'A_____a%';

--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
select * from personel where isim like '%r_';














