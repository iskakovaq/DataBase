--------Part 1.
--------1.C(1,2,4,6) Natural join - это соединение которое создает неявное соединение
--------на основе тех же имен стобцов в соединенных таблицах. Если каждый tuple
-------- имеет схему (A, B, C, D) то и соответсвенно ответом будет(1,2,4,6).
--------2.D(2, 5, 3,) Оператор INTERSECT возвращает все строки, доступные в обоих наборах
--------результатов. R and S имеют общий tuple (2,5, 3)
--------3.A(Student.sID, College.cName)  данные таблицы организованы в кластерном индексе
----- потому что запросы к данным запрашиваются быстрее и эффективнее. Кластерный индекс состоит из страниц индекса и данных. поэтому ответ а.
--------4.D None of the above because they do not have clear relations
--------5.C (c >= (SELECT SUM(b) FROM R) ) 5С  позволяет нам указать , что значение в определенном
--------столбце должен удовлетворять Boolean (truth- value) значениe. В этом слуае мы выставляем
--------значения (4,4,9), а вариант С не позволяет нам выполнить эту вставку, потому что
------условием явлется то, что sum (b) must be <= inserting number c is 9 and sum(b) is 4+3+3=10 a 10!=9
---------Part 2.
SELECT title ,AVG(stars) AS average
FROM MOVIE
INNER JOIN  Rating USING (mID)
GROUP BY  mID
ORDER BY average DESC, title; ------------6;

SELECT title , MIN(stars)
FROM Movie
INNER JOIN  Rating Using(mID)
GROUP BY  mID
ORDER BY title; ----------7;

SELECT  DISTINCT  name
FROM  Reviewer, Rating
Where REVIEWER.rID= RATING.rID
   AND Rating.ratingDate IS NULL; -------------8;

CREATE MATERIALIZED VIEW  movie AS
    SELECT  title
from movie
WHERE  mID NOT IN (SELECT  mID FROM Rating); ---------9;

CREATE  ROLE  movierole;
GRANT SELECT,
    INSERT ON  moviee TO movierole; -----------10;
