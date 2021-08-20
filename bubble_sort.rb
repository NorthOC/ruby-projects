def bubble_sort(arr)

# define the number of items in an array starting from 0 instead of 1

    n = arr.length - 1

# inner loop sorts biggest int to the right, outer loop repeats that for each int

    for i in 1..n do
        for c in 1..n do
            if (arr[c-1] > arr[c])
                arr[c-1], arr[c] = arr[c], arr[c-1]
            end
        end

#optimization for increased speed

        n = n - 1
    end

#output

    arr
end

print bubble_sort([55,5,555,420,69])
# => [5, 55, 69, 420, 555]