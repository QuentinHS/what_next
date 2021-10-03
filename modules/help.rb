module Help
  # display help message for main menu
  def self.main_help
    puts "Welcome again to What Next! It's easy to navigate around the main menu, you can just use the arrow keys to move around and press the 'enter' key to select that option. Some sections, such as the quiz and the comparison tool will require manual keyboard input. If you want to return to the main menu at those points, you can always type '-q' or '--quit'.".green
  end

  # display help message for quiz
  def self.quiz_help
    puts "This is a personality test loosely based on Myer-Briggs and Keirsey-style personality quizzes. Questions should only be answered by typing 'a' or 'b' into the terminal. It should only take around 10-15 minutes to complete. If that feels like too long, you can always type '-q' or '--quit' to exit at any point.".green
  end

  # display help menu for comparison
  def self.compare_help
    puts "Here you can compare two different occupations on a range of metrics such as salary, size, and growth. Please type the first occupation that you wish to compare, press the enter key, then repeat the process for the second occupation. You can also return to the main menu by typing '-q' or '--quit' instead of an occupation at either input screen.".green
  end

    # display help menu for comparison
  def self.metrics_help
    puts "Here you can compare occupations by a range of metrics. You can can see occupations' typical minimum, average and 90th percentile salaries, how many members are employed in that occupation in Australia, whether the job is currently growing and its rate of growth, and whether a job is particularly vulnerable to automation. To navigate, simply use the arrow keys and press 'enter' to make a selection. You can also choose to return to the main menu.".cyan
  end


  # display help message for search
  def self.search_help
    puts "If you've already done a Myer-Briggs or Keirsey-style test elsewhere and know your personality type ('ENTJ' for example), you can select your result here if you'd like to see a list of compatible jobs for your personality type without taking another quiz. All you have to do is select your personality type with the arrow keys and press the 'enter' key. You can also return to the main menu if you prefer.".green
  end 

end