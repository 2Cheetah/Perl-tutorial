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
