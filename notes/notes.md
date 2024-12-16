# Da NOTES

This thing follows a flow, so if you want to understand everything, you may want to read the first subjects.

## POSIX and Bashisms

### Tf is POSIX?

*POSIX (Portable Operating System Interface) is a standard created by the **IEEE** to ensure compatibility across Unix-like operating systems. It defines a basic set of **interfaces** and **tools**, such as **commands**, **shell functions**, and **operating system behaviors**, so that scripts and programs can run consistently on different platforms. In the context of Bash, adhering to POSIX standards means writing scripts that work in any POSIX-compliant shell, like ``sh`` or ``dash``, sacrificing modern Bash-specific features (known as **Bashisms**) to achieve maximum portability.*

#### So, which systems support Bashisms?

**Some of the most important Linux distributions (*some of these do not use Bash by default*):**

- Debian
- Ubuntu
- Fedora
- CentOS
- Red Hat Enterprise Linux (RHEL)
- Arch Linux
- Gentoo
- Alpine Linux
- openSUSE
- Linux Mint

**Other important systems (*again, some of these do not use Bash by default*):**

- macOS
- FreeBSD
- OpenBSD
- NetBSD

### Wtf are bashisms?

Bashisms are shell commands specific to the Bash interpreter. These features are not defined by POSIX standards.

## Data types

In Bash there are no **strict data types**, because **everything is treaited as text**.

```bash
my_variable="Hello World"
echo ${my_variable}
```

### Numbers

In order to perform arithmetic operations, you need to tell Bash explicitly by the **(())** command

```bash
number=10
result=$((number + 5))
echo result
```

And the operators you can use are: ``+``, ``-``, ``*``, ``/``, ``%`` and ``**``.

Alternatively you can use the ``expr`` command.

**NOTE**: avoid using **(())** with variables like

```bash
number="10a"
```

**NOTE 2**: Bash does not support natively floats or decimals, objects, arrays of mixed data types, or other complex data types. To perform arbitrary precision calculations you can use the ``bc`` Bash command.

```bash
echo "scale=2; 10 / 3" | bc  # Output: 3.33
```

## The difference between **[[ ]]** and **[ ]**

**RABBIT HOLE ALERT!**

### TL;DR

- **[[ ]]**: Exclusive to Bash, modern, more robust (e.g., supports regular expressions, better handling of spaces and variables).
- **[ ]**: Compatible with the ***POSIX*** standard, but limited and prone to errors if not used carefully. Use it if you need your script to be portable and compatible with non-Bash shells.

### All diferences

#### Portability

**[[]]** works only in Bash (or similar shells like ``zsh`` and ``ksh``) meanwhile **[ ]** is POSIX-compliant and works in all POSIX-compatible shells, including minimal shells like ``dash``.

#### Syntax and safety

In simple terms **[[ ]]** are safer and less prone to errors than **[ ]**. This is because **[[]]** handles variable expansions and quoting internally, while **[]** requires strict quoting internally to avoid errors due to how it expands variables:

- ``[[]]``

```bash
my_variable="Hello World"

if [[ $my_variable = "Hello World" ]]; then echo "True"; fi
```

- ``[]``

```bash
my_variable="Hello World"

if [ "$my_variable" = "Hello World" ]; then echo "True"; fi
```

not like this:

```bash
my_variable="Hello World"

if [ $my_variable = "Hello World" ]; then echo "True"; fi
```

because this expands like this:

```bash
my_variable="Hello World"

if [ Hello World = "Hello World" ]; then echo "True"; fi
```

which results in a error:

```bash
bash: [: too many arguments
```

#### Logical operators

**[[ ]]** use logical operators like && (AND) and || (OR) directly.

```bash
if [[ -f file && -r file ]]; then
    echo "File exists and is readable."
fi
```

On the other hand **[ ]** requires -a (AND) and -o (OR), which are harder to read and and officially deprecated.:

```bash
if [ -f file -a -r file ]; then
    echo "File exists and is readable."
fi
```

##### Operators and Escaping

Using **[[ ]]** operators like ``<`` and ``>`` do not need escaping.

```bash
if [[ "a" < "b" ]]; then
    echo "a is less than b."
fi
```

While **[ ]** requires escaping these operators.

```bash
if [ "a" \< "b" ]; then
    echo "a is less than b."
fi
```

#### Comparisons

##### Strings

Keep in mind that you use ``==`` when you use **[[ ]]** and ``=`` when you use **[ ]** for string comparisons. And remember to use it exclusively with strings and not numeric values.

Be cautious with quoting as well.. Have you already checked the [syntax and safety](#syntax-and-safety) section?

Aditionally, one of the great features about **[[]]** is that supports regex (*regular expressions*) matching with ``=~``,

##### Numeric comparisons

Both **[[ ]]** and **[ ]** support numeric operators like ``-eq``, ``-lt``, ``-gt``, etc.
