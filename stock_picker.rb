def stock_picker(arr)

#defining needed variables

    profit = 0
    stock_day = []
    sell_day = 0
    buy_day = 0

#looping through the buy and sell

    arr.each do |buy|
        arr.each do |sell|

#The buy day should always be before the sell day and we're looking for maximum profit

            if (arr.index(buy) < arr.index(sell) and sell - buy > profit)

#saving our findings into variables each time conditions are met

                sell_day = arr.index(sell)
                buy_day = arr.index(buy)
                profit = sell - buy
                stock_day = [buy_day, sell_day]
            end
        end
    end

#output

    puts "Best day to buy: #{buy_day}"
    puts "Best day to sell is day #{sell_day}"
    puts "Max profit: #{profit}"
    return stock_day
end

stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]