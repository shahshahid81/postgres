# SQL Exercise: Combining results from multiple queries

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

You, for some reason, want a combined list of all surnames and all facility names. Yes, this is a contrived example :-). Produce that list!

## Expected Output:

| surname            |
|--------------------|
| Tennis Court 2     |
| Worthington-Smyth  |
| Badminton Court    |
| Pinker             |
| Dare               |
| Bader              |
| Mackenzie          |
| Crumpet            |
| Massage Room 1     |
| Squash Court       |
| Tracy              |
| Hunt               |
| Tupperware         |
| Smith              |
| Butters            |
| Rownam             |
| Baker              |
| Genting            |
| Purview            |
| Coplin             |
| Massage Room 2     |
| Joplette           |
| Stibbons           |
| Rumney             |
| Pool Table         |
| Sarwin             |
| Boothe             |
| Farrell            |
| Tennis Court 1     |
| Snooker Table      |
| Owen               |
| Table Tennis       |
| GUEST              |
| Jones              |

## Answer:

```sql
SELECT
  surname
FROM
  cd.members
UNION
SELECT
  name
FROM
  cd.facilities;
```
