
# Wordfinder
A word finding package that generates words containing specified letters. Comes prepackaged with an English dictionary, but can also be used with custom dicitonary files and arrays of words.

## Installation
Install using zef:
```
zef install wordfinder
```
Or simply download the GitHub repo.

## Usage
The package uses either a text file or a user-defined array to check for valid words, and comes prepackaged with a list of English words that can be easily called using the subroutines below.

The following three subroutines can be called; each takes a variable number of arguments and returns an array.

To check for words against a dictionary loaded from the provided file containing English words, use the check_file subroutine. To search for matching words, simply type the letters you'd like to check:
```
use wordfinder; 
check_file("abse");
# this would return words such as "base" and "bases"
```

To specify a specific word length, provide two arguments: first your letters, then the desired length of the word.
```
check_file("abse", 4);
# this would return "base" but not "bases," as it is only looking for 4 letter words
```

To use a different text file containing a list of words, specify the filepath within the subroutine call to check_file like in the examples below. Your text file must have each word on a new line. Specify your file path following the words you'd like to match:

```
check_file("abse", "path/to/file.txt");
# this would return any matching words from the file you specify
```

Word length can be specified following the file path:
```
check_file("abse", "path/to/file.txt", 7);
# this would return any matching 7 letter words from the file you specify
```

Finally, the check_array subroutine will check for words in a specified array. You can optionally specify the word length you're looking for here, as well:

```
my @sample_array = ["base", "abase", "bases"]
check_array("abse", @sample_array);
# returns ["base", "abase", "bases"]

my @sample_array = ["base", "abase", "bases"]
check_array("abse", @sample_array, 4);
# returns ["base"]
```
