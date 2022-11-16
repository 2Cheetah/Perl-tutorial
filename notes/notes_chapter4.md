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

