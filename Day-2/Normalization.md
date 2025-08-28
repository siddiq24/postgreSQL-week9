# EXERCISE

![alt text](image.png)



# 1NF
| LoanID | MemberID | MemberName | BookISBN | BookTitle | Author | LoanDate | DueDate | Fee |
|--|--|--|--|--|--|--|--|--|
|L1001|M201|Alice Chen|978-1234567890|The Great Novel|A. Author|2023-10-01|2023-10-15|0.00|
|L1002|M202|Bob Smith|978-0987654321|Database Fundamental|B. Writer|2023-10-02|2023-10-16|2.50|
|L1003|M201|Alice Chen|978-5555555555|History of Things|C. Historian|2023-10-05|2023-10-19|0.00|
|L1004|M201|Alice Chen|978-0987654321|Database Fundamental|B. Writer|2023-10-10|2023-10-24|0.00|

```




```
# 2NF
.
> ### Table Mambers
| MemberId (PK) | MamberName |
|--|--|
| M201 | Alice Chen |
| M202 | Bob Smith |
```
```
> ### Table Books info
| BookISBN (PK) | BookTitle | Author
|--|--|--|
|978-1234567890|The Great Novel|A. Author|
|978-0987654321|Database Fundamental|B. Writer|
|978-5555555555|History of Things| C. Historian|
```
```
> ### Table Loan
|LoanID (PK) | MemberId (FK) | BooksISBN (FK) |LoanDate|DueDate|Fee|
|--|--|--|--|--|--|
|L1001|  M201 | 978-1234567890 | 2023-10-01 | 2023-10-15 |0.00| 
|L1002|  M202 | 978-0987654321 | 2023-10-02 | 2023-10-16 |2.50| 
|L1003|  M201 | 978-5555555555 | 2023-10-05 | 2023-10-19 |0.00| 
|L1004|  M201 | 978-0987654321 | 2023-10-10 | 2023-10-24 |0.00| 

```




```
# 3NF
> ### Table Mambers
| MemberId (PK) | MamberName |
|--|--|
| M201 | Alice Chen |
| M202 | Bob Smith |
```
```
> ### Table Author
|ID (PK) | Author |
|--|--|
|111|A. Author |
|112| B. Writer |
|113| C. Historian |
```
```
> ### Table Books info
| BookISBN (PK) | BookTitle | AuthorID (FK)|
|--|--|--|
|978-1234567890|The Great Novel|111|
|978-0987654321|Database Fundamental|112|
|978-5555555555|History of Things|113|
```
```
> ### Table hehe
|LoanID (PK) | MemberId (FK) | BooksISBN (FK) | LoanDate|DueDate|Fee|
|--|--|--|--|--|--|
|L1001|  M201 | 978-1234567890 | 2023-10-01 | 2023-10-15 |0.00| 
|L1002|  M202 | 978-0987654321 | 2023-10-02 | 2023-10-16 |2.50| 
|L1003|  M201 | 978-5555555555 | 2023-10-05 | 2023-10-19 |0.00| 
|L1004|  M201 | 978-0987654321 | 2023-10-10 | 2023-10-24 |0.00| 
