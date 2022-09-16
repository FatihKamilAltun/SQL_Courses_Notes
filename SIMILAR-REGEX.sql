-- SELECT - SIMILAR TO - REGEX (Regular Expressions) --
/*
SIMILAR TO: Daha karmasik pattern (kalıp) ile sorgulama islemi icin SIMILAR TO kullanılabilir.
Sadece PostgreSQL'de kullanilir. Büyük küçük harf onemlidir.

REGEX	: Herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının 
aranıp bulunmasını sağlayan kendine ait bir söz dizimi olan bir yapıdır. MySQL'de (REGEXP_LIKE) olarak kullanılır
PostgreSWL'de "~" karakteri ile kullanılır
*/
CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1005, 'hct', 3);
INSERT INTO kelimeler VALUES (1006, 'adem', 4);
INSERT INTO kelimeler VALUES (1007, 'selim', 5);
INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hip', 3);
INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
select * from kelimeler;

-- SORU:  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- veya işlemi için | karakteri kullanılır
--SIMILAR TO ile
select * from kelimeler where kelime similar to '%(at|ot|At|aT|Ot|oT|AT|OT)%';

--LIKE ile
select * from kelimeler where kelime ilike '%ot%' or kelime ilike '%at%';
select * from kelimeler where kelime ~~* '%ot%' or kelime ~~* '%at%';

--REGEX ile
select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at';

--SORU : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--SIMILAR TO ile
select * from kelimeler where kelime similar to '%(ho|hi)%';

--LIKE ile
select * from kelimeler where kelime ~~* '%ho%' or kelime ~~* '%hi%';

--REGEX ile
select * from kelimeler where kelime ~* 'h[oi](.*)'; -- Regex'te ".(nokta) bir karakteri temsil eder"
-- Regex'te ikinci karakter icin koseli parantez kullanilir. * hepsi anlaminda kullanilir  
   
--SORU : Sonu 't' veya 'm' ile bitenleri listeleyeniz
--LIKE ile
select * from kelimeler where kelime ilike '%t' or kelime ilike '%m'; 
select * from kelimeler where kelime ~~* '%t' or kelime ~~* '%r';
--REGEX ile
select * from kelimeler where kelime ~* '.*[tm]$'; -- $ karakteri bitişi gösterir
--SIMILAR TO ile
SELECT * FROM kelimeler where kelime similar to '%t|%m';

--SORU: h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--LIKE ile
select * from kelimeler where kelime ilike 'h_t';
--SIMILAR TO ile 
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';
--REGEX ile
select * from kelimeler where kelime ~*'(.*[h_t]$)';
   
--SORU : --İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan
--“kelime" değerlerini çağırın.
--SIMILAR TO ile
SELECT kelime from kelimeler where kelime similar to 'h[a-e]%t';
--REGEX ile
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t';
--LIKE ile
--select kelime from kelimeler where kelime ilike 'h(a-e)%t'; ---?????????????????
   
--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime similar to '[s,a,y]%';
select * from kelimeler where kelime ~ '^[s,a,y](.*)'; -- ^ başlangıcı temsil eder

select * from kelimeler where kelime ~ '(.*)[m,a,f]$';

--SORU : --İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
--SIMILAR TO ile
SELECT * from kelimeler where kelime similar to 'h[a|i]t';  
--REGEX ile
select * from kelimeler where kelime ~ '^h[a|i]t$';
  
--SORU : --İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select * from kelimeler where kelime ~'^[b-s].l(.*)';

--SORU : --içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
SELECT * FROM kelimeler where kelime similar to '%[o][o]%';
SELECT * FROM kelimeler where kelime similar to '%[o]{2}%'; -- süslü ile belirtilen yerdeki rakam bir önceki parantez içinde kaç tane olduğunu belirtir

--SORU : --içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
SELECT * FROM kelimeler where kelime similar to '%[o]{4}%';
   
--SORU : --'a', 's' yada 'y' ile başlayan VE 
--'m' yada 'f' ile biten "kelime" değerlerini çağırın.
SELECT * FROM kelimeler where kelime ~ '^[a|s|y](.*)' and kelime ~ '(.*)[m|f]$';

   