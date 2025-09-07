-- Return the first name and showstopper make for each episode's star baker(s)
SELECT DISTINCT
  b.baker AS first_name,
  s.make
-- Start from per-episode results to find who earned 'star baker'
FROM results r
-- Join to bakers to get the baker's first name
JOIN bakers b
  ON b.baker = r.baker
-- Join to showstoppers to get what that same baker made in that same episode
JOIN showstoppers s
  ON s.episodeid = r.episodeid
 AND s.baker     = r.baker
-- Keep only rows where the baker was designated star baker
WHERE LOWER(r.result) = 'star baker'
-- Present in episode order, then by first name
ORDER BY r.episodeid, first_name;
