`awk` Command in Linux
======================

The `awk` command in Linux is a powerful text-processing tool used for pattern scanning and processing. It reads text line-by-line, divides each line into fields, and allows you to manipulate and format the text for various use cases.

Basic Syntax of `awk`
---------------------

```bash
awk [options] 'pattern { action }' [filename]
```

-   `pattern`: Specifies the condition to match lines.
-   `action`: Defines the operations to perform on each matching line.
-   `filename`: The file on which `awk` operates.

Commonly Used Options with `awk`
--------------------------------

-   `-F`: Sets the field delimiter.
-   `-v`: Assigns a value to an `awk` variable.
-   `-f`: Runs an `awk` program from a file instead of inline code.

Examples of `awk` Usage
-----------------------

Let's use the following example file called `employees.txt`:

```bash
Name,Department,Salary
Alice,Engineering,70000
Bob,Marketing,55000
Charlie,Sales,60000
```

### 1\. Printing Specific Fields

To print specific fields from each line, use `$1`, `$2`, etc., where `$1` represents the first field, `$2` the second, and so on.

Example: Print the first and third columns

```bash
awk -F ',' '{ print $1, $3 }' employees.txt
```

Output:

```bash
Name Salary
Alice 70000
Bob 55000
Charlie 60000
```

### 2\. Handling Default Field Separators (Whitespace)

If no delimiter is specified, `awk` treats spaces or tabs as the default delimiters.

```bash
awk '{ print $1, $3 }' employees.txt
```

Output:

```bash
Alice 70000
Bob 55000
Charlie 60000
```

### 3\. Custom Output Delimiters Using `OFS`

The `OFS` (Output Field Separator) variable sets a custom delimiter in the output.

```bash
awk -F ',' 'BEGIN { OFS=":" } { print $1, $3 }' employees.txt
```

Output:

```bash
Name:Salary
Alice:70000
Bob:55000
Charlie:60000
```

### 4\. Using `NF` to Print the Last Field

`NF` represents the number of fields in the current record, useful for printing the last field.

```bash
awk -F ',' '{ print $NF }' employees.txt
```

Output:

```bash
Salary
70000
55000
60000
```

Additional Examples
-------------------

### Example 1: Summing Values in a Column

If you have a file `expenses.txt` listing expenses and want to calculate the total of a specific column:

For:
```bash
Name:Salary
Alice:70000
Charlie:60000
```

```bash
awk '{ total += $2 } END { print "Total:", total }' expenses.txt
```

Output:

```bash
Total: 1300
```

### Example 2: Counting Lines Based on a Condition

Count lines with values over $100 in the second column:

```bash
awk '$2 > 100 { count++ } END { print "Items over $100:", count }' expenses.txt
```

Output:

```bash
Items over $100: 3
```

### Example 3: Formatting Output with `printf`

Using `printf` for formatted output is useful for aligning text or formatting numbers.

```bash
awk '{ printf "%-15s $%6.2f\n", $1, $2 }' expenses.txt
```

Output:

```bash
Food            $200.00
Transport       $50.00
Entertainment   $100.00
Rent            $800.00
Utilities       $150.00
```

### Example 4: Using `-v` for External Variable Assignment

The `-v` option is used to assign a variable a value before the `awk` program starts.

```bash
awk -v dept="Sales" '$2 == dept { print $1, $2, $3 }' employees.txt`
```
Output:

```bash
Charlie Sales 60000
```

### Method is useful when you need specific formatting for your output without modifying the OFS variable.

You can specify a delimiter directly within the `print` statement in `awk` by using string concatenation or by separating fields with the desired delimiter. Instead of relying on `OFS`, you can include the delimiter inside `print` as follows:

### Example 1: Adding Delimiters Inside the `print` Statement

Using a comma as a custom delimiter in the output without setting `OFS`:

```bash
awk -F ',' '{ print $1 ":" $2 ":" $3 }' employees.txt`
```
**Output**:

```bash
Name:Department:Salary
Alice:Engineering:70000
Bob:Marketing:55000
Charlie:Sales:60000
```
In this example:

-   `print $1 ":" $2 ":" $3` explicitly places a colon `:` between each field.

