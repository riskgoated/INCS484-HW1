-- Select the unique full names of bakers
SELECT DISTINCT b.fullname
-- From the technical results table (t)
FROM technicals t
-- Join with the bakers table (b) to match each result to a baker
JOIN bakers b ON b.baker = t.baker
-- Filter for bakers who placed 2nd in at least one technical challenge
WHERE t.rank = 2;
