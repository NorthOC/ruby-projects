def stock_picker(arr)
#defining needed variables
    profit = 0
    stock_day = []
    arr.each do |buy|
        arr.each do |sell|
            if (arr.index(buy) < arr.index(sell) and sell - buy > profit)
                sell_day = arr.index(sell)
                buy_day = arr.index(buy)
                profit = sell - buy
                stock_day = [buy_day, sell_day]
            end
        end
    end
    return stock_day
end
print stock_picker([17,3,6,9,15,8,6,1,10])