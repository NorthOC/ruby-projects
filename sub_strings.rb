$dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

#adding string count to a hash

def hashfunc(hash, item)
    if (hash[item] == nil)
        hash[item] = 1
    else
        hash[item] += 1
    end
end
#method which compares words of the string to the dictionary
def compare (item, word)
    return word <=> item
end

def substrings(string, dict)
    #remove symbols
    downcase = string.downcase.gsub(/[^0-9A-Za-z]/, ' ')
    arr = downcase.split(" ")
    hash = {}
    arr.each do |word|
        $dictionary.each do |item|
            if (word.include?(item) == true)
                hashfunc(hash, item)
            end
        end
    end
    print hash
end

substrings("Howdy partner, sit down! How's it going?", $dictionary)