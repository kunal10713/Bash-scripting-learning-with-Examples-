Sort and Uniq Command Guide
===========================

This guide provides an overview of the `sort` and `uniq` commands in Linux, including their common options and practical examples.

* * * * *

Table of Contents
-----------------

1.  [Introduction](#introduction)
2.  [Sort Command](#sort-command)
    -   [Examples with Output](#examples-with-output)
3.  [Uniq Command](#uniq-command)
    -   [Examples with Output](#examples-with-output-1)
4.  [Combining Sort and Uniq](#combining-sort-and-uniq)

* * * * *

Introduction
------------

The `sort` and `uniq` commands are powerful tools in Linux for sorting and filtering text data. `sort` arranges lines in a specified order, while `uniq` filters out duplicate lines. They are often used together to sort data and remove duplicate entries.

* * * * *

Sort Command
------------

The `sort` command arranges lines from a file or standard input in ascending or descending order.

### Common Options

-   `-r`: Sort in reverse order.
-   `-n`: Sort numerically (instead of alphabetically).
-   `-k`: Sort by a specific column.
-   `-u`: Sort and remove duplicate lines.
-   `-t`: Specify a delimiter.

### Examples with Output

#### Example 1: Alphabetical Sort

File: `names.txt`

```bash
Alice
John
Bob
```

Command:

```bash
sort names.txt
```

Output:

```bash
Alice
Bob
John
```
#### Example 2: Numerical Sort

File: `numbers.txt`

```bash
10
3
25
2
```

Command:

bash

```bash
sort -n numbers.txt
```

Output:

```bash
2
3
10
25
```

#### Example 3: Sort by Specific Column

File: `data.txt`

```bash
101 Alice
203 Bob
150 Charlie
```

Command:

```bash
sort -k 2 data.txt
```

Output:

```bash
101 Alice
203 Bob
150 Charlie
```

#### Example 4: Reverse Sort 

Command:

```bash
sort -r names.txt
```

Output:
```bash
John
Bob
Alice
```

#### Example 5: Sort and Remove Duplicates with -u 

The -u option in sort allows you to sort the file and remove any duplicate lines automatically, without needing to use uniq.

File: `fruits.txt`

```bash
apple
banana
apple
cherry
banana
cherry
grape
```

Command:

```bash
sort -u fruits.txt
```

Output:
```bash
apple
banana
cherry
grape
```

* * * * *

Uniq Command
------------

The `uniq` command filters out repeated lines from sorted data. **Note**: It only removes consecutive duplicates, so it's often used after `sort`.

### Common Options

-   `-c`: Count the occurrences of each line.
-   `-d`: Display only duplicated lines.
-   `-u`: Display only unique lines (non-repeating).

### Examples with Output

#### Example 1: Basic Usage

File: `items.txt`

```bash
apple
banana
apple
cherry
cherry
banana
```

Command:

```bash
sort items.txt | uniq
```

Output:

```bash
apple
banana
cherry
```

#### Example 2: Counting Duplicates

Command:

```bash
sort items.txt | uniq -c
```

Output:

```bash

  2 apple
  2 banana
  2 cherry
```

#### Example 3: Showing Only Duplicates

Command:

bash

```bash
sort items.txt | uniq -d
```

Output:

```bash
apple
banana
cherry
```

* * * * *

Combining Sort and Uniq
-----------------------

To get sorted, unique lines from a file, combine `sort` and `uniq` in a pipeline.

### Example with Output

File: `colors.txt`

```bash
blue
red
blue
green
red
yellow
```

Command:

```bash
sort colors.txt | uniq
```

Output:

```bash
blue
green
red
yellow
```

* * * * *

Conclusion
----------

The `sort` and `uniq` commands are essential for organizing text data on Linux. By learning their options and how to combine them, you can effectively manipulate and analyze text files in your projects.