require 'json'
require 'colorize'
require_relative '../errors/invalid_input_error'

class PersonalityProfile

  # Make attributes accessible to other class methods
  attr_accessor :quiz_answers, :profile_map

  def initialize
    # Create instance variable to store quiz answers
    @quiz_answers = []
    # Create instance variable to store personality profile that will be used to generate personality type 
    @profile_map = {
    extraverted: 0,
    introverted: 0,
    sensing: 0,
    intuition: 0,
    thinking: 0,
    feeling: 0,
    judging: 0,
    perceiving: 0
    }
  end


  # Validate that answer is "a", "b" , "--quit" or "-q"  (will convert uppercase a|b to lowercase)
  def validate_answer(answer)
    (answer.match(/a|b/) && answer.length == 1) || answer.match(/--quit|-q/)
  end


  # Get valid answer for test questions, otherwise raise custom error (colorized in red)
  def get_answer
    answer = gets.chomp.downcase.strip
    raise InvalidInputError, "Please enter 'a' or 'b' to answer, or '-q' or '--quit' to exit".red unless self.validate_answer(answer)
    answer
  end


  # Commence personality quiz which will generate array of answers stored in object
  def quiz(file='./quiz.json')
  # reset instance variable to avoid duplicating answers
  @quiz_answers = []
  quiz_answers = []

  # Attempt to load quiz data, throw error if this fails
  begin
  data = JSON.load_file(file, symbolize_names: true)
  rescue LoadError => e
    puts e.message
    return
  end

  # Format quiz data and display to user
  data.each do |item|
    begin
      pieces = item[:question].to_s.split("\n")
      puts "#{item[:id].to_s.cyan}: #{pieces[0].blue}"
      puts "A) #{pieces[1]}".green
      puts "B) #{pieces[2]}".yellow
      answer = get_answer
      # Return to main menu if answer is "-q" or "--quit"
      if answer == "-q" || answer == "--quit" 
        return @quiz_answers = []  
      end
      # add answer to quiz_answers array
      quiz_answers << answer
    rescue => e 
      # retry if answer is invalid
      puts e.message
      retry
    end 
  end
  # add quiz array to instance variable array
  @quiz_answers.concat(quiz_answers)
  end 


  # Use quiz answers to generate personality map which is stored in object state
  def generate_personality_map
    return nil if @quiz_answers.empty?

  # Reset personality profile map in case user wants to take test multiple times
  @profile_map = {
    extraverted: 0,
    introverted: 0,
    sensing: 0,
    intuition: 0,
    thinking: 0,
    feeling: 0,
    judging: 0,
    perceiving: 0
    }
    
  # Create personality profile based on answer key
  @quiz_answers.each_with_index do |answer, i|
    if answer == "a"
      if i % 7 == 0
        @profile_map[:extraverted] += 1
      elsif ((i+6) % 7 == 0 || (i+5) % 7 == 0)
        @profile_map[:sensing] += 1
      elsif ((i+4) % 7 == 0 || (i+3) % 7 == 0)
        @profile_map[:thinking] += 1
      else 
        @profile_map[:judging] += 1
      end
    else 
      if i % 7 == 0 
        @profile_map[:introverted] += 1
      elsif ((i+6) % 7 == 0 || (i+5) % 7 == 0)
        @profile_map[:intuition] += 1
      elsif ((i+4) % 7 == 0 || (i+3) % 7 == 0)
        @profile_map[:feeling] += 1
      else 
        @profile_map[:perceiving] += 1
      end
    end
  end
  end

end

