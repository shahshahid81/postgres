# SQL Exercise: Find the downward recommendation chain for member ID 1

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Find the downward recommendation chain for member ID 1: that is, the members they recommended, the members those members recommended, and so on. Return member ID and name, and order by ascending member id.

## Expected Output:

| memid | firstname | surname   |
| ----- | --------- | --------- |
| 4     | Janice    | Joplette  |
| 5     | Gerald    | Butters   |
| 7     | Nancy     | Dare      |
| 10    | Charles   | Owen      |
| 11    | David     | Jones     |
| 14    | Jack      | Smith     |
| 20    | Matthew   | Genting   |
| 21    | Anna      | Mackenzie |
| 26    | Douglas   | Jones     |
| 27    | Henrietta | Rumney    |

## Answer:

```sql
WITH RECURSIVE downward_recommendation_finder(recommender_id) AS (
    SELECT
        memid
    from
        cd.members
    where
        recommendedby = 1
    UNION
    SELECT
        mems.memid as memid
    FROM
        cd.members mems
        INNER JOIN downward_recommendation_finder drf ON drf.recommender_id = mems.recommendedby
)
SELECT
    memid,
    firstname,
    surname
FROM
    downward_recommendation_finder drf
    INNER JOIN cd.members mems ON mems.memid = drf.recommender_id
ORDER BY
    memid;
```