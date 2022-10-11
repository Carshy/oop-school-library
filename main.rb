require './refactor'

class Main
    def start
      puts 'Welcome to our School Library App'
      app = Refactor.new
      app.user_input
    end 
  end
  
  main = Main.new
  main.start
  