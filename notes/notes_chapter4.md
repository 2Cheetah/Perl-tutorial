Chapter 4. Subroutines
======================
_Subroutine_ is a user-defined function. The name of a subroutine is another Perl identifier (letters, digits, underscores, but can't start with a digit) with a sometimes-optional ampersand &amp; in front.

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

The `return` Operator
---------------------
The `return` operator immideately returns value and therefore stops subroutine execution.
```
my @names = qw/ fred barney betty dino wilma pebbles bamm-bamm /;
my $result = &which_element_is("dino", @names);

sub which_element_is {
    my($what, @array) = @_;
    foreach (0..$#array) {
        if ($what eq #array[$_]) {
            return $_;
        }
    }
    -1; # element not found
}
```

Omitting the Ampersand
----------------------
In case Perl can work out that it is a subroutine, the &amp; is not needed. That happens e.g. when the subroutine definition was done before invoking it. As it is built-in function.
```
my @cards = shuffle(@deck_of_cards); # No & necesary on &shuffle
```
```
sub division {
    $_[0] / $_[1];
}

my $quotient = division 355, 113;
```
In case subroutine name is the same as built-in function, then &amp; is a must.
```
sub chomp {
    print "Munch, munch!\n";
}
&chomp; # That ampersand is not optional
```

Nonscalar Return Values
-----------------------
Subroutine called in a list context can return a list of values. `wantarray` function lets easily write subroutines with specific list or scalar context.
```
sub list_from_fred_to_barney {
    if ($fred < $barney) {
        $fred..$barney;
    } else {
        reverse $barney..$fred;
    }
}

$fred = 11;
$barney = 6;
@c = &list_from_fred_to_barney; # @c gets (11, 10, 9, 8, 7, 6)
```

Persistent, Private Variables
-----------------------------
With `state` private variables scoped to the subroutine can be kept between calls.
Declaring our variable with `state` tells Perl to retain the variable's value between calles to the subroutine and to make the variable private to the subroutine.
```
sub marine {
    state $n = 0; # private, persistent variable $n
    $n += 1;
    print "Hello, sailor number $n!\n";
}
```
`state` can be used with any variable type, not only _scalar_.
```
use v5.10;

running_sum( 5, 6 );
running_sum( 1..3 );
running_sum( 4 );

sub running_sum {
    state $sum = 0;
    state @numbers;

    foreach my $number (@_) {
        push @numbers, $number;
        $sum += $number;
    }
    
    say "The sum of (@numbers) is $sum";
}
```
Fibonacci numbers interpretation:
```
use v5.28;

sub next_fibonacci {
    state @numbers = (0, 1);
    push @numbers, $numbers[-2] + $numbers[-1];
    print "Next Fibonacci number is: $numbers[-1]\n";
}
```

Subroutine Signatures
---------------------
This is yet experimental feature. To enable it:
```
use v5.20;
use experimental qw(signatures);
```
Before:
```
sub max {
    my($m, $n);
    ($m, $n) = @_;
    if ($m > $n) { $m } else { $n }
}
```
Now:
```
sub max ( $m, $n ) {
    if ($m > $n) { $m } else { $n }
}
```
To be able to take more arguments, using that approach, it can be done as follows:
```
sub max ( $max_so_far, @others ) {
    foreach @others {
        if ($_ > $max_so_far) { $max_so_far = $_ }
    }
    $max_so_far;
}
```
Too few arguments can be bypassed with defualt values as follows:
```
sub list_from_fred_to_barney ( $fred = 0, $barney = 7 ) {
    if ($fred < $barney) {$fred..$barney} else {reverse $barney..$fred}
}

my @defaults = list_from_fred_to_barney();
my @default_end = list_from_fred_to_barney(17);
```
Optional arguments can be added with `$=`:
```
sub one_ot_two_args ($first, $=) {...}
```
To create a subroutine with exactly zero parameters, it is as easy as:
```
sub PI () { 3.1415926 }
```
