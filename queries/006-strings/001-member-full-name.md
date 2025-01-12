*# SQL Exercise: Format the names of members

## Schema Reminder:

![Schema Diagram](../__resources/image.png)

## Question:

Output the names of all members, formatted as 'Surname, Firstname'

## Expected Output:

| Name                     |
| ------------------------ |
| GUEST, GUEST             |
| Smith, Darren            |
| Smith, Tracy             |
| Rownam, Tim              |
| Joplette, Janice         |
| Butters, Gerald          |
| Tracy, Burton            |
| Dare, Nancy              |
| Boothe, Tim              |
| Stibbons, Ponder         |
| Owen, Charles            |
| Jones, David             |
| Baker, Anne              |
| Farrell, Jemima          |
| Smith, Jack              |
| Bader, Florence          |
| Baker, Timothy           |
| Pinker, David            |
| Genting, Matthew         |
| Mackenzie, Anna          |
| Coplin, Joan             |
| Sarwin, Ramnaresh        |
| Jones, Douglas           |
| Rumney, Henrietta        |
| Farrell, David           |
| Worthington-Smyth, Henry |
| Purview, Millicent       |
| Tupperware, Hyacinth     |
| Hunt, John               |
| Crumpet, Erica           |
| Smith, Darren            |

## Answer:

```sql
SELECT
    surname || ', ' || firstname as name
FROM
    cd.members;
```
*