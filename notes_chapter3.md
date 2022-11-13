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
If the subscript indicates an element that would be beyond the end of the array, the corresponding value will be _undef_.
```
$blank = $fred[ 142_857 ]; # unused array element gives undef
$blanc = $mel; # unused scalar $mel also gives undef
```

Special Array Indices
---------------------

