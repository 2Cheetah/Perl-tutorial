# The if Control Structure
```
if ($name gt 'fred') {
    print "'$name' comes after 'fred' in sorted order.\n";
};
```
Else statement:
```
if ($name gt 'fred') {
    print "'$name' comes after 'fred' in sorted order.\n";
} else {
    print "'$name' does not come after 'fred'.\n";
    print "Maybe it's the same string, in fact.\n";
}
```

# Boolean Values
You may actually use any scalar value as the conditional of the _if_ control structure. That's handy if you want to store a true or false value in a variable, like this:
```
$is_bigger = $name gt 'fred';
if ($is_bigger) {...}
```
* If the value is a number, 0 means _false_; all other numbers mean _true_.
* Otherwise, if the value is a string, the empty string ('') and the string '0' mean false; all other strings mean true.
* If the variable doesn't have a value yet, it's false.
If it's needed to get the opposite of any Boolean value, use the unary _not_ operator, !.
```
if (! $is_bigger) {
    # Do something when #is_bigger is not true
}
```
Since Perl doesn't have a separate Boolean type, the ! has to return some scalar to represent _true_ and _false_. It turns out that 1 and 0 are good enough values, so some people like to normalize their data to just those values. To do that, they double up the ! to turn true into false into true again (or the other way around):
```
$still_true = !! 'Fred';
$still_false = !! '0';
```

# Getting User Input
The simplest way: use the line-input operator, <STDIN>.
Each time you use <STDIN> in a place where Perl expects a scalar value, Perl reads the next complete text line from _standard input_ (up to and including the first newline), and uses that string as the value of <STDIN>.
```
$line = <STDIN>;
if ($line eq "\n") {
    print "That was just a blank line!\n";
}
else {
    print "That line of input was: $line";
}
```
But in practice, you don't often want to keep the newline, so you need the _chomp()_ operator.

## The _chomp_ Operator
It removes a newline character from the string.
```
$text = "a line of text\n";
chomp($text);
```
In fact, there's an easier way to use _chomp()_ because of a simple rule: anytime that you need a variable in Perl, you can use an assignment instead. First, Perl does the assignment.
```
chomp($text = <STDIN>);
```
There's a general rule in Perl: except cases where it changes the meaning to remove them, parentheses are always optional.
```
$food = <STDIN>;
$betty = chomp $food # gets the value 1. chomp is a function that returns number of removed characters
```
If the string ends with two or more newlines _chomp()_ removes only one. If there's no newline, it does nothing and returns zero.

# The _while_ Control Structure
```
$count = 0;
while ($count < 10) {
    $count += 2;
    print "count os now $count\n";
}
```

# The _undef_ Value
Variables have the special _undef_ value before they are first assigned, which is just Perl's way to say "Nothing here to look at - move along, move along." It acts like _zero_ as "numeric something" and like _empty string_ if "string something".
```
# Add up some odd numbers
$n = 1;
while ($n < 10) {
    $sum += $n;
    $n += 2;
}
print "The total was $sum.\n";
```
Same goes for strings:
```
$string .= "more text\n";
```

# The _defined_ Function
To tell whether a value is _undef_ and not the empty string, use the _defined_ function, which returns _false_ for _undef_ and _true_ for everything else:
```
$next_line = <STDIN>;
if ( defined($next_line) ) {
    print "The input was $next_line";
} else {
    print "Not input available!\n";
}
```

To make your own _undef_ values, it can be made as follows:
```
$next_line = undef;
```

