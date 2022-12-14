Lists and Arrays
================
If scalar is the "singular" in Perl, then "plural" is represented by lists and arrays.
A _list_ is an ordered collection of scalars. An _array_ is a variable that contains a list.
Each _element_ of an array or list is a separate scalar value. The elements of an array or list are _indexed_ by integers starting at zero and counting by ones, so the first element of any array or list is always element zero.

Accessing Elements of an Array
------------------------------
Perl provides a way to _subscript_ an array in order to refer to an element by a numeric index.
```
$fred[0] = "yabba";
$fred[1] = "dabba";
$fred[2] = "doo";
```
```
print $fred[0];
$fred[2] = "diddley";
$fred[1] .= "whatsis";
```
The subscript may be any expression that gives a numeric value. If it's not an integer already, Perl will automatically truncate it (not round!) to the whole number portion:
```
$number = 2.71828;
print $fred[$number - 1]; # Same as printing $fred[1]
```
If the subscript indicates an element that would be beyond the end of the array, the corresponding value will be `undef`.
```
$blank = $fred[ 142_857 ]; # unused array element gives undef
$blanc = $mel; # unused scalar $mel also gives undef
```

Special Array Indices
---------------------
If Perl needs to create the intervening elements, it creates them as `undef` values:
```
$rocks[0] = 'bedrock';
$rocks[1] = 'slate';
$rocks[99] = 'schist'; # now there are 97 undef elements.
```
To get value of the last element index in an array. It can be done as easy as `$#rocks`:
```
$end = $#rocks; # assignes 99 to $end
$rocks[$#rocks] = 'hard rock';
```
Values of elements in array can be accessed with negitve indexes, where -1 - last element, -2 - element before last one etc. That means that `$rocks[$#rocks]` is the same as `$rocks[-1]`.

