-- Select full names of bakers who placed 2nd at least once, but never 1st
SELECT b.fullname
FROM bakers b
-- Keep bakers who have at least one 2nd-place technical result
WHERE EXISTS (
    SELECT 1
    FROM technicals t2
    WHERE t2.baker = b.baker
      AND t2.rank = 2
)
-- Exclude any baker who has a 1st-place technical result
AND NOT EXISTS (
    SELECT 1
    FROM technicals t1
    WHERE t1.baker = b.baker
      AND t1.rank = 1
);
