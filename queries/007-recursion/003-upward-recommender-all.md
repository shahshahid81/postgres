# SQL Exercise: Produce a CTE that can return the upward recommendation chain for any member

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Produce a CTE that can return the upward recommendation chain for any member. You should be able to select recommender from recommenders where member=x. Demonstrate it by getting the chains for members 12 and 22. Results table should have member and recommender, ordered by member ascending, recommender descending.

## Expected Output:

| member | recommender | firstname | surname  |
| ------ | ----------- | --------- | -------- |
| 12     | 9           | Ponder    | Stibbons |
| 12     | 6           | Burton    | Tracy    |
| 22     | 16          | Timothy   | Baker    |
| 22     | 13          | Jemima    | Farrell  |

## Answer:

```sql
WITH RECURSIVE upward_recommendation_finder(recommendedby, memid) as (
    select
        recommendedby,
        memid
    from
        cd.members
    UNION
    ALL
    SELECT
        mems.recommendedby,
        urf.memid
    FROM
        cd.members mems
        INNER JOIN upward_recommendation_finder urf ON mems.memid = urf.recommendedby
)
SELECT
    urf.memid as member,
    urf.recommendedby as recommender,
    firstname,
    surname
from
    upward_recommendation_finder urf
    INNER JOIN cd.members mems ON mems.memid = urf.recommendedby
WHERE
    urf.memid IN (12, 22)
ORDER BY
    member,
    recommender desc;
```