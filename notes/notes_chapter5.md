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
