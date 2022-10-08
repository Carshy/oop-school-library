require './app'

def menu(choice)
  case choice
  when 1
    display_books
  when 2
    list_of_people
  when 3
    create_person
  when 4
    create_new_book
  when 5
    create_rental
  when 6
    rent_list_by_id
  end
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
    puts '********** Thank you for visiting our library  ********'
  else
    user_input
  end
end

def main
  puts "Welcome to the School Library App!\n"
  app = App.new
  app.run
end

main
