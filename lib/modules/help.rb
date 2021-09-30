module Help

  def self.main_help
    puts "this is the main help"
  end

  def self.quiz_help
    puts "This is a personality test loosely based on Myer-Briggs and Keirsey-style personality quiz. Questions should only be answered by typing 'a' or 'b' into the terminal. It should take 10-15 minutes to complete. If that feels like too long, you can always type -q or --quit to exit.".green
  end

  def self.compare_help
    puts "Here you can compare two different occupation on a range of metric such as salary, size, growth etc. Please enter the first occupation that you want to compare, press the enter key, then repeat for the second occupation. You will then be prompted to select the measure by which to compare occupation.".green
  end

  def self.search_help
    puts "this is the search help"
  end 

end