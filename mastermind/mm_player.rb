# frozen_string_literal: true

require_relative 'modules'
require_relative 'mm_robot'

# This is the game when the player has to guess.
class RobotCreate
  include AllCombos
  attr_reader :random_selection

  def initialize
    @random_selection = all_combinations.sample
    @turns = 11
    @guess = ''
    system('clear')
    play_game
  end

  def play_game
    
    print 'Enter a guess: '
    @guess = gets.chomp.to_i.digits
    while @guess == @random_selection || @turns > 0
      @turns -= 1
      test_guess(@guess)
    end
    you_win(false)
  end

  def test_guess(guess)
    if @guess.reverse == @random_selection
      you_win(true)
    else
      print "Hints "
      puts clues(@guess, @random_selection)
      print "Incorrect guess again. #{@turns + 1} guesses left! "
      @guess = gets.chomp.to_i.digits
    end
  end

  private

  def clues(guess,random)
    hints = ''.dup
    arr = random.clone
    temparr = []
    guessarr = guess.clone.reverse
    guessarr.each_with_index do |item, indx|
      if arr[indx] == item
        hints << "● "
        arr[indx] = "."
      else
        temparr.push(item)
      end
          end
    arr.each do |item|
      if temparr.index(item) != nil
        hints << "○ "
        temparr.delete_at(temparr.index(item))
      end
          end
          hints
    
  end
    def you_win(bool)
      if true
      loop do
        print 'You defused the BOMB! Try again? (y/n): '
        answer = gets.chomp
        if answer == 'y' 
          session
        elsif answer == 'n'
          puts "Would you like plant a bomb and test out the robot? (y/n)"
          robo = gets.chomp
          if robo == 'y'
            start_ai_game
          else
            system('clear')
            puts "Happy trails partner!"
            exit(0)
          end
        end
      end
    else
      print "THE WORLD GOT OBLITERATED TRY AGAIN? (y/n)"
      answer = gets.chomp
        if answer == 'y' 
          session
        elsif answer == 'n'
          puts "Would you like plant a bomb and test out the robot? (y/n)"
          robo = gets.chomp
          if robo == 'y'
            start_ai_game
          else
            system('clear')
            puts "Happy trails partner!"
            exit(0)
          end
        end
    end
  end
end

def session
  game = RobotCreate.new
  game
end