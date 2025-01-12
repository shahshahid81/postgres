# SQL Exercise: Count the number of members whose surname starts with each letter of the alphabet

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

You'd like to produce a count of how many members you have whose surname starts with each letter of the alphabet. Sort by the letter, and don't worry about printing out a letter if the count is 0.

## Expected Output:

| letter | count |
| ------ | ----- |
| B      | 5     |
| C      | 2     |
| D      | 1     |
| F      | 2     |
| G      | 2     |
| H      | 1     |
| J      | 3     |
| M      | 1     |
| O      | 1     |
| P      | 2     |
| R      | 2     |
| S      | 6     |
| T      | 2     |
| W      | 1     |

## Answer:

```sql
SELECT
    substr(surname, 1, 1) as letter,
    count(*) as count
from
    cd.members
group by
    letter
order by
    letter;
```