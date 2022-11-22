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

