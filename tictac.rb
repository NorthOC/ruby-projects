# frozen-string-literal: true

# defines the player object
class Player
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

# define the grid on which the players will play
class Grid
  def initialize
    @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @coin = true
    puts 'Welcome to tic tac toe cunt'
    print 'Player1 name: '
    name = gets.chomp
    @player1 = Player.new(name, 'X')
    print 'Player2 name: '
    name = gets.chomp
    @player2 = Player.new(name, 'O')
  end

  def to_console
    system('clear')
    puts "#{@player1.name} VS #{@player2.name}"
    full_grid
    if @coin
      my_turn(@player1)
    else
      my_turn(@player2)
    end
  end

  def my_turn(player)
    print "#{player.name}, please enter a number (1-9) to place #{player.mark} : "
    num = gets.chomp.to_i - 1
    if num.between?(0,8) && @arr[num].is_a?(Integer)
      @arr[num] = player.mark
      win(player)
      @coin = !@coin
      to_console
    else
      my_turn(player)
    end
  end

  private

  def grid_line(left, middle, right)
    print '+---' * 3, "+\n", "| #{left} | #{middle} | #{right} |\n"
  end

  def full_grid
    grid_line(@arr[0], @arr[1], @arr[2])
    grid_line(@arr[3], @arr[4], @arr[5])
    grid_line(@arr[6], @arr[7], @arr[8])
    print '+---' * 3, "+\n"
  end

  # 012 036 048 147 246 345 258 678

  def win(player)
    if @arr.all? { |i| i.is_a?(String) }
      print "It's a tie! Try again (y/n)? "
      answer = gets.chomp
      ending(answer)
    elsif testing(player)
      puts "#{player.name} wins! Try again (y/n)?"
      answer = gets.chomp
      ending(answer)
    end
  end

  def win_condition(player, in1, in2, in3)
    @arr[in1].to_s + @arr[in2].to_s + @arr[in3].to_s == player.mark * 3
  end

  def testing(player)
    combinations = ['012', '036', '048', '147', '246', '345', '258', '678']
    combinations.any? { |item| win_condition(player, item[0].to_i, item[1].to_i, item[2].to_i) }
  end

  def ending(answer)
    if answer == 'y'
      system('clear')
      start
    elsif answer == 'n'
      exit(0)
    else
      puts "ERROR: Answer with a \"y\" or \"n\": "
      answer = gets.chomp
      puts answer
      ending(answer)
    end
  end
end

def start
  grid = Grid.new
  grid.to_console
end

start
