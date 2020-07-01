CREATE TABLESPACE bimakurnia07053
DATAFILE 'E:\Bima\ITATS\Tugas Semester 4\Basis Data\Table Space\bimakurnia_07053.dbf'
SIZE 30M;

CREATE USER bimakurnia_07053
IDENTIFIED BY system
DEFAULT TABLESPACE bimakurnia07053
QUOTA 30M ON bimakurnia07053;

GRANT ALL PRIVILEGES TO bimakurnia_07053;

CONN bimakurnia_07053/system

CREATE TABLE pegawai_07053(
id_pegawai INTEGER NOT NULL,
nama VARCHAR2(30),
alamat VARCHAR2(50),
no_telepon VARCHAR2(13),
password VARCHAR2(30),
CONSTRAINT pk_pegawai PRIMARY KEY (id_pegawai));

CREATE TABLE hewan_07053(
id_hewan INTEGER NOT NULL,
nama VARCHAR2(30),
umur VARCHAR2(10),
status VARCHAR2(20),
CONSTRAINT pk_hewan PRIMARY KEY (id_hewan));

CREATE TABLE transaksi_beli_07053(
id_beli INTEGER NOT NULL,
id_hewan INTEGER,
id_pegawai INTEGER,
harga_beli INTEGER,
tanggal_beli DATE,
CONSTRAINT pk_transaksi_beli PRIMARY KEY (id_beli));

CREATE TABLE transaksi_jual_07053(
id_jual INTEGER NOT NULL,
id_beli INTEGER,
id_pegawai INTEGER,
harga_jual INTEGER,
tanggal_jual DATE,
keuntungan INTEGER,
CONSTRAINT pk_transaksi_jual PRIMARY KEY (id_jual));

ALTER TABLE transaksi_beli_07053
ADD CONSTRAINT fk_id_hewan FOREIGN KEY (id_hewan)
REFERENCES hewan_07053(id_hewan)
ADD CONSTRAINT fk_id_pegawai FOREIGN KEY (id_pegawai)
REFERENCES pegawai_07053(id_pegawai);

ALTER TABLE transaksi_jual_07053
ADD CONSTRAINT fk_id_beli FOREIGN KEY (id_beli)
REFERENCES transaksi_beli_07053(id_beli)
ADD CONSTRAINT fk_id_pegawai2 FOREIGN KEY (id_pegawai)
REFERENCES pegawai_07053(id_pegawai);

CREATE SEQUENCE id_pegawai
MINVALUE 1
MAXVALUE 9999
START WITH 6
INCREMENT BY 1
CACHE 20;

INSERT INTO pegawai_07053
(id_pegawai, nama, alamat, no_telepon, password) VALUES
(id_pegawai.NEXTVAL, 'Budi', 'Surabaya', '089621254097', 'budi123');

SELECT * FROM pegawai_07053;

ALTER TABLE pegawai_07053
RENAME COLUMN alamat TO 07053_alamat;

ALTER TABLE pegawai_07053
ADD CONSTRAINT unique_no_telepon
UNIQUE (no_telepon);

ALTER TABLE hewan_07053
MODIFY(umur INTEGER);

ALTER TABLE transaksi_beli_07053
ADD id_jual INTEGER;

ALTER TABLE transaksi_beli_07053
ADD CONSTRAINT fk_id_jual FOREIGN KEY (id_jual)
REFERENCES transaksi_jual_07053 (id_jual);

CREATE SEQUENCE id_hewan
MINVALUE 1
MAXVALUE 9999
START WITH 6
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE id_beli
MINVALUE 1
MAXVALUE 9999
START WITH 6
INCREMENT BY 1
CACHE 20;

CREATE SEQUENCE id_jual
MINVALUE 1
MAXVALUE 9999
START WITH 6
INCREMENT BY 1
CACHE 20;

INSERT INTO hewan_07053 VALUES (1, 'Sapi', 1, 'belum terjual');

INSERT INTO hewan_07053 VALUES (2, 'Kambing', 2, 'belum terjual');

INSERT ALL
INTO hewan_07053 (id_hewan, nama, umur, status) VALUES (3, 'Domba', 3, 'belum terjual')
INTO hewan_07053 (id_hewan, nama, umur, status) VALUES (4, 'Sapi', 4, 'belum terjual')
INTO hewan_07053 (id_hewan, nama, umur, status) VALUES (5, 'Ayam', 5, 'belum terjual')
SELECT 1 FROM dual;

