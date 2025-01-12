# SQL Exercise: Clean up telephone numbers

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

The telephone numbers in the database are very inconsistently formatted. You'd like to print a list of member ids and numbers that have had '-','(',')', and ' ' characters removed. Order by member id.

## Expected Output:

| memid | telephone  |
| ----- | ---------- |
| 0     | 0000000000 |
| 1     | 5555555555 |
| 2     | 5555555555 |
| 3     | 8446930723 |
| 4     | 8339424710 |
| 5     | 8440784130 |
| 6     | 8223549973 |
| 7     | 8337764001 |
| 8     | 8114332547 |
| 9     | 8331603900 |
| 10    | 8555425251 |
| 11    | 8445368036 |
| 12    | 8440765141 |
| 13    | 8550160163 |
| 14    | 8221633254 |
| 15    | 8334993527 |
| 16    | 8339410824 |
| 17    | 8114096734 |
| 20    | 8119721377 |
| 21    | 8226612898 |
| 22    | 8224992232 |
| 24    | 8224131470 |
| 26    | 8445368036 |
| 27    | 8229898876 |
| 28    | 8557559876 |
| 29    | 8558943758 |
| 30    | 8559419786 |
| 33    | 8226655327 |
| 35    | 8997206978 |
| 36    | 8117324816 |
| 37    | 8225773541 |

## Answer:

```sql
SELECT
    memid,
    REGEXP_REPLACE(telephone, '[^0-9]', '', 'g') as telephone
FROM
    cd.members
ORDER BY
    memid;
```