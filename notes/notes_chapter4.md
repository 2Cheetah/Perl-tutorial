Chapter 4. Subroutines
======================
_Subroutine_ is a user-defined function. The name of a subroutine is another Perl identifier (letters, digits, underscores, but can't start with a digit) with a sometimes-optional ampersand &amp in front.

Defining a Subroutine
---------------------
```
sub marine {
    $n += 1; # Global variable $n
    print "Hello, sailor number $n!\n";
}
```

Invoking a Subroutine
---------------------
```
&marine; # says "Hello, sailor number 1!"
&marine; # says "Hello, sailor number 2!"
```
Instead of _invoking_ it can be simple refered to as _calling_ subroutine.

Return Values
-------------
Whatever calculation is _last_ performed or _evaluated_ in a subroutine is _automatically_ also return value.
```
sub sum_of_fred_and_barney {
    print "Hey, you called the sum_of_fred_and_barney subroutine!\n";
    $fred + $barney; # That's the return value
}
$fred = 3;
$barney = 4;
$wilma = &sum_of_fred_and_barney; # 7
$betty = 3 * &sum_of_fred_and_barney; # 21
```
For example, this subroutine returns the larger value of `$fred` or `$barney`
```
sub larger_of {
    if ($fred > $barney) {
        $fred;
    } else {
        $barney;
    }
}
```

Arguments
---------
```
$n = &man(10, 15);
```
Perl automatically stores the parameter list (another name for argument list) in the special array variable named `@_` for the duration of the subroutine. That means that first parameter is `$_[0]`, second argument is `$_[1]` and so on. With the arguments subroutine max can look like:
```
sub max {
    if ($_[0] > $_[1]) {
        $_[0];
    } else {
        $_[1];
    }
}
```

Private Variables in Subroutines
--------------------------------
Private variables calles _lexical variables_ can be created at any time with `my` operator.
```
sub max {
    my($m, $n);
    ($m, $n) = @_;
    if ($m > $n) { $m } else { $n }
}
```
These variables are private (or _scoped_) to the enclosing block. Previous code can be even more shortened:
```
    my($m, $n) = @_;
```

Variable-Length Parameter Lists
-------------------------------
### A better \&max Routine
```
$maximum = &max(3, 5, 10, 4, 6);

sub max {
    my($max_so_far) = shift @_;
    foreach (@_) {
        if ($_ > $max_so_far) {
            $max_so_far = $_;
        }
    }
    $max_so_far;
}
```
This code uses what has often been called the _high-water mark_ algorithm.

Empty Parameter Lists
---------------------
In that case `&max` subroutine returns `undef` value, which is fine, but probably should be treated accordingly.

Notes on Lexical (my) Variables
-------------------------------
These lexical variables can be used everywhere, not merely in subroutines. For example, in `if` statements as well.
```
foreach (1..10) {
    my($square) = $_ * $_;
    print "$_ squared is $square.\n";
}
```
`my` operator doesn't change context:
```
my($num) = @_; # list context, same as ($num) = @_;
my $num = @_; # scalar context, same as $num = @_;
```
Without parentheses `my` declares only one variable:
```
my $fred, $barney; # WRONG! Fails to declare $barney;
my($fred, $barney); # Declares both variables;
```
Private array can be created the same way
```
my @phone_number;
```
_Control variable_ can be private as well:
```
foreach my $rock (qw/ bedrock slate lava /) {
    print "One rock is $rock.\n";
}
```

The use strict Pragma
---------------------
The `use strict` pragma tells Perl's internal compiler that it should enforce some good programming rules for the rest of this block or source file. Implicitly stating a version of Perl means that strict pragma applies as well.
Most people recommend that programs that are longer than a screenful of text generally need `use strict`.
