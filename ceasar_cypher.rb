def cypher (sentence, number = 0)
    new_string = ""
    if (number > 26)
        number = number % 26
    end
    arr = sentence.split("")
    arr.each do |c|
            if (c =~ /\W/) || c.to_i.to_s == c
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
p cypher("aGZP123", 27)

