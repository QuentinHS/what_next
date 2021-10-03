module Help
  # display help message for main menu
  def self.main_help
    puts "Welcome again to What Next! It's easy to navigate around the main menu, you can just use the arrow keys to select an option and press the 'enter' key to select an option. Some sections, such as the quiz and the comparison tool will require manual input from the keyboard. If you want to return to the main menu at those points, you can always type '-q' or --'quit'.".green
  end

  # display help message for quiz
  def self.quiz_help
    puts "This is a personality test loosely based on Myer-Briggs and Keirsey-style personality quiz. Questions should only be answered by typing 'a' or 'b' into the terminal. It should take 10-15 minutes to complete. If that feels like too long, you can always type -q or --quit to exit.".green
  end

  # display help menu for comparison
  def self.compare_help
    puts "Here you can compare two different occupation on a range of metric such as salary, size, growth etc. Please type the first occupation that you want to compare, press the enter key, then repeat for the second occupation. You can also return to the main menu by typing '-q' or '--quit' at this point.".green
  end

  # display help message for search
  def self.search_help
    puts "If you've already done a Myer-Briggs or Keirsey-style test elsewhere and know your personality type, you can select your result here if you'd like to see all the most suitable jobs for that personality type in our database without taking an extra quiz. All you have to do is select your option with the arrow keys and press the 'enter' key.".green
  end 

end