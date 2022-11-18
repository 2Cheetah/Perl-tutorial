Chapter 5. Input and Output
===========================
Input from Standard Input
-------------------------
It is done with `<STDIN>` operator. Can be used with both scalar and list context.
```
$line = <STDIN>;
chomp($line);
chomp($line = <STDIN>);
```
It's actually a line-input operator around a _filehandle_. Since the line-input operator will return `undef` when reaching end-of-file, this is handy for dropping out of loops:
```
while (defined($line = <STDIN>)) {
    print "I saw $line";
}
```
A shortcut for this:
```
while (<STDIN>) {
    print "I saw $_";
}
```
It works _only_ in that statement, if there's nothing but the line-input operator in the conditional of a `while` loop.
```
foreach (<STDIN>) {
    print "I saw $_";
}
```
In that case, Perl's favorite default operator `$_` corresponds to `foreach` statement.
With large input logs, e.g. 400 MB, it is all the time better to use while loop because it won't load all of the input in memory, but will read it line-by-line.

Input from the Diamond Operator
-------------------------------
Diamond operator `<>`. The _invocation arguments_ to a program are normally a number of "words" after the name of the program.
```
$ ./my_program fred barney betty
```
Instead of getting the input from the keyboard, `<>` Diamond Operator takes the user's choice of input:
```
while (defined($line = <>)) {
    chomp($line);
    print "It was $line that I saw!\n";
}
```
As with shortcut for `<STDIN>` same goes for `<>`
```
while (<>) {
    chomp($_);
    print "It was $_ that I saw.\n";
}
```

The Double Diamond
------------------
The _double diamond_ operator prevents unexpected behaviour in case there're special symbols in filenames like `|`, which might cause Perl to perform _pipe open_, which runs an external program and reads that program's output as if it were a file.
```
use v5.22;

while (<<>>) {
    chomp;
    print "It was $_ that I saw!\n";
}
```
It must be used instead of _diamond operator_ in Perl versions above v5.22.

The Invocation Arguments
------------------------
_Diamond operator_ works from `@ARGV` array.
`Getopt::Long` and `Getopt::Std` for more information about options and arguments processing.
```
@ARGV = qw# larry moe curly #; # force these three files to be read
while (<>) {
    chomp;
    print "It was $_ that I saw in some stooge-like file!\n";
}
```

Output to Standard Output
-------------------------
```
$name = "Larry Wall";
print "Hello there, $name, did you know that 3+4 is ", 3+4, "?\n";
```
```
print @array; # print a list of items without spaces. "fredbarneybetty"
print "@array" # print a string (containing an interpolated array) "fred barney betty"
```
Since `print` is looking for a list of strings to print, it evaluates its arguments in list context.
```
print <>; # implementation of /bin/cat
print sort <>; # implementation of /bin/sort
```
`print` has optional parentheses. Parentheses in Perl may always be omitted - except when doing so would change the meaning of a statement.
```
print("Hello, world!\n");
print "Hello, world!\n"; # same result
```
Another rule in Perl is that if the invocation of `print` _looks_ like a function call, then it _is_ a function call. E.g.:
```
print (2+3); # looks like function call => it is a function call
```
```
$result = print (2+3); # $result obtains 1 as an output;
```
```
print (2+3)*4;
```
In that example Perl calculates 2+3, then evaluates `print` as a function with output of 1 and then multiplies it by 4. The output will be 5.
When there are no parentheses, `print` is a list operator, printing all of the items in the following list. With paretheses it is a function call. In other words, for Perl last example looks like:
```
( print (2+3) ) * 4;
```
