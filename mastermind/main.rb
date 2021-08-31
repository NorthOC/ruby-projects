require_relative 'mm_player'
require_relative 'mm_robot'
require_relative 'modules'

def intro
  system('clear')
  puts "                      " + "Welcome to MASTERMIND! NUMBER EDITION\n\n".red.underline.bold
  puts "         > " + "The rules are simple:".green
  puts "   > " + "There are " + "4 digits".underline + " - each from 1 to 6.\n\n"
  puts "   > " + "Guess the number correct in " + "12 tries".blue + " and all will be fine...."
  puts "   > " + "But if you fail..."+" BOOM!!!!".red.italic + " AHAHAHAH!!"
  puts "   > " + "Explosives are dangerous, even for " + "EVIL GENIUSES".red.italic + " like me."
  puts "   > " + "That is why the " + "BOMB".red.bold.italic + " comes with preinstalled " + "HINTS!".bold
  puts "   > " + "For example, try to read this: ● ● ○"
  puts "   > " + "The ● shows that one digit is correct and placed in the " + "right place!".blue
  puts "   > " + "The ○ shows that one digit is correct and placed in the " + "wrong place!".red
  puts "   > " + "So find out where those numbers go and " + "SAVE THE WORLD!".green + "  ... or not"
  puts "   > " + "You still don't get it?"
  puts "   > " + "Me neither...  \n\n"
  puts "Type in '1' to defuse the bomb or type in '2' to watch a robot do it"
  answer = gets.chomp
  until answer == '1' || answer == '2'
    puts "Incorect, try '1' or '2' again cowboy"
    answer = gets.chomp
  end
  if answer == '1'
    session
  else
    start_ai_game
  end
end
intro