# Chapter 6. Hashes

## What Is a Hash?

Hash keys are strings. These keys are arbitrary strings - you can use any string expression for a hash key. They are unique strings.
The values of a hash may be all numbers, all strings, `undef` values, or a mixture.

## Hash Element Access

```
$hash{$some_key}
```

```
$family_name{'fred'} = 'flinstone';
$family_name{'barney'} = 'rubble';

foreach my $person (qw< barney fred >) {
  print "I've heard of $person $family_name{$person}.\n";
}
```

Hash keys may be any expression.

```
$foo = 'bar';
print $family_name{ $foo . 'ney' };
```

Assigning a value to already created key-value pair overwrites the value.

```
$family_name{'fred'} = 'astaire';
$bedrock = $family_name{'fred'}; # gives 'astaire', not 'flinstone'
```

Hash elements spring into existence when you first assign to them:

```
$family_name{'wilma'} = 'flinstone';
$family_name{'betty'} .= $family_name{'barney'};
```

Accessing outside the hash gives `undef`:

```
$granite = $family_name{'larry'}; # No larry here: undef
```

## The Hash as a Whole

To refer to the entire hash, use the percent sign `%` as a prefix.
For convenience, you can convert a hash into a list and back again. Assigning to a hash is a list-context assignment, where the list is key-value pairs:

```
%some_hash = ('foo', 35, 'bar, 12.4, 2.5, 'hello', 'wilma', 1.72e30, 'betty', "bye\n");
```

Although any list expression can be used, it must have an even number of elements, because the hash is made of _key-value pairs_.
The value of the hash (in a list context) is a simple list of key-value pairs:

```
my @any_array = %some_hash;
```

Perl calls this _unwinding_ the hash - turningn it bach into a list of key-value pairs. Of course, the pairs won't necessarily be in the same order as the original list:

```
print "@any_array\n";
# might give something like:
# betty bye (and a newline) wilma 1.72e+30 foo 35 2.5 hello bar 12.4
```

In scalar context, a hash retirns the number of keys in the hash: `my $count = %hash;`.
Even though the order of key-value pairs is jumbled, each key is followed by its value.

## Hash Assignment

Hash can be assigned by copying from another hash (doesn't make much sense though):

```
my %new_hash = %old_hash;
```

It's more common to transform the hash in some way, though. For example, you could make an inverse hash:

```
my %inverse_hash = reverse %any_hash;
```

## The Big Arrow

Big arrow `=>` used to visually distinguish key and values:

```
my %last_name = ( # a hash may be a lexical variable
  'fred' => 'flinstone',
  'dino' => undef,
  'barney' => 'rubble',
  'betty' => 'rubble',
);
```

You may omit the quote marks on some hash keys when you use the fat comma, which automatically quotes the values to its left:

```
my %last_name = (
  fred => 'flinstone',
  dino => undef,
  barney => 'rubble',
  betty => 'rubble',
);
```

But quotes can be omitted not for any key:

```
my %last_name = (
  + => 'flinstone', # WRONG! Compilation error!
);
```

If the hash key is made up of nothing but letters, digits, and underscores (without starting with a digit), you _may_ be able to omit the quote marks.
Same approach can be used when calling for a value with a key: `$score{fred}`. If there's anything inside the curly braces besides a _bareword_, Perl will interpret it as an expression.

```
$hash{ bar.foo } = 1; # that's the key 'barfoo'
```
