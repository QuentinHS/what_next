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

prac_array = ['number1', 'number2', 'number3', 'number4', 'number5', 'number6', 'number7', 'number8', 'number9', 'number10', 'number11', 'number12', 'number13', 'number14', 'number15', 'number16', 'number17', 'a', 'a', 'a', 'a', 'a', 'a', 'a',
 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a',
 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'number70']

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

nums = prac_array.select.with_index{|_,i| (i) % 7 == 0}
nums2 = prac_array.select.with_index{|_,i| (i+6) % 7 == 0 || (i+5) % 7 == 0}
nums3 = prac_array.select.with_index{|_,i| (i+4) % 7 == 0 || (i+3) % 7 == 0}
nums4 = prac_array.select.with_index{|_,i| (i+2) % 7 == 0 || (i+1) % 7 == 0}

p nums4

# nums.each_with_index do |_,i|
