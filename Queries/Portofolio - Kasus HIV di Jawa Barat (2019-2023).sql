-- I. Ada berapa total daerah di Jawa Barat?
SELECT DISTINCT COUNT(kode_kabupaten_kota) / 5 AS total_daerah_di_jabar 
-- dibagi 5 karena ada 2019, 2020, 2021, 2022, 2023
FROM hiv_cases_in_jabar;

-- II. Ada berapa masing-masing total Kota dan Kabupaten yang ada di Jawa barat?
SELECT DISTINCT COUNT(nama_kabupaten_kota) / 5 AS total_kota_jabar
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kota%';

SELECT DISTINCT COUNT(nama_kabupaten_kota) / 5 AS total_kab_jabar
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kabupaten%';

-- 1a. Urutan kasus HIV dari terbanyak dan terminim di Kabupaten? (2019) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kabupaten%' AND tahun = 2019
ORDER BY jumlah_kasus DESC;

-- 1b. Urutan kasus HIV dari terbanyak dan terminim di Kabupaten? (2020) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kabupaten%' AND tahun = 2020
ORDER BY jumlah_kasus DESC;

-- 1c. Urutan kasus HIV dari terbanyak dan terminim di Kabupaten? (2021) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kabupaten%' AND tahun = 2021
ORDER BY jumlah_kasus DESC;

-- 1d. Urutan kasus HIV dari terbanyak dan terminim di Kabupaten? (2022) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kabupaten%' AND tahun = 2022
ORDER BY jumlah_kasus DESC;

-- 1e. Urutan kasus HIV dari terbanyak dan terminim di Kabupaten? (2023) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kabupaten%' AND tahun = 2023
ORDER BY jumlah_kasus DESC;

-- 2a. Urutan kasus HIV dari terbanyak dan terminim di Kota? (2019) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kota%' AND tahun = 2019
ORDER BY jumlah_kasus DESC;

-- 2b. Urutan kasus HIV dari terbanyak dan terminim di Kota? (2020) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kota%' AND tahun = 2020
ORDER BY jumlah_kasus DESC;

-- 2c. Urutan kasus HIV dari terbanyak dan terminim di Kota? (2021) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kota%' AND tahun = 2021
ORDER BY jumlah_kasus DESC;

-- 2d. Urutan kasus HIV dari terbanyak dan terminim di Kota? (2022) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kota%' AND tahun = 2022
ORDER BY jumlah_kasus DESC;

-- 2e. Urutan kasus HIV dari terbanyak dan terminim di Kota? (2023) 
SELECT kode_kabupaten_kota, nama_kabupaten_kota, jumlah_kasus, tahun
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE 'kota%' AND tahun = 2023
ORDER BY jumlah_kasus DESC;

-- 3. Ada berapa total kasus HIV yang terjadi di Bekasi selama 2019-2023?
SELECT tahun, SUM(jumlah_kasus) AS total_kasus_hiv_bekasi
FROM hiv_cases_in_jabar
WHERE nama_kabupaten_kota LIKE '%bekasi'
GROUP BY tahun;

-- 4. Perkembangan kasus HIV dari tahun ke tahun (2019-2023)
SELECT tahun, SUM(jumlah_kasus) AS total_kasus
FROM hiv_age
GROUP BY tahun;

-- 5. Ganti nama untuk data yang bertuliskan "â‰¥50" pada kelompok_umur
UPDATE hiv_age
SET kelompok_umur = '>= 50'
WHERE kelompok_umur = 'â‰¥50';

-- 6. Gabungkan tabel hiv_gender dengan hiv_age dengan FULL OUTER JOIN
SELECT hiv_age.id,
hiv_cases_in_jabar.nama_kabupaten_kota,
hiv_cases_in_jabar.jumlah_kasus AS total_kasus_all,
hiv_age.jenis_kelamin,
hiv_age.kelompok_umur,
hiv_age.jumlah_kasus,
hiv_age.tahun
FROM hiv_cases_in_jabar
LEFT JOIN hiv_age
ON hiv_cases_in_jabar.nama_kabupaten_kota = hiv_age.nama_kabupaten_kota
AND hiv_cases_in_jabar.tahun = hiv_age.tahun

UNION

SELECT hiv_age.id,
hiv_cases_in_jabar.nama_kabupaten_kota,
hiv_cases_in_jabar.jumlah_kasus AS total_kasus_all,
hiv_age.jenis_kelamin,
hiv_age.kelompok_umur,
hiv_age.jumlah_kasus,
hiv_age.tahun
FROM hiv_cases_in_jabar
RIGHT JOIN hiv_age
ON hiv_cases_in_jabar.nama_kabupaten_kota = hiv_age.nama_kabupaten_kota
AND hiv_cases_in_jabar.tahun = hiv_age.tahun

ORDER BY id;

-- 7. Umur yang paling rentan terkena HIV di Jawa Barat?
SELECT kelompok_umur, SUM(jumlah_kasus) AS total_kasus
FROM hiv_age
GROUP BY kelompok_umur;

-- 8. Jenis kelamin yang paling rentan terkena HIV di Jawa Barat?
SELECT jenis_kelamin, SUM(jumlah_kasus) AS total_kasus
FROM hiv_age
GROUP BY jenis_kelamin;

-- 9. Kota/Kabupaten dengan total kasus HIV terbanyak (2019-2023)?
SELECT nama_kabupaten_kota, SUM(jumlah_kasus) AS total_kasus
FROM hiv_age
GROUP BY nama_kabupaten_kota
ORDER BY total_kasus DESC;