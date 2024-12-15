# Da NOTES

This thing follows a flow so if you want to understand everything, you may want to read the first subjects.

## Data types

On bash there's no data types because everything is traited as text.

```bash
my_variable="Hello World"
echo ${my_variable}
```

- **Numbers**: in order to make arithmetic operations you want to tell Bash to do so by the **(())** command

```bash
number=10
result=((number + 5))
echo result
```

**NOTE**: avoid using this with variables like

```bash
number="10a"
```

**NOTE 2**: there's no support for floats, objects, etc.

## The difference between **[[]]** and **[]**

**RABBIT HOLE ALERT!**

The first ones (**[[]]**) are an exclusive feature of **Bash**, they are more modern and advance (they can even support regular expressions!) than **[]**.

On the other hand **[]** supports the **POSIX** standard

### All the features supported by [[]] and not []