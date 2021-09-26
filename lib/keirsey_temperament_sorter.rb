require 'json'
require 'colorize'

# Create custom error class to handle incorrect user input - user must input "a", "b" or "-"
class InvalidInputError < StandardError
end

# Valide that answer is "a"/"b"/"-"
def validate_answer(answer)
  answer =~ /[abAB-]{1}/
end

# Get valid answer for test questions, otherwise raise error (colorized in red)
def get_answer
  answer = gets.chomp.downcase.strip
  raise InvalidInputError, "Please enter 'a', 'b' or '-'".red unless validate_answer(answer)
  answer
end

def test
  answers = []
  data = JSON.load_file('test.json', symbolize_names: true)  
  data.each do |item|
    begin
      pieces = item[:question].to_s.split("\n")
      puts pieces[0].blue
      puts "A) #{pieces[1]}".green
      puts "B) #{pieces[2]}".yellow
      answer = get_answer
      answers << answer
    rescue => e 
      puts e.message
      retry
    end 
  end 
  answers
end

stuff = test
p stuff
