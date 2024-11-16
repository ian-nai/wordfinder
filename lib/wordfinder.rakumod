module wordfinder {

    our sub check_strings($string1, $string2) is export {
        # This is a helper function for comparing strings.
        # It checks if the first string only contains characters that are also in the second string.
        my @unique_string1 = $string1.comb.unique;
        my @unique_string2 = $string2.comb.unique;

        if @unique_string1.sort( {.Str} ) ~~ @unique_string2.sort( {.Str} ) {
            return $string2;
        }
    }

    our sub check_strings_length(Str $string1, Str $string2, Int $num_to_match) is export {
        # This is a helper function for comparing strings, then only returning matches of a specified length.
        my @unique_string1 = $string1.comb.unique;
        my @unique_string2 = $string2.comb.unique;


        if @unique_string1.sort( {.Str} ) ~~ @unique_string2.sort( {.Str} ) {
            if $string2.chars == $num_to_match {
                return $string2;
            }
        }
    }

    our sub read_dict($dict_path) is export {
        # This is a helper function for reading a text file line by line, then pushing each line's contents as a separate item to an array.
        my @dict_file;
        for $dict_path.IO.lines -> $line {
            @dict_file.push($line);
            }
        return @dict_file;
    }

    our sub check_file(|args) is export {
        # Checking our file for words containing the same letters as our user-supplied string.
        if args.elems == 0 {
            say "Please supply a string of letters!"
        }
        if args.elems == 1 {
            my @match_list;
            my @dict_to_check = read_dict("resources/en_dict.txt");
            my $string_to_match = args[0];
            for @dict_to_check {
                my $checked_var = check_strings($string_to_match, $_);
                if $checked_var {
                    @match_list.push($checked_var);
                }
            }
            return @match_list;
        }
        elsif args.elems == 2 {
            if args[1] ~~ Int {
                my @match_list;
                my @dict_to_check = read_dict("resources/en_dict.txt");
                my $string_to_match = args[0];
                my $num_letters_to_match = args[1];
                for @dict_to_check {
                    my $checked_var = check_strings_length($string_to_match, $_, $num_letters_to_match);
                    if $checked_var {
                        @match_list.push($checked_var);
                    }
                }
                return @match_list;
            }
            else {
                my @match_list;
                my @dict_to_check = read_dict(args[1]);
                my $string_to_match = args[0];
                for @dict_to_check {
                    my $checked_var = check_strings($string_to_match, $_);
                    if $checked_var {
                        @match_list.push($checked_var);
                    }
                }
                return @match_list;
            }
        }
        elsif args.elems == 3 {
            my @match_list;
            my @dict_to_check = read_dict(args[1]);
            my $string_to_match = args[0];
            my $num_letters_to_match = args[2];
            for @dict_to_check {
                my $checked_var = check_strings_length($string_to_match, $_, $num_letters_to_match);
                if $checked_var {
                    @match_list.push($checked_var);
                }
            }
            return @match_list;
        }
        elsif args.elems >= 4 {
            say "Please supply fewer arguments!"
        }
    }

    our sub check_array(|args) is export {
        # Checking our array for words containing the same letters as our user-supplied string.
        if args.elems == 0 {
            say "Please supply a string of letters and a list of words!"
        }
        elsif args.elems == 1 {
            say "Please supply a string of letters and a list of words!"
        }
        elsif args.elems == 2 {
            my @match_list;
            my @dict_to_check = args[1];
            my $string_to_match = args[0];
            for @dict_to_check {
                my $checked_var = check_strings($string_to_match, $_);
                if $checked_var {
                    @match_list.push($checked_var);
                }
            }
            return @match_list;
        }
        elsif args.elems == 3 {
            my @match_list;
            my @dict_to_check = args[1];
            my $string_to_match = args[0];
            my $num_letters_to_match = args[2];
            for @dict_to_check {
                my $checked_var = check_strings_length($string_to_match, $_, $num_letters_to_match);
                if $checked_var {
                    @match_list.push($checked_var);
                }
            }
            return @match_list
        }
        elsif args.elems >= 4 {
            say "Please supply fewer arguments!"
        }
    }
}