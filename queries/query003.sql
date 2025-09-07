-- Select the full name and hometown of bakers
SELECT DISTINCT b.fullname, b.hometown
-- From the bakers table (b)
FROM bakers b
-- Join with the signatures table (s) to link bakers to their signature bakes
JOIN signatures s ON s.baker = b.baker
-- Keep only bakes where the description mentions raisin
WHERE LOWER(s.make) LIKE '%raisin%';