INSERT INTO hewan_07053 VALUES (id_hewan.NEXTVAL, 'Domba', 6, 'belum terjual');

INSERT INTO hewan_07053 VALUES (id_hewan.NEXTVAL, 'Ayam', 7, 'belum terjual');

INSERT INTO hewan_07053 VALUES (id_hewan.NEXTVAL, 'Bebek', 8, 'belum terjual');

INSERT INTO hewan_07053 VALUES (id_hewan.NEXTVAL, 'Kelinci', 9, 'belum terjual');

INSERT INTO hewan_07053 VALUES (id_hewan.NEXTVAL, 'Kuda', 10, 'belum terjual');

INSERT INTO pegawai_07053 VALUES (1, 'Restu', 'Jombang', '085644312441', 'restu123');

INSERT INTO pegawai_07053 VALUES (2, 'Ikhlasul', 'Rangkah', '085644311233', 'ikhlas123');

INSERT ALL
INTO pegawai_07053 (id_pegawai, nama, alamat, no_telepon, password) VALUES (3, 'Daffa', 'Peneleh', '082344344453', 'daffa123')
INTO pegawai_07053 (id_pegawai, nama, alamat, no_telepon, password) VALUES (4, 'Nicholas', 'Wedoro', '082344342216', 'nichol123')
INTO pegawai_07053 (id_pegawai, nama, alamat, no_telepon, password) VALUES (5, 'Zen', 'Kenjeran', '085634434466', 'zen123')
SELECT 1 FROM dual;

INSERT INTO pegawai_07053 VALUES (id_pegawai.NEXTVAL, 'Adi', 'Wiyung', '082177664532', 'adi123');

INSERT INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (1, 1, 1, 1000000, TO_DATE('01/01/2020', 'dd/mm/yyyy'));

INSERT INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (2, 2, 2, 2000000, TO_DATE('02/01/2020', 'dd/mm/yyyy'));

INSERT ALL
INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (3, 3, 3, 3000000, TO_DATE('03/01/2020', 'dd/mm/yyyy'))
INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (4, 4, 4, 4000000, TO_DATE('04/01/2020', 'dd/mm/yyyy'))
INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (5, 5, 5, 5000000, TO_DATE('05/01/2020', 'dd/mm/yyyy'))
SELECT 1 FROM dual;

INSERT INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (id_beli.NEXTVAL, 6, 6, 6000000, TO_DATE('06/01/2020', 'dd/mm/yyyy'));

INSERT INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (id_beli.NEXTVAL, 7, 1, 7000000, TO_DATE('07/01/2020', 'dd/mm/yyyy'));

INSERT INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (id_beli.NEXTVAL, 8, 2, 8000000, TO_DATE('08/01/2020', 'dd/mm/yyyy'));

INSERT INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (id_beli.NEXTVAL, 9, 3, 9000000, TO_DATE('09/01/2020', 'dd/mm/yyyy'));

INSERT INTO transaksi_beli_07053 (id_beli, id_hewan, id_pegawai, harga_beli, tanggal_beli) VALUES (id_beli.NEXTVAL, 10, 4, 10000000, TO_DATE('10/01/2020', 'dd/mm/yyyy'));

INSERT INTO transaksi_jual_07053 VALUES (1, 1, 1, 11000000, TO_DATE('01/09/2020', 'dd/mm/yyyy'), 10000000);

INSERT INTO transaksi_jual_07053 VALUES (2, 2, 2, 12000000, TO_DATE('02/09/2020', 'dd/mm/yyyy'), 10000000);

