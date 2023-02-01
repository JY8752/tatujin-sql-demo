CREATE TABLE IF NOT EXISTS Materials2(
  center VARCHAR(10) NOT NULL
  , receive_date DATE NOT NULL
  , material VARCHAR(20) NOT NULL
  , orgland VARCHAR(30) NOT NULL
);

DELETE FROM Materials2;

INSERT INTO Materials2 VALUES("東京", "2007-04-01", "錫", "チリ");
INSERT INTO Materials2 VALUES("東京", "2007-04-12", "亜鉛", "タイ");
INSERT INTO Materials2 VALUES("東京", "2007-05-17", "アルミニウム", "ブラジル");
INSERT INTO Materials2 VALUES("東京", "2007-05-20", "亜鉛", "タイ");
INSERT INTO Materials2 VALUES("大阪", "2007-04-20", "銅", "オーストラリア");
INSERT INTO Materials2 VALUES("大阪", "2007-04-22", "ニッケル", "南アフリカ");
INSERT INTO Materials2 VALUES("大阪", "2007-04-29", "鉛", "インド");
INSERT INTO Materials2 VALUES("名古屋", "2007-03-15", "チタン", "ボリビア");
INSERT INTO Materials2 VALUES("名古屋", "2007-04-01", "炭素銅", "チリ");
INSERT INTO Materials2 VALUES("名古屋", "2007-04-24", "炭素銅", "アルゼンチン");
INSERT INTO Materials2 VALUES("名古屋", "2007-05-02", "マグネシウム", "チリ");
INSERT INTO Materials2 VALUES("名古屋", "2007-05-10", "チタン", "タイ");
INSERT INTO Materials2 VALUES("福岡", "2007-05-10", "亜鉛", "アメリカ");
INSERT INTO Materials2 VALUES("福岡", "2007-05-28", "錫", "ロシア");

SELECT center
FROM Materials2
GROUP BY center
HAVING COUNT(*) <> COUNT(DISTINCT material, orgland)
;