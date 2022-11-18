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

Formatted Output with `printf`
------------------------------
```
printf "Hello, %s; your password expires in %d days!\n", $user, $days_to_die;
```
The string holds number of _conversions_. Each _conversion_ begins with \% sign and ends with a letter.
`%g` to print number.
```
printf "%g %g %g\n", 5/2, 51/17, 51 ** 17; # 2.5 3 1.0683e+29
```
`%d` means decimal integer truncated as needed.
```
printf "in %d days!\n", 17.85; # in 17 days!
```
`%x` for hexadecimal, `%o` for octal.
```
printf "in 0x%x days!\n", 17; # in 0x11 days!
printf "in 0%o days!\n", 17; # in 021 days!
```
In Perl, `printf` is mostly used for columnar data. If the data won't fit, the field will generally be expanded as needed:
```
printf "%6d\n", 42; # output like ''''42 (where ' symbol is a space)
printf "%2d\n", 2e3 + 1.95; # 2001
```
`%s` means a string.
```
printf "%10s\n", "wilma"; # looks like '''''wilma
printf "%-15s\n", "flinstone"; # looks like flinstone'''''
```
`%f` means floating-point. Can round off its output as needed.
```
printf "%12f\n", 6*7 + 2/3; # looks like '''42.666667
printf "%12.3f\n", 6 * 7 + 2/3; # looks like ''''''42.667
printf "%12.0f\n",  6 * 7 + 2/3; # looks like ''''''''''43
```
`%%` to print a real percent sign
```
printf "Monthly interest rate: %.2f%%\n", 5.25/12; # the value looks like 0.44%
```
Instead of specifying number of characters with a `%` sign, it can be done with `*`.
```
printf "%*s", 10, "wilma"; # looks like '''''wilma
```
Double `*` to get the total width and the number of decimal places to format a float.
```
printf "%*.*f", 6, 2, 3.1415926; # looks like ''3.14
printf "%*.*f", 6, 3, 3.1415926; # looks like '3.142
```
`sprintf` in perldoc for more documentation.

Arrays and `printf`
-------------------
```
my @items = qw( wilma dino pebbles );
my $format = "The items are:\n" . ("%10s\n x @items");
## print "the format is >>$format<<\n"; # for debugging
printf $format, @items;
```
This can even be combined:
```
printf "The items are:\n" . ("$10s\n" x @items), @items;
```

Filehandles
-----------
A _filehandle_ is the name in a Perl program for an I/O connection between your Perl process and the outside world. That is, it's the name of a _connection_, not necessarily the name of a file.
The _filehanles_ are named like other Perl identifiers: letters, digits, and underscores (but not started with a digit). Recommendation from Larry to use all uppercase letters for _filehandle_.
There are six special _filehandle_ names that Perl already uses for its own purposes: `STDOUT`, `STDIN`, `STDERR`, `DATA`, `ARGV`, `ARGVOUT`.
At no extra charge, the program will work in a _pipeline_.
```
$ cat fred barney | sort | ./your_program | grep something | lpr
```
_Standard error stream_ `STDERR`. By default, the errors will generally go to the user's display screen, but the user may send the errors to a file with a shell command like this one:
```
$ netstat | ./your_program 2>/tmp/my_errors
```

