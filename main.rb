require './refactor'
require './app'

class Main
  def initialize
    @app = App.new
    @refactor = Refactor.new
  end

  def user_input
    puts "
    Welcome to our Library! You may perform the following tasks from the Menu:\n
          1 - List all books
          2 - List all people
          3 - Create a person
          4 - Create a book
          5 - Create a rental
          6 - List all rentals for a given person (id)
          7 - Exit
          Choose(Any option from 1-7): "
    input_value = gets.chomp.to_i
    menu(input_value)
    if input_value == 7
      puts '******* Thank you for visiting our library ******'
    else
      user_input
    end
  end

  def menu(choice)
    case choice
    when 1
      @refactor.display_books_list
    when 2
      @refactor.display_people
    when 3
      @refactor.create_person
    when 4
      @refactor.creating_new_book
    when 5
      @refactor.creating_new_rental
    when 6
      @refactor.display_rental
    end
  end
end

main = Main.new
main.user_input
