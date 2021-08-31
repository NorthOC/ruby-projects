require_relative 'modules'
require_relative 'mm_player'

include AllCombos

class RobotRun
    include AllCombos
  
    def initialize(hidden_answer)
      @hidden_answer = hidden_answer.digits.reverse
      @initial_guess = [1, 1, 1, 1]
      @hints = ""
      @bot_brain = ""
      @full_moons = ""
      @half_moons = ""
      @combos = all_combinations
      @sort_mode = false
      @i = 0
      system('clear')
      cluesv2(@guess)
    end

    def moon_reduce(index)
      @combos.select do |perm|
            perm[index] != @initial_guess[index]
      end
    end
    def positive_reduce(index)
      @combos.select do |perm|
        perm[index] != @initial_guess[index]
  end
end
    def moon_reduce4x()
      @combos = moon_reduce(0)
      @combos = moon_reduce(1)
      @combos = moon_reduce(2)
      @combos = moon_reduce(3)
    end

    def check_for_moons(guess)
      temparr = []
      @hints = ""
      @full_moons = ""
      @half_moons = ""
      @bot_brain = ""
      hidden_arr = @hidden_answer.clone
      if !@sort_mode
      @initial_guess.each_with_index do |item, index|
        if hidden_arr[index] == item
          @hints << "● "
          @full_moons << "●"
          hidden_arr[index] = "."
        else
          temparr.push(item)
        end
      end
      hidden_arr.each_with_index do |item, index|
        if temparr.index(item) != nil
          @hints << "○ "
          temparr.delete_at(temparr.index(item))
        end
        if @hints.gsub(/\s+/, "").length == 0
          @combos = moon_reduce4x()
        end
      end
    else
      hidden_arr = @hidden_answer.clone
      if @initial_guess != @hidden_answer
      @initial_guess.each_with_index do |item, index|
        if hidden_arr[index] == item
          @bot_brain << "● "
          @full_moons << "● "
          hidden_arr[index] = "."
        else
          @bot_brain << "○ "
          @half_moons << "○ "
        end
      end
      @hints << @full_moons
      @hints << @half_moons
    else
      puts "Success! #{@initial_guess.join} defused the BOMB!"
      exit_msg()
    end
  end
      @combos
    end
  
    def cluesv2(guess)
      puts "Guess #{@i + 1} -> #{@initial_guess.join}"
      sleep 1
      @combos = check_for_moons(@guess)
      num = @hints.gsub(/\s+/, "").length
      casing(num)
    end


    def casing(num)
      case num
        when 0
          moon_reduce4x()
          @initial_guess = @initial_guess.map {|item| item + 1}
        when 1
          @initial_guess[1] = @initial_guess[1] + 1
          @initial_guess[2] = @initial_guess[2] + 1
          @initial_guess[3] = @initial_guess[3] + 1
        when 2
          @initial_guess[2] = @initial_guess[2] + 1
          @initial_guess[3] = @initial_guess[3] + 1
        when 3
          @initial_guess[3] = @initial_guess[3] + 1
        when 4
          if !@sort_mode
          @combos = @initial_guess.permutation.to_a
          @combos.delete_at(0)
          @sort_mode = true

          else
            if @half_moons.gsub(/\s+/, "").length == 4
              @combos = moon_reduce4x()

            else
              @combos.delete_at(0)
              @bot_brain.gsub(/\s+/, "").split("").each_with_index do |dot, index|

                if dot != "●"
                  @combos = moon_reduce(index)
                end
            end
          end
        end
      end
        @i += 1
        print @hints
        print "\n\n"
        while @initial_guess != @hidden_answer
          if !@sort_mode
              @initial_guess
          else
              @initial_guess = @combos[0]
          end
        cluesv2(@initial_guess)
        end
        puts "Success! The BOMB was defused!"
        exit_msg()
    end
    def exit_msg
      answer = ''
      until answer == 'y' || answer == 'n'
      puts "Would you like to try again? (y/n)"
      answer = gets.chomp
      end
      if answer == 'y'
       start_ai_game()
      else
        puts "Would you like to save the world?(y/n)"
        newgame = gets.chomp
        if newgame == 'y'
          session
          exit(0)
        else
          system('clear')
          puts 'Happy trails partner!'
          exit(0)
        end
      end
    end
end

def start_ai_game
  num = ''
  elem = ''
  until num.is_a?(Integer) && all_combinations.index(elem) != nil
  puts "enter a 4 digit code (1111 - 6666)"
  num = gets.chomp.to_i
  elem = num.digits
  end
  RobotRun.new(num)
end