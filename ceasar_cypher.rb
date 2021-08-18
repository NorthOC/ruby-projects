def cypher (sentence, number = 0)
    new_string = ""
    if (number > 26)
        number = number % 26
    end
    arr = sentence.split("")
    arr.each do |c|
            if (c =~ /\W/)
                new_string << c
            elsif c.ord < 91 and (c.ord + number) >= 91
                new_string << (c.ord + number - 26)
            elsif (c.ord + number) > 122
                new_string << (c.ord + number - 26)
            else
                new_string << (c.ord + number)
            end
        end
        new_string
    end
puts cypher("We are The worlZ!", 20)