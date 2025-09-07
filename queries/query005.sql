-- Select each baker's full name and the earliest episode they were eliminated
SELECT b.fullname, MIN(r.episodeid) AS episode_eliminated
-- From the results table (r), which tracks outcomes by episode
FROM results r
-- Join to the bakers table (b) to get the baker's full name
JOIN bakers b ON b.baker = r.baker
-- Only consider rows where the result is 'eliminated'
WHERE r.result = 'eliminated'
-- Group by baker so we can calculate the first elimination episode per baker
GROUP BY b.fullname
-- Keep only bakers whose earliest elimination happened before episode 5
HAVING MIN(r.episodeid) < 5
-- Sort the output by elimination episode, then alphabetically by name
ORDER BY episode_eliminated, b.fullname;
