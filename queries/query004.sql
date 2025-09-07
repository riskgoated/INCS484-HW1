-- Select the hometowns of bakers
SELECT DISTINCT b.hometown
-- From the bakers table (b)
FROM bakers b
-- Keep bakers who used hazelnut in a signature OR a showstopper
WHERE EXISTS (
    -- Subquery to check if any of the baker's signature bakes mention hazelnut
    SELECT 1
    FROM signatures s
    WHERE s.baker = b.baker
      AND LOWER(s.make) LIKE '%hazelnut%'
)
OR EXISTS (
    -- Subquery to check if any of the baker's showstopper bakes mention hazelnut
    SELECT 1
    FROM showstoppers ss
    WHERE ss.baker = b.baker
      AND LOWER(ss.make) LIKE '%hazelnut%'
);
