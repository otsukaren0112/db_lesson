-- Q1
CREATE TABLE departments(
  department_id int unsigned,
  name varchar(20),
  created_at timestamp,
  updated_at timestamp
);

-- Q2
ALTER TABLE people add department_id int unsigned AFTER email;

-- Q3
-- departments

-- INSERT INTO テーブル名
-- (カラム1, カラム2, ...カラムn)
-- VALUES
-- (カラム1の値, カラム2の値, ...カラムnの値),
-- (カラム1の値, カラム2の値, ...カラムnの値);


INSERT INTO departments
(name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');


-- people
INSERT INTO people
(name, email, age, gender)
VALUES
('碇しんじ', 'ikari@gizumo.jp', 20, 1),
('綾波れい', 'ayanami@gizumo.jp', 21, 2),
('式波あすか', 'sikinami@gizumo.jp', 28, 2),
('葛城みさと', 'katuragi@gizumo.jp', 43, 2),
('赤城りつこ', 'akagi@gizumo.jp', 30, 2),
('加持りょうじ', 'kazi@gizumo.jp', 30, 1),
('真希波まり', 'makinami@gizumo.jp', 70, 2),
('冬月こうぞう', 'huyutuki@gizumo.jp', 60, 1),
('碇げんどう', 'rokubungi@gizumo.jp', 48, 1),
('渚かおる', 'nagisa@gizumo.jp', 20, 1
);


-- reports
INSERT INTO reports
(content, person_id) VALUES
('エヴァの特訓をしてシンクロ率100%を維持', 1),
('本を沢山読んで碇くんとご飯を食べたの', 2),
('ペンペンと買い物に行ったわ', 3),
('初号機の修復は問題なく完了しました', 4),
('シンクロ率の向上、安定化の研究本日進展なし', 5),
('依頼無事完遂今回の依頼は高く付きますよ冬月さん', 6),
('冬月くん君何を企んでるの？', 7),
('碇そろそろじゃないのかゼーレはどんな反応をするか楽しみだな', 8),
('これもお前の為だユイ待ってろ', 9),
('迎えに来たよ碇シンジくん', 10
);


-- Q4

UPDATE people SET department_id = 1 WHERE name = '碇しんじ';
UPDATE people SET department_id = 1 WHERE name = '綾波れい';
UPDATE people SET department_id = 1 WHERE name = '式波あすか';
UPDATE people SET department_id = 2 WHERE name = '葛城みさと';
UPDATE people SET department_id = 2 WHERE name = '赤城りつこ';
UPDATE people SET department_id = 2 WHERE name = '加持りょうじ';
UPDATE people SET department_id = 2 WHERE name = '真希波まり';
UPDATE people SET department_id = 3 WHERE name = '冬月こうぞう';
UPDATE people SET department_id = 4 WHERE name = '碇げんどう';
UPDATE people SET department_id = 5 WHERE name = '渚かおる';



-- Q5

SELECT name, age
FROM people
WHERE gender = '1'
ORDER BY age DESC;


-- Q6

-- SELECT
--  `name`, `email`, `age`
--FROM
--  `people`
--WHERE
--  `department_id` = 1
--ORDER BY
--  `created_at`;

peopleテーブルから、name,emile,ageカラムを選択して、
department_idから1のレコードだけが表示される様に指定して
created_atカラム（作成日時）で並べている。


-- Q7

SELECT name
FROM people
WHERE (gender = '1' AND age BETWEEN 40 AND 49)
OR (gender = '2' AND age BETWEEN 20 AND 29);


-- Q8

SELECT *
FROM people
WHERE department_id = 1
ORDER BY age ASC;


--Q9

SELECT AVG(age) AS average_age
FROM people
WHERE department_id = 2 AND gender = 2
ORDER BY average_age;


-- Q10

SELECT people.name, departments.name, reports.content
FROM people
INNER JOIN departments ON people.department_id = departments.department_id
INNER JOIN reports ON people.person_id = reports.person_id;


-- Q11

SELECT people.name
FROM people
LEFT JOIN reports ON people.person_id = reports.person_id
WHERE reports.person_id IS NULL;