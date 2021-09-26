ARGV = []

# Present welcome message to the user 

def intro
  puts "Welcome to What Next?, a terminal-based application to help you decide on your future path! At any time you can type '-h' or '--help' at the command line for instructions on what you can do. You can also type '--restart' if you want to come back here to the main menu."
  puts "If you're feeling lost and up for a short quiz, type '--quiz'. We'll ask you a few questions to help you decide what to do next with your life."
  puts "If you already have some ideas and want some more specific information, type '--search'."
end

intro
answer = gets.chomp

if answer == '--quiz'
  quiz
end