INSERT ALL
INTO transaksi_jual_07053 (id_jual, id_beli, id_pegawai, harga_jual, tanggal_jual, keuntungan) VALUES (3, 3, 3, 13000000, TO_DATE('03/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 (id_jual, id_beli, id_pegawai, harga_jual, tanggal_jual, keuntungan) VALUES (4, 4, 4, 14000000, TO_DATE('04/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 (id_jual, id_beli, id_pegawai, harga_jual, tanggal_jual, keuntungan) VALUES (5, 5, 5, 15000000, TO_DATE('05/09/2020', 'dd/mm/yyyy'), 10000000)
SELECT 1 FROM dual;

INSERT INTO transaksi_jual_07053 VALUES (id_jual.NEXTVAL, 6, 6, 16000000, TO_DATE('06/09/2020', 'dd/mm/yyyy'), 10000000);

INSERT INTO transaksi_jual_07053 VALUES (id_jual.NEXTVAL, 7, 1, 17000000, TO_DATE('07/09/2020', 'dd/mm/yyyy'), 10000000);

INSERT INTO transaksi_jual_07053 VALUES (id_jual.NEXTVAL, 8, 2, 18000000, TO_DATE('08/09/2020', 'dd/mm/yyyy'), 10000000);

INSERT INTO transaksi_jual_07053 VALUES (id_jual.NEXTVAL, 9, 3, 19000000, TO_DATE('09/09/2020', 'dd/mm/yyyy'), 10000000);

INSERT INTO transaksi_jual_07053 VALUES (id_jual.NEXTVAL, 10, 4, 20000000, TO_DATE('10/09/2020', 'dd/mm/yyyy'), 10000000);

SELECT * FROM hewan_07053;

UPDATE hewan_07053 SET umur = umur * 2;

SELECT * FROM hewan_07053;

SELECT * FROM transaksi_beli_07053;

UPDATE transaksi_beli_07053 SET id_jual = 1 WHERE id_beli = 1;

UPDATE transaksi_beli_07053 SET id_jual = 2 WHERE id_beli = 2;

UPDATE transaksi_beli_07053 SET id_jual = 3 WHERE id_beli = 3;

UPDATE transaksi_beli_07053 SET id_jual = 4 WHERE id_beli = 4;

UPDATE transaksi_beli_07053 SET id_jual = 5 WHERE id_beli = 5;

UPDATE transaksi_beli_07053 SET id_jual = 6 WHERE id_beli = 6;

UPDATE transaksi_beli_07053 SET id_jual = 7 WHERE id_beli = 7;

UPDATE transaksi_beli_07053 SET id_jual = 8 WHERE id_beli = 8;

UPDATE transaksi_beli_07053 SET id_jual =  WHERE id_beli = 9;

UPDATE transaksi_beli_07053 SET id_jual = 10 WHERE id_beli = 10;

SELECT * FROM transaksi_beli_07053;

SELECT * FROM pegawai_07053;

UPDATE pegawai_07053 SET nama = 'Singgih' WHERE nama LIKE 'R%u';

UPDATE pegawai_07053 SET nama = 'Amal' WHERE nama LIKE 'I%';

UPDATE pegawai_07053 SET nama = 'Rahmatul' WHERE nama LIKE '%fa';

UPDATE pegawai_07053 SET nama = 'Sumardi' WHERE nama LIKE '%chol%';

UPDATE pegawai_07053 SET nama = 'Mustafa' WHERE nama LIKE 'Z%';

SELECT * FROM pegawai_07053;

SELECT * FROM transaksi_jual_07053;

UPDATE transaksi_jual_07053 SET harga_jual = 12000000, keuntungan = 11000000 WHERE (id_jual = 1 OR id_beli = 1) AND id_pegawai = 1;

UPDATE transaksi_jual_07053 SET harga_jual = 13000000, keuntungan = 11000000 WHERE (id_jual = 2 OR id_beli = 2) AND id_pegawai = 2;

UPDATE transaksi_jual_07053 SET harga_jual = 14000000, keuntungan = 11000000 WHERE (id_jual = 3 OR id_beli = 3) AND id_pegawai = 3;

UPDATE transaksi_jual_07053 SET harga_jual = 15000000, keuntungan = 11000000 WHERE (id_jual = 4 OR id_beli = 4) AND id_pegawai = 4;

UPDATE transaksi_jual_07053 SET harga_jual = 16000000, keuntungan = 11000000 WHERE (id_jual = 5 OR id_beli = 5) AND id_pegawai = 5;

SELECT * FROM transaksi_jual_07053;

SELECT * FROM transaksi_jual_07053;

DELETE FROM transaksi_jual_07053 WHERE harga_jual < 18000000 AND id_jual BETWEEN 7 AND 8;

DELETE FROM transaksi_jual_07053 WHERE id_jual = 6 OR tanggal_jual LIKE '%6%';

DELETE FROM transaksi_jual_07053 WHERE id_jual < 10 AND tanggal_jual LIKE '%9%';

SELECT * FROM transaksi_jual_07053;

SAVEPOINT savepoint_1;

SELECT * FROM transaksi_jual_07053;

UPDATE transaksi_jual_07053 SET harga_jual = 19000000, keuntungan = 11000000 WHERE id_jual = 8;

SELECT * FROM transaksi_jual_07053;

COMMIT;

ROLLBACK TO savepoint_1;

ROLLBACK;

SELECT * FROM transaksi_jual_07053;

SELECT * FROM hewan_07053
ORDER BY umur DESC;

SELECT nama FROM hewan_07053 GROUP BY nama;

INSERT ALL
INTO pegawai_07053 VALUES (11, 'Budi', 'Perak', '081111111111', 'budi123')
INTO pegawai_07053 VALUES (12, 'Iwan', 'Mlaten', '081111111112', 'iwan123')
INTO pegawai_07053 VALUES (13, 'Jarwo', 'Kedungdoro', '081111111113', 'jarwo123')
INTO pegawai_07053 VALUES (14, 'Lolita', 'Wonokromo', '081111111114', 'lolita123')
INTO pegawai_07053 VALUES (15, 'Samid', 'Buduran', '081111111115', 'samid123')
SELECT 1 FROM dual;

INSERT ALL
INTO hewan_07053 VALUES (11, 'Sapi', 1, 'belum terjual')
INTO hewan_07053 VALUES (12, 'Ayam', 2, 'belum terjual')
INTO hewan_07053 VALUES (13, 'Kelinci', 3, 'belum terjual')
INTO hewan_07053 VALUES (14, 'Puyuh', 4, 'belum terjual')
INTO hewan_07053 VALUES (15, 'Kuda', 5, 'belum terjual')
SELECT 1 FROM dual;

INSERT ALL
INTO transaksi_beli_07053 VALUES (11, 11, 11, 11000000, TO_DATE('11/01/2020', 'dd/mm/yyyy'), NULL)
INTO transaksi_beli_07053 VALUES (12, 12, 12, 12000000, TO_DATE('12/01/2020', 'dd/mm/yyyy'), NULL)
INTO transaksi_beli_07053 VALUES (13, 13, 13, 13000000, TO_DATE('13/01/2020', 'dd/mm/yyyy'), NULL)
INTO transaksi_beli_07053 VALUES (14, 14, 14, 14000000, TO_DATE('14/01/2020', 'dd/mm/yyyy'), NULL)
INTO transaksi_beli_07053 VALUES (15, 15, 15, 15000000, TO_DATE('15/01/2020', 'dd/mm/yyyy'), NULL)
SELECT 1 FROM dual;

INSERT ALL
INTO transaksi_jual_07053 VALUES (11, 11, 11, 21000000, TO_DATE('11/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 VALUES (12, 12, 12, 22000000, TO_DATE('12/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 VALUES (13, 13, 13, 23000000, TO_DATE('13/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 VALUES (14, 14, 14, 24000000, TO_DATE('14/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 VALUES (15, 15, 15, 25000000, TO_DATE('15/09/2020', 'dd/mm/yyyy'), 10000000)
SELECT 1 FROM dual;

SELECT * FROM transaksi_beli_07053;

UPDATE transaksi_beli_07053 SET id_jual = 11 WHERE id_beli = 11;

UPDATE transaksi_beli_07053 SET id_jual = 12 WHERE id_beli = 12;

UPDATE transaksi_beli_07053 SET id_jual = 13 WHERE id_beli = 13;

UPDATE transaksi_beli_07053 SET id_jual = 14 WHERE id_beli = 14;

UPDATE transaksi_beli_07053 SET id_jual = 15 WHERE id_beli = 15;

SELECT * FROM transaksi_beli_07053;

SELECT nama, MAX(umur) AS umur_tertinggi, MIN(umur) AS umur_terendah
FROM hewan_07053
GROUP BY nama;

SELECT nama, COUNT(nama) AS banyak_hewan
FROM hewan_07053 WHERE id_hewan <= 10 AND status LIKE '%belum%'
GROUP BY nama; 

SELECT nama, SUM(umur) AS total_umur
FROM hewan_07053 WHERE nama LIKE 'Ayam'
GROUP BY nama;

SELECT nama AS hewan_harga_terendah_tertinggi FROM hewan_07053 WHERE id_hewan = (SELECT id_hewan FROM transaksi_beli_07053 WHERE harga_beli = (SELECT MAX(harga_beli) FROM transaksi_beli_07053)) OR id_hewan = (SELECT id_hewan FROM transaksi_beli_07053 WHERE harga_beli = (SELECT MIN(harga_beli) FROM transaksi_beli_07053));

SELECT nama AS nama_pegawai,
(SELECT COUNT(*) FROM transaksi_beli_07053 WHERE transaksi_beli_07053.id_pegawai = pegawai_07053.id_pegawai AND pegawai_07053.no_telepon IS NOT NULL) AS jumlah_transaksi_ditangani
FROM pegawai_07053;

SELECT nama AS nama_pegawai, (SELECT SUM(harga_beli)
FROM transaksi_beli_07053 WHERE transaksi_beli_07053.id_pegawai = pegawai_07053.id_pegawai) AS hasil_transaksi_beli_ditangani
FROM pegawai_07053 WHERE id_pegawai = 4;

SELECT nama AS nama_pegawai, (SELECT AVG(harga_beli)
FROM transaksi_beli_07053 WHERE transaksi_beli_07053.id_pegawai = pegawai_07053.id_pegawai) AS rata2_transaksi_ditangani
FROM pegawai_07053 WHERE id_pegawai = 2;

SELECT nama
FROM hewan_07053
WHERE umur < (SELECT AVG(umur) FROM hewan_07053)
GROUP BY nama;

SELECT id_beli, (SELECT MAX(harga_jual)
FROM transaksi_jual_07053) AS harga_jual
FROM transaksi_beli_07053 WHERE id_beli = (SELECT id_beli
FROM transaksi_jual_07053 WHERE harga_jual = (SELECT MAX(harga_jual)
FROM transaksi_jual_07053));

SELECT nama AS hewan_harga_terendah_tertinggi 
FROM hewan_07053 WHERE id_hewan = (SELECT id_hewan 
FROM transaksi_beli_07053 WHERE harga_beli = (SELECT MAX(harga_beli) 
FROM transaksi_beli_07053)) OR id_hewan = (SELECT id_hewan 
FROM transaksi_beli_07053 WHERE harga_beli = (SELECT MIN(harga_beli) 
FROM transaksi_beli_07053));

INSERT ALL
INTO hewan_07053 VALUES (16, 'Sapi', 16, 'belum terjual')
INTO hewan_07053 VALUES (17, 'Udang', 17, 'belum terjual')
INTO hewan_07053 VALUES (18, 'Ayam', 18, 'belum terjual')
INTO hewan_07053 VALUES (19, 'Kelinci', 19, 'belum terjual')
INTO hewan_07053 VALUES (20, 'Domba', 20, 'belum terjual')
SELECT 1 FROM dual;

INSERT ALL
INTO pegawai_07053 VALUES (16, 'Paidi', 'Gunungsari', '089611111116', 'paidi123')
INTO pegawai_07053 VALUES (17, 'Paijo', 'Jemursari', '089611111117', 'paijo123')
INTO pegawai_07053 VALUES (18, 'Komar', 'Bratang', '089611111118', 'komar123')
INTO pegawai_07053 VALUES (19, 'Jamal', 'Wonokromo', '089611111119', 'jamal123')
INTO pegawai_07053 VALUES (20, 'Toni', 'Brebek', '089611111120', 'toni123')
SELECT 1 FROM dual;

INSERT ALL
INTO transaksi_beli_07053 VALUES (16, 16, 19, 16000000, TO_DATE('16/01/2020', 'dd/mm/yyyy'), NULL)
INTO transaksi_beli_07053 VALUES (17, 17, 19, 17000000, TO_DATE('17/01/2020', 'dd/mm/yyyy'), NULL)
INTO transaksi_beli_07053 VALUES (18, 18, 20, 18000000, TO_DATE('18/01/2020', 'dd/mm/yyyy'), NULL)
INTO transaksi_beli_07053 VALUES (19, 19, 20, 19000000, TO_DATE('19/01/2020', 'dd/mm/yyyy'), NULL)
INTO transaksi_beli_07053 VALUES (20, 20, 20, 20000000, TO_DATE('20/01/2020', 'dd/mm/yyyy'), NULL)
SELECT 1 FROM dual;

INSERT ALL
INTO transaksi_jual_07053 VALUES (16, 16, 20, 26000000, TO_DATE('16/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 VALUES (17, 17, 20, 27000000, TO_DATE('17/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 VALUES (18, 18, 19, 28000000, TO_DATE('18/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 VALUES (19, 19, 19, 29000000, TO_DATE('19/09/2020', 'dd/mm/yyyy'), 10000000)
INTO transaksi_jual_07053 VALUES (20, 20, 19, 30000000, TO_DATE('20/09/2020', 'dd/mm/yyyy'), 10000000)
SELECT 1 FROM dual;

SELECT a.nama AS nama_hewan_yang_dibeli, b.harga_beli, b.tanggal_beli
FROM hewan_07053 a JOIN transaksi_beli_07053 b
ON a.id_hewan = b.id_hewan
WHERE rownum <= 10;

SELECT a.nama AS nama_pegawai_yang_menangani, b.tanggal_beli, c.tanggal_jual
FROM pegawai_07053 a
LEFT JOIN transaksi_beli_07053 b ON a.id_pegawai = b.id_pegawai
LEFT JOIN transaksi_jual_07053 c ON b.id_beli = c.id_beli
WHERE a.id_pegawai BETWEEN (SELECT MIN(id_pegawai) 
FROM pegawai_07053) AND (SELECT MAX(id_pegawai)
FROM pegawai_07053);

SELECT a.nama AS nama_hewan_yang_dibeli,
COUNT(b.id_pegawai) AS jumlah_transaksi, c.nama AS pegawai_yang_membeli
FROM hewan_07053 a
RIGHT JOIN transaksi_beli_07053 b
ON a.id_hewan = b.id_hewan
RIGHT JOIN pegawai_07053 c
ON b.id_pegawai = c.id_pegawai
WHERE NOT c.nama LIKE '%l%' AND NOT c.nama LIKE '%r%'
GROUP BY a.nama, c.nama;

CREATE VIEW list_hewan
AS SELECT id_hewan, nama, umur, status
FROM hewan_07053;

INSERT INTO list_hewan (id_hewan, nama, umur, status)
VALUES (101, 'Lebah', 1, 'belum terjual');

SELECT * FROM list_hewan;

CREATE VIEW list_transaksi_beli
AS SELECT a.nama AS nama_hewan_yang_dibeli, b.harga_beli, b.tanggal_beli
FROM hewan_07053 a JOIN transaksi_beli_07053 b
ON a.id_hewan = b.id_hewan
WHERE rownum <= 10;

CREATE VIEW list_tanggal_transaksi
AS SELECT a.nama AS nama_pegawai_yang_menangani, b.tanggal_beli, c.tanggal_jual
FROM pegawai_07053 a
LEFT JOIN transaksi_beli_07053 b ON a.id_pegawai = b.id_pegawai
LEFT JOIN transaksi_jual_07053 c ON b.id_beli = c.id_beli
WHERE a.id_pegawai BETWEEN (SELECT MIN(id_pegawai) 
FROM pegawai_07053) AND (SELECT MAX(id_pegawai)
FROM pegawai_07053);

CREATE VIEW list_pegawai_yang_membeli
AS SELECT a.nama AS nama_hewan_yang_dibeli,
COUNT(b.id_pegawai) AS jumlah_transaksi, c.nama AS pegawai_yang_membeli
FROM hewan_07053 a
RIGHT JOIN transaksi_beli_07053 b
ON a.id_hewan = b.id_hewan
RIGHT JOIN pegawai_07053 c
ON b.id_pegawai = c.id_pegawai
WHERE NOT c.nama LIKE '%l%' AND NOT c.nama LIKE '%r%'
GROUP BY a.nama, c.nama;

INSERT INTO list_transaksi_beli (harga_beli, tanggal_beli)
VALUES (5000000, TO_DATE('05/05/2050', 'dd/mm/yyyy'));

SELECT * FROM user_updatable_columns WHERE table_name LIKE 'LIST%';

DROP SEQUENCE id_pegawai;
DROP SEQUENCE id_hewan;
DROP SEQUENCE id_beli;
DROP SEQUENCE id_jual;

CREATE SEQUENCE id_pegawai
MINVALUE 1
MAXVALUE 10000
START WITH 200
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE id_hewan
MINVALUE 1
MAXVALUE 10000
START WITH 200
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE id_beli
MINVALUE 1
MAXVALUE 10000
START WITH 200
INCREMENT BY 1
NOCACHE;

CREATE SEQUENCE id_jual
MINVALUE 1
MAXVALUE 10000
START WITH 200
INCREMENT BY 1
NOCACHE;