List Literals
-------------
A _list literal_ is a list represented by values inside parenthesis. E.g.:
```
(1, 2, 3) # list of three numbers
(1, 2, 3, ) # the same list, last comma is ignores
('fred', 1) # list of two values
( ) # empty list
```
In case a list must store a sequence, it can be done as follows:
```
(1..100) # list of 100 integers
(1.3..100.2) # the same list, both values are truncated
(0, 2..6, 10, 12) # same as (0, 2, 3, 4, 5, 6, 10, 12)
```
The range operator can only go "uphill":
```
(5..1) # creates empty list
```
The elements of list literal not necesserily must be constants, they can be expressions as well:
```
($m, 17) # the current value of $m and 17
($m+$o, $p+$q)
($m..$n) # range from $m to $n
(0..$#rocks)
```
The `qw` Shortcut
-----------------
`qw` is designed to create a list with strings, taking out necessity to write a lot of quotes:
```
("fred", "bread", "betty", "shmetty")
qw( fred bread betty shmetty ) # creates the same list
```
`qw` stands for _quoted words_ or _quoted by whitespace_. Perl lets use any delimiter instead of parenthesis:
```
qw! fred bread betty shmetty !
qw/ fred bread betty shmetty /
qw# fred bread betty shmetty # # like a comment
```
Another option is to use "left" and "right" delimiters, not necessarily parenthesis:
```
qw< fred bread betty shmetty >
qw[ fred bread betty shmetty ]
qw{ fred bread betty shmetty }
```
In case it is needed to include a symbol which is the same as delimiter, it can be added with a help of `backslash`:
```
qw! fred bread\! betty shmetty ! # fred bread! betty shmetty
```
The `qw` is useful for example to store a Unix filenames, like this:
```
qw {
    /usr/home/words
    /home/rootbeer/.ispell_english
}
```
List Assignment
---------------
In the same manner scalar values can be assigned to variables, list values can be assigned to list variables:
```
($fred, $barney, $dino) = ("flinstone", "rubble", undef)
```
List on the right side is being evaluated first. That allows to easy change values of list items as follows:
```
($fred, $barney) = ($barney, $fred); # swap the values
($betty[0], $betty[1]) = ($betty[1], $betty[0]);
```
In case amount of variables in the list on the left is more than assigned values on the right, `undef` value is assigned to the variables without values. In case amount of values in the list on the right side is more than on the left side, excessive values are omitted.
```
($fred, $barney) = qw< flinstone rubble slate granite >; # two ignored items
($wilma, $dino) = qw[flinstone]; # $dino gets undef
```
To refer to an entire array `@` notation is used:
```
@rocks = qw/ bedrock slate lava /;
@tiny = ( ); # the empty list
@giant = 1..1e5; # a list with 100_000 elements
@stuff = (@giant, undef, @giant); # a list with 200_001 elements
$dino = "granite";
@quarry = (@rocks, "crushed rock", @tiny, $dino);
```
An array expands the to the list it contains. Array can contain only scalars, not arrays.
Copying an array to another array is still list assignment.
```
@copy = @quarry; # copy a list from one array to another
```
The `pop` and `push` Operators
------------------------------
The pop operator takes the last element off of an array and returns it:
```
@array = 5..9;
#fred = pop(@array); # $fred gets 9, @array now has (5, 6, 7, 8)
$barney = pop @array; # $barney gets 8, @array now has (5, 6, 7)
pop @array; # @array now has (5, 6). (The 7 is discarded.)
```
The last example uses pop in a _void context_, which is a fancy way of saying the return value isn't going anywhere. If the array is empty, `pop` returns `undef`.
The converse operation is `push`, which adds an element (or a list of elements) to the end of an array:
```
push(@array, 0); # @array now has (5, 6, 0)
push @array, 8; # @array now has (5, 6, 0, 8)
push @array, 1..10; # @array now has those 10 new elements;
@others = qw/ 9 0 2 1 0 /;
push @array, @others; # @array now has those five new elements (19 total)
```
The `shift` and `unshift` Operators
-----------------------------------
Similarly to `pop` and `push`, `shift` and `unshift` operators perform operations with the beginning of the array.
```
@array = qw# dino fred barney #;
$m = shift(@array); # $m gets "dino", @array now has ("fred", "barney")
$n = shift @array; # $n gets "fred", @array now has ("barney")
shift @array; # @array is now empty
$o = shift @array # $o gets undef, @array is still empty
unshift(@array, 5); # @array now has the one-element list (5)
unshift @array, 4; # @array now has (4, 5)
@others = 1..3;
unshift @array, @others; # @array now has (1, 2, 3, 4, 5)
```
The same as `pop`, `shift` returns `undef` from an empty array.
The `splice` Operator
---------------------
The `push-pop` and `shift-unshift` operators work with the ends of an array. To perform the same operation in the middle of an array it's needed to use `splice` operator. It takes up to four arguments, two of which are optional.
```
@array = qw ( pebbles dino fred barney betty );
@removed = splice @array, 2; # remove fred and everything after
# @removed is qw(fred barney betty)
# @array is qw(pebbles dino)
```
Third argument specifies the length.
```
@array = qw( pebbles dino fred barney betty );
@removed = splice @array, 1, 2 # @removed = qw( dino fred )
# @array is now qw( pebbles barney betty )
```
The fourth argument is a replacement list. It doesn't have to be the same size as removed list.
```
@array = qw( pebbles dino fred barney betty );
@removed = splice @array, 1, 0, qw( wilma ); # removes nothing, adds qw( wilma ). Eventually, @array = qw( pebbles wilma dino fred barney betty )
```
Interpolating Arrays into Strings
---------------------------------
```
@rocks = qw{ flinstone slate rubble };
print "quartz @rocks limestone\n"; # prints five rocks separated by spaces
```
It must be not forgotten cases with emails:
```
$email = "ano@nymous.com"; # Perl will try to get array @nymous instead of email address
$email = "ano\@nymous.com"; # correct way
$email = 'ano@nymous.com'; #correct way as well
```
A single element of an array interpolates into its value:
```
@fred = qw( hello dolly );
$y = 2;
$x = "This is $fred[1]'s place";
$x = "This is $fred[$y - 1]'s place"; # provides the same result as previous line
```
The index expression evaluates as an ordinary expression, as if it were outside a string. It is _not_ variable-interpolated first.
```
@fred = qw(eating rocks is wrong);
$fred = "right";
print "this is $fred[3]\n"; # this is wrong
print "this is ${fred}[3]\n"; # this is right[3]
print "this is $fred"."[3]\n"; # this is right[3]
print "this is $fred\[3]\n"; # this is right[3]
```
The `foreach` Control Structure
-------------------------------
```
foreach $rock (qw/ bedrock slate lava /) {
    print "One rock is $rock.\n; # Prints names of three rocks
}
```
`$rock` is called _control variable_. It is not a copy of a value from an array, it is the array value itself. If the _control variable_ is modified, that means that respective array variable is modified.
```
@rocks = qw/ bedrock slate lava /;
foreach $rock (@rocks) {
    $rock = "\t$rock";
    $rock .= "\n";
}
print "The rocks are:\n", @rocks;
```
In case name of _control variable_ matches already defined variable, it takes values of the array with `foreach` _control structure_ and after its finish gets value of the already defined variable.
```
$rock = 'shale';
@rocks = qw/ bedrock slate lava /;
foreach $rock (@rocks) {
...
}
print "rock is still $rock\n"; # 'rock is still shale'
```
Perl's Favourite Default: $\_
-----------------------------
_Control variable_ can be omitted in `foreach` control structure. In that case Perl automatically assigns default _control variable_ `$_`.
```
foreach (1..10) {
    print "I can count to $_!\n";
}
```
This default variable `$_` can be used in different cases, not only in `foreach` structure:
```
$_ = "Yabba dabba doo\n";
print; # prints $_ by default
```
The `reverse` Operator
----------------------
`reverse` takes a list of values and returns that list in reverse order.
```
@fred = 6..10;
@barney = reverse(@fred); # gets 10, 9, 8, 7, 6
@wilma = reverse 6..10;
@fred = reverse @fred; # puts the result back into the original array
```
`reverese` doesn't affect the initial array. If the result is not assigned anywhere, it's useless.
The `sort` Operator
-------------------
The `sort` operator takes a list of values and sorts them in the internal character ordering. For strings, that would be in code point order. It is a strange place where all of the capital letters come before all of the lowercase letters, where the numbers come before letters. It's a _default_ behavior.
```
@rocks = qw/ bedrock slate rubble granite /;
@sorted = sort(@rocks);
@back = reverse sort @rocks;
@rocks = sort @rocks;
@numbers = sort 97..102; # gets 100, 101, 102, 97, 98, 99
```
`sort` doesn't affect original array. To make an array sorted, it's needed to assign sorted array to itself.
```
@rocks = sort @rocks;
```
The `each` Operator
-------------------
`each` can be used with arrays and hashes. It returns _index_ and _value_.
```
@rocks = qw/ bedrock slate rubble granite /;
while( ( $index, $value ) = each @rocks ) {
    print "$index: $value\n";
}
```
The same can be done with `foreach`.
```
@rocks = qw/ bedrock slate rubble granite /;
foreach $index ( 0..$#rocks ) {
    print "$index: $rocks[$index]\n";
}
```
Scalar and List Context
-----------------------
_Context_ means that depending on it Perl's behaviour will be different.
Expressions in Perl always return the appropriate value for their context.
```
@people = qw( fred barney betty );
@sorted = sort @people; # list content: barney, betty, fred
$number = 42 + @people; # scalar context: 42 + 3 gives 45
```
```
@list = @people; # a list of three
$n = @people; # the number 3
```
### Using List-Producing Expressions in Scalar Context
`reverse` in a list context returns reversed list, but in a scalar context it returns reversed string.
```
@backwards = reverse qw/ yabba dabba doo /; # gives doo, dabba, yabba
$backwards = reverse qw/ yabba dabba doo /; # gives oodabbadabbay
```
```
$fred = something; # scalar context
@pebbles = something; # list context
($wilma, $betty) = something; # list context
($dino) = something; # still list context
```
Scalar context:
```
$fred = something; # scalar context
$fred[3] = something; # scalar context
123 + something # scalar context
something + 645
if (something) {...}
while (something) {...}
$fred[something] = something;
```
List context:
```
@fred = something;
($fred, $barney) = something;
($fred) = something;
push @fred, something;
foreach $fred (something) {...}
sort something
reverse something
print something
```
### Using Scalar-Producing Expressions in List Context
```
@fred = 6 * 7; # gets the one-element list (42)
@barney = "hello" . ' ' . "world";
```
### Forcing Scalar Context
To force Perl use _Scalar Context_ instead of _List Context_ function `scalar` can be used:
```
@rocks = qw( talc quartz jade obsidian );
print "How many rocks do you have?\n";
print "I have ", @rocks, "rocks!\n"; # WRONG, prints names of rocks
print "I have ", scalar @rocks, "rocks!\n"; # Correct, gives a number
```
### \<STDIN\> in List Context
`<STDIN>` can return not only a line in scalar context, but in list context as well it returns _all_ of remaining lines up to the end-of-file.
```
@lines = <STDIN>; # read standard input in list context
```
In Linux to stop line insertion you need to press Ctrl-D. On DOS/Windows systems it is performed with Ctrl-Z.
Each element in the list is a string which ends with `/n` newline character. `chomp` in that case can be used with the created array:
```
@lines = <STDIN>; # Read all the lines
chomp(@lines); # discard all the newline characters
```
But the more common way to write that is with code similar to what you used earlier:
```
chomp(@lines = <STDIN>); # Read the lines, not the newlines
```
