# SQL Exercise: Find the upward recommendation chain for member ID 27

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Find the upward recommendation chain for member ID 27: that is, the member who recommended them, and the member who recommended that member, and so on. Return member ID, first name, and surname. Order by descending member id.

## Expected Output:

| recommender | firstname | surname |
| ----------- | --------- | ------- |
| 20          | Matthew   | Genting |
| 5           | Gerald    | Butters |
| 1           | Darren    | Smith   |

## Answer:

### Fetching all data from the Recursive CTE
```sql
WITH RECURSIVE upward_member_finder(recommender) AS (
    SELECT
        recommendedby as recommender,
        memid,
        firstname,
        surname
    from
        cd.members
    where
        memid =(
            select
                recommendedby
            from
                cd.members
            where
                memid = 27
        )
    UNION
    SELECT
        cd.members.recommendedby as recommender,
        cd.members.memid,
        cd.members.firstname,
        cd.members.surname
    from
        cd.members,
        upward_member_finder
    WHERE
        cd.members.memid = recommender
)
SELECT
    memid, firstname, surname
from
    upward_member_finder;
```

### Fetching ids and then joining in the main query

```sql
with recursive recommenders(recommender) as (
	select
		recommendedby
	from
		cd.members
	where
		memid = 27
	union
	all
	select
		mems.recommendedby
	from
		recommenders recs
		inner join cd.members mems on mems.memid = recs.recommender
)
select
	recs.recommender,
	mems.firstname,
	mems.surname
from
	recommenders recs
	inner join cd.members mems on recs.recommender = mems.memid
order by
	memid desc;
```