Opening a Filehandle
--------------------
There are three _filehandles_ which were presented previously: `STDIN`, `STDOUT`, `STDERR`. To use other _filehandles_ `open` operator is to be used, to ask the operating system to open the connection between a program and the outside world. For instance:
```
open CONFIG, 'dino';
open CONFIG, '<dino';
open BEDROCK, '>fred';
open LOG, '>>logfile';
```
The first one opens a _filehandle_ called `CONFIG` to a file called _dino_.
The second line does the same as the first, but less-than sign explicitly says "use this filename for input".
A greater-than sign is used in shell redirection to send the output to a _new_ file called _fred_.
Double greater-than sign shows that a file is opened for _appending_ data.
```
my $selected_output = 'my_output';
open LOG, "> $selected_output";
```
It is worth noting the space after the greater-than sign. Perl ignores this, but it keeps unexpected things from happening if `$selected_output` were `">passwd"`, for example (which would make an append instead of a write).
In modern versions of Perl it can be written a "three-argument" `open`:
```
open CONFIG, '<', 'dino';
open BEDROCK, '>', $file_name;
open LOG, '>>', &logfile_name();
```
The second argument is _the mode_.
Another advantage of the three-argument approach is that an encoding can be specified.
```
open CONFIG, '<:encoding(UTF-8)', 'dino';
```
Same goes for writing:
```
open BEDROCK, '>:encoding(UTF-8)', $file_name;
open LOG, '>>:encoding(UTF-8)', &logfile_name();
```
There's a shortcut for `encoding(UTF-8)` `:utf8`. But using `encoding(UTF-8)`, you ensure that the data is encoded correctly. The `:utf8` takes whatever it gets and marks it as a _UTF-8_ string even if it isn't, which might cause problems later.
You can get a list of all of the encodings that perl understands with a Perl one-liner:
```
$ perl -MEncode -le "print for Encode->encodings(':all')"
```
DOS line endings, where each line neds with a carriage-return/linefeed (CR-LF) pair (also normally written as "\r\n"). Unix line endings only use the newlines. When you try to use one on the other, odd things can happen. The `:crlf` encoding takes care of that. When you want to ensure that you get a CR-LF at the end of each line, you can set that encoding on the file:
```
open BEDROCK, '>:crlf', $file_name;
```
Although if there's already a CR-LF, it will be doubled.
To read a file with DOS line endings:
```
open BEDROCK, '<:crlf', $file_name;
```
With that line Perl will translate all CR-LFs to just newlines.

Binmoding Filehandles
---------------------
In older Perl versions, if you didn't want to translate line endings, you used `binmode` to turn off line-ending processing:
```
binmode STDOUT; # don't translate line endings
binmode STDERR; # same
```
Perl 5.6 called it a _discipline_, but that name changed in favor of _layer_.
If you want to output Unicode to STDOUT, you want to ensure that STDOUT knows how to handle what it gets:
```
binmode STDOUT, ':encoding(UTF-8)';
```
If you don't do that, you might get a warning, even without turning on warnings, because STDOUT doesn't know how you'd like to encode it:
```
Wide character in print at test line 1.
```
Same goes for input handles.
```
binmode STDIN, ':encoding(UTF-8)';
```

Bad Filehandles
---------------
Actually, Perl can't open a file all by itself. It asks for the operting system to let it open a file. It you try to read from a bad filehandle (that is, a filehandle that isn't properly open or a closed network connection), you'll see an immidiate end-of-file.
With `warning` pragma or `-w` flag Perl will be able to throw a warning when it sees a bad filehandle. But even before that, `open` always tells if it succeeded or failed by returning _true_ for success or _false_ for failure.
```
my $success = open LOG, '>>', 'logfile';
if (! $success) {
    # The open failed
    ...
}
```
It can be done like that, but there's a better way, shown below.

Closing a Filehandle
--------------------
When you are finished with a filehandle, you may close it with the `close` operator
```
close BEDROCK;
```
Many simple Perl programs don't bother with `close`. But it's there if you want to be tidy, with one `close` for every `open`. In general, it's best to close each filehandle soon after you're done with it, though the end of the program often arrives soon enough.

Fatal Errors with `die`
-----------------------
When a fatal error happens inside Perl (for example, if you divide by zero, use an invalid regular expression, or call a subroutine that you haven't declared), your program stops with an error message telling why. But this functionality is available to you with `die` function, to make your own fatal errors.
The `die` function prints out the message you give it (to the standard error stream, where such messages should go) and makes sure that the program exits with a _nonzero_ exit status. Traditionally `0` stands for _success_. Previous example can be rewritten in the following way:
```
if ( ! open LOG, '>>', 'logfile' ) {
    die "Cannot create logfile: $!";
}
```
`$!` is human-readable complaint from the system. It holds a useful value only immideately after a _failed_ system request.
Additionally, `die` appends the Perl program name and line number:
```
Cannot create logfile: permission denied at your_program line 1234.
```
Another way `die` can be used is with a trailing newline on the message:
```
if (@ARGV < 2) {
    die "Not enough arguments\n";
}
```
