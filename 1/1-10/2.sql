CREATE TABLE IF NOT EXISTS TestScores(
  student_id INT NOT NULL
  , subject VARCHAR(20) NOT NULL
  , score INT NOT NULL
);

DELETE FROM TestScores;

INSERT INTO TestScores VALUES(100, '算数', 100);
INSERT INTO TestScores VALUES(100, '国語', 80);
INSERT INTO TestScores VALUES(100, '理科', 80);
INSERT INTO TestScores VALUES(200, '算数', 80);
INSERT INTO TestScores VALUES(200, '国語', 95);
INSERT INTO TestScores VALUES(300, '算数', 40);
INSERT INTO TestScores VALUES(300, '国語', 90);
INSERT INTO TestScores VALUES(300, '社会', 55);
INSERT INTO TestScores VALUES(400, '算数', 80);

SELECT student_id
FROM TestScores
WHERE subject IN ('算数', '国語')
GROUP BY student_id
HAVING 2 = SUM(
  CASE WHEN subject = '算数' and score >= 80 THEN 1
  WHEN subject = '国語' and score >= 50 THEN 1
  ELSE 0 END
);