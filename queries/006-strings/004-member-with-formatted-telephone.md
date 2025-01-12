# SQL Exercise: Find telephone numbers with parentheses

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

You've noticed that the club's member table has telephone numbers with very inconsistent formatting. You'd like to find all the telephone numbers that contain parentheses, returning the member ID and telephone number sorted by member ID.

## Expected Output:

| memid | telephone      |
| ----- | -------------- |
| 0     | (000) 000-0000 |
| 3     | (844) 693-0723 |
| 4     | (833) 942-4710 |
| 5     | (844) 078-4130 |
| 6     | (822) 354-9973 |
| 7     | (833) 776-4001 |
| 8     | (811) 433-2547 |
| 9     | (833) 160-3900 |
| 10    | (855) 542-5251 |
| 11    | (844) 536-8036 |
| 13    | (855) 016-0163 |
| 14    | (822) 163-3254 |
| 15    | (833) 499-3527 |
| 20    | (811) 972-1377 |
| 21    | (822) 661-2898 |
| 22    | (822) 499-2232 |
| 24    | (822) 413-1470 |
| 27    | (822) 989-8876 |
| 28    | (855) 755-9876 |
| 29    | (855) 894-3758 |
| 30    | (855) 941-9786 |
| 33    | (822) 665-5327 |
| 35    | (899) 720-6978 |
| 36    | (811) 732-4816 |
| 37    | (822) 577-3541 |

## Answer:
```sql
select
    memid,
    telephone
from
    cd.members
where
    telephone ~ '[()]';
```