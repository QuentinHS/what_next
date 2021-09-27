require 'json'
require 'colorize'
require_relative './errors/invalid_input_error'


# Valide that answer is "a"/"b"/"-"
def validate_answer(answer)
  answer =~ /[abAB-]{1}/
end

# Get valid answer for test questions, otherwise raise error (colorized in red)
def get_answer
  answer = gets.chomp.downcase.strip
  raise InvalidInputError, "Please enter 'a' or 'b' to answer, '-h' for help, or '-q' to quit".red unless validate_answer(answer)
  answer
end

def quiz
  answers = []
  data = JSON.load_file('quiz.json', symbolize_names: true)  
  data.each do |item|
    begin
      pieces = item[:question].to_s.split("\n")
      puts "#{item[:id].to_s.cyan}: #{pieces[0].blue}"
      puts "A) #{pieces[1]}".green
      puts "B) #{pieces[2]}".yellow
      answer = get_answer
      case answer
      when "-q" || "--quit"
        break
      when "-h" || "--help"
        puts "This is a help function."
      end
      answers << answer
    rescue => e 
      puts e.message
      retry
    end 
  end 
  answers
end

data = quiz

def create_personality_profile(quiz_answers)
  # Create hash map to represt personality aspects
  profile_answers = {
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
  quiz_answers.each_with_index do |answer, i|
    if i % 7 == 0 && answer == "a"
      profile_answers[:extraverted] += 1
    elsif i % 7 == 0 && answer == "b"
      profile_answers[:introverted] += 1
    elsif ((i+6) % 7 == 0 || (i+5) % 7 == 0) && answer == "a"
      profile_answers[:sensing] += 1
    elsif ((i+6) % 7 == 0 || (i+5) % 7 == 0) && answer == "b"
      profile_answers[:intuition] += 1
    elsif ((i+4) % 7 == 0 || (i+3) % 7 == 0) && answer == "a"
      profile_answers[:thinking] += 1
    elsif ((i+4) % 7 == 0 || (i+3) % 7 == 0) && answer == "b"
      profile_answers[:feeling] += 1
    elsif ((i+2) % 7 == 0 || (i+1) % 7 == 0) && answer == "a"
      profile_answers[:judging] += 1
    elsif ((i+2) % 7 == 0 || (i+1) % 7 == 0) && answer == "b"
      profile_answers[:perceiving] += 1
    end
  end

  profile_answers
end

profile = create_personality_profile(data)

p profile