### Example 2: Using a Space or Other Separator Inside `print`

To use a different separator, such as `-`, you can insert it directly in the `print` statement:

```bash
awk -F ',' '{ print $1 "-" $3 }' employees.txt`
```
**Output**:

```bash

Name-Salary
Alice-70000
Bob-55000
Charlie-60000
```

### Example 3: Concatenating Multiple Fields with Text and Delimiters

You can also mix text with your delimiters in `print`:

```bash
awk -F ',' '{ print "Employee:" $1 ", Department:" $2 ", Salary:" $3 }' employees.txt`
```       

**Output**:

```bash
Employee:Name, Department:Department, Salary:Salary
Employee:Alice, Department:Engineering, Salary:70000
Employee:Bob, Department:Marketing, Salary:55000
Employee:Charlie, Department:Sales, Salary:60000`
```
This method is useful when you need specific formatting for your output without modifying the `OFS` variable.



## Use `-v` option:

The `-v` option in `awk` is used to assign a variable a value before the `awk` program starts processing the data. This is helpful for passing external values or settings into `awk`, enabling greater flexibility and control in data processing.

### Syntax

```bash
awk -v varname=value 'program' file`
```
Here:

-   `varname=value` assigns a value to a variable.
-   `program` is the `awk` code or script that will use this variable.

### Examples of Using `-v`

#### Example 1: Using `-v` to Pass an External Variable

Suppose you want to print all lines in a file with a specific field that matches an externally given value.

**File (employees.txt):**

```bash
Alice Engineering 70000
Bob Marketing 55000
Charlie Sales 60000`
```

```bash
awk -v dept="Sales" '$2 == dept { print $1, $2, $3 }' employees.txt`
```
**Output:**

```bash
Charlie Sales 60000
```

Here:

-   `-v dept="Sales"` assigns the value `"Sales"` to the variable `dept`.
-   `'$2 == dept { print $1, $2, $3 }'` checks if the second field matches `dept` and prints the matching line.

#### Example 2: Using `-v` to Set a Numeric Variable

`-v` is also useful for passing numeric values to `awk` for calculations.

```bash
awk -v min_salary=60000 '$3 >= min_salary { print $1, $2, $3 }' employees.txt`
```
**Output:**

```bash

Alice Engineering 70000
Charlie Sales 60000
```

In this example:

-   `-v min_salary=60000` sets `min_salary` to `60000`.
-   `'$3 >= min_salary { print $1, $2, $3 }'` checks if the third field (salary) is greater than or equal to `min_salary`.

#### Example 3: Using `-v` with Custom Delimiters or Strings

You can also use `-v` to pass a custom delimiter for use within the `print` statement:

```bash
awk -v delim=" - " '{ print $1 delim $2 delim $3 }' employees.txt`
```
**Output:**

```bash
Alice - Engineering - 70000
Bob - Marketing - 55000
Charlie - Sales - 60000
```

Here:

-   `-v delim=" - "` assigns `" - "` as a delimiter to the variable `delim`.
-   `{ print $1 delim $2 delim $3 }` uses `delim` between fields in the output.

### Example 4: Using `-v` with `BEGIN` Block

When initializing values in a `BEGIN` block, you can also use `-v` to set initial values for variables.

```bash
awk -v title="Employee Details" 'BEGIN { print title; print "----------" } { print $1, $2, $3 }' employees.txt
```

**Output:**

```bash
Employee Details
----------
Alice Engineering 70000
Bob Marketing 55000
Charlie Sales 60000
```

In this example:

-   `-v title="Employee Details"` sets `title` to `"Employee Details"`.
-   `BEGIN { print title; print "----------" }` prints the title and a separator line before processing the data.


Summary of Key `awk` Options and Variables
------------------------------------------

| Option/Variable | Description |
| --- | --- |
| `-F` | Specifies the field delimiter |
| `OFS` | Sets the output field separator |
| `NF` | Represents the number of fields in a record |
| `$NF` | Accesses the last field in the line |
| `-v` | Assigns values to variables in `awk` before execution |
| `BEGIN {}` | Code block that executes before reading lines |

