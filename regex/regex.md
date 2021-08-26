# REGULAR EXPRESSION

Regex is a pattern-matching language. Many programming languages and system tools have a regex engine (grep, sed, perl, vim, less..)

**Common regex format**:
-   `/PATTERN/` - match
-   `s/PATTERN/REP/` - replace
-   `r'PATTERN'`
-   Sometimes you can also have FLAGS at the end
    -   `/PATTERN/FLAGS`
    -   `s/PATTERN/FLAGS`

**Sometimes you need slashes**:
```
$ echo cat cabbage | sed 's/a/@/g'
```
**Sometimes slashes are implied**
```
$ echo -e 'one\ntwo\nthree' | grep ^t
```
**Sometimes the slashes are not slases at all**
```
$ echo 'xyz party' | sed 's!xyz!cat!'
```

-   **flags**
    -   i - case insensitive
    -   g - match all occurences (global)
    -   m - treat string as multiple lines
    -   s - treat string as a single line

-   **metacharacters**
    -   `.` matches any character
    -   `?` zero or one time
    -   `*` zero or more times
    -   `+` one or more times
    -   `[]` character class
    -   `^` anchor at the beginning
    -   `$` anchor to the end
    -   `(a|b)` match a or b
    -   `()` capture group
    -   `(?:)` non capture group
    -   `\d` digit `[0-9]`
    -   `\w` word `[A-Za-z0-9_]`
    -   `\s` whitespace `[ \t\r\n\f]`
    e.g. `.`
```
$ echo 'hello beep boop'| sed 's/b..p/XXXX/g' 
# hello XXXX XXXX
```

-   **quantifiers**: 
 Quantifiers are greedy by default and match the longest leftmost.
    -   {m} m times
    -   {m,n} from m to n times
    -   {m,} m or more times
    -   {,m} from zero to m times
    -   `?` zero or one time  `{0,1}`
    -   `*` zero or more times `{0,}`
    -   `+` one or more times `{1,}`
    e.g.
```
$ echo 'dog and doge' | sed 's/dog\?/DOGE/g'
# DOGE and DOGE
$ echo 'beep bp beeeep | sed 's/be*p/BEEP/g'
# BEEP BEEP BEEP
$ echo 'beep bp beeeeep' | sed 's/be\+p/BEEP/g'
# BEEP bp BEEP
```

-   **when to escape metacharacters**: In some engines you need to escape metacharacters such as `+` and `?`. In others, you don't.

In javascripts and perl, you generally don't need to escape metacharacters. to use sed and grep in a similar way, use:

    -   `sed -r ` `sed -E` also works
    -   `grep -E`

-   **character class**: `[..]` any characters inside this square brackets will match
```
$ echo 'beep and boop' | sed -r 's/b[aeiou]+p/BXXP/g'
# BXXP and BXXP
```

-	**character class ranges**: `[A-Z]` use `-` to specify range
```
$ echo 'beep and boop'| sed -r 's/[a-f]/X/g'
# XXXp XnX Xoop
```

-	**negated character class**: Put `^` inside the *open* square bracket in a character class to negate it.
```
$ echo 'beep boop' | sed 's/[^aeiou]/Z/g'
# ZeeZZZooZ
```

-   **character class sequences**: Regex engines provide many pre-defined characer class sequences:
    -   `\w` word character `[A-Za-z0-9_]`
    -   `\W` non-word character `[^A-Za-z0-9_]`
    -   `\s` whitespace `[ \t\r\n\f]`
    -   `\S` non-whitespace `[^ \t\r\n\f]`
    -   `\d` digit `[0-9]`
    -   `\D` non-digit `[^0-9]`

-   **anchor**:
    -   `^` anchor at the beginning
    -   `$` anchor at the end
    -   `\b` anchor at the beginning of the word
    -   `\B` anchor NOT at the beginning of the word

-   **groups**: `(a|b)` match a OR b
    -   `()` capture group
    -   `(?:)` non capture group

-   **capture groups in sed**
```
$ echo 'hey <cool> whatever' | sed -r 's/<([^>]+)>/(\1)/g'
# hey (cool) whatever
```

-   **back references in sed**
```
$ echo 'hey cool cool beans' | sed -r 's/(\S+) \1/REPEATED/g'
# hey REPEATED beans
```

## Regex in Javascript

-   str.split(re)
-   str.match(re)
-   str.replace(re,)
-   re.test(str)
-   re.exec(str)

** match testing in js**

```
if (/^-(h|-help)/.test(process.argv[2])) {
    console.log('usage: ....')
}
```

** replacing in javascript**

``` js
'1 two three\n'.replace(/1/, 'one')
```
similar to:

``` sh
echo '1 two three' | sed 's/1/one/'
```

**capturing in javascript**

``` js
var m = /^hello (\S+)/.test('hello cat')
console.log(m[1]) // cat
```

** splitting in javascript**

``` js
> 'one_two-three'.split(/[_-]/)
[ 'one', 'two', 'three' ]
```
**captures groups in js**
```
var str = 'hey <cool> whatever'
var m = /<([^>]+)>/.exec(str)
console.log(m[1])  // cool
```

``` 
var str = 'hey <cool> whatever'
console.log(str.replace(/<([^>]+)>/,'MATHEMATICAL'))
```

**Password checking**: 

E.g At least 8 character, contain at least one Upper/ Lower case letter, number, special character (!@#$%^&+-\)

```
> var pw = 'avc354!A'
> /^\w{8,}$/.test(pw)
> /^[\w!@#$%^&*-+\\]{8,}$/.test(pw)
>   /^[\w!@#$%^&*-+\\]{8,}$/.test(pw) && /[a-z]/.test(pw) && /[A-Z]/.test(pw) && /\d/.test(pw) && /[!@#$%&*-+\\]/.test(pw)
```




## Regex in Python

Import the `re` library:

-   re.search()
-   re.finditer()
-   re.findall()
-   re.sub()
-   re.split()


