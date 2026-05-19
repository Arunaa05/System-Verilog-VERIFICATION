[monitor]a:1 b:1 cin:0 | sum:0 cout:1
EXPECTED OUTPUT
sum:0 cout=1
ACTUAL OUTPUT
sum:0 cout=1
+---------+
|   PASS  |
+---------+
[Driver]a:1 b:1 cin:0 | sum:0 cout:0
[monitor]a:1 b:0 cin:1 | sum:0 cout:1
EXPECTED OUTPUT
sum:0 cout=1
ACTUAL OUTPUT
sum:0 cout=1
+---------+
|   PASS  |
+---------+
[monitor]a:1 b:0 cin:1 | sum:0 cout:1
EXPECTED OUTPUT
sum:0 cout=1
ACTUAL OUTPUT
sum:0 cout=1
+---------+
|   PASS  |
+---------+
[Driver]a:1 b:0 cin:1 | sum:0 cout:0
[monitor]a:0 b:1 cin:1 | sum:0 cout:1
EXPECTED OUTPUT
sum:0 cout=1
ACTUAL OUTPUT
sum:0 cout=1
+---------+
|   PASS  |
+---------+
[monitor]a:0 b:1 cin:1 | sum:0 cout:1
EXPECTED OUTPUT
sum:0 cout=1
ACTUAL OUTPUT
sum:0 cout=1
+---------+
|   PASS  |
+---------+
[Driver]a:0 b:1 cin:1 | sum:0 cout:0
[monitor]a:0 b:1 cin:0 | sum:0 cout:1
EXPECTED OUTPUT
sum:1 cout=0
ACTUAL OUTPUT
sum:0 cout=1
+---------+
| FAILED  |
+---------+
[monitor]a:0 b:1 cin:0 | sum:1 cout:0
EXPECTED OUTPUT
sum:1 cout=0
ACTUAL OUTPUT
sum:1 cout=0
+---------+
|   PASS  |
+---------+
[Driver]a:0 b:1 cin:0 | sum:0 cout:0
[monitor]a:0 b:1 cin:0 | sum:1 cout:0
EXPECTED OUTPUT
sum:1 cout=0
ACTUAL OUTPUT
sum:1 cout=0
+---------+
|   PASS  |
+---------+
[monitor]a:0 b:1 cin:0 | sum:1 cout:0
EXPECTED OUTPUT
sum:1 cout=0
ACTUAL OUTPUT
sum:1 cout=0
+---------+
|   PASS  |
+---------+
