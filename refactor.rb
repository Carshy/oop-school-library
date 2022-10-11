require './app'

class Refactor
  def initialize
    @app = App.new
  end

  def permission?(parent_permission)
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp()
    case permission
    when 'n', 'N'
      !parent_permission
    when 'y', 'Y'
      parent_permission
    else
      permission?(parent_permission)
    end
  end

  def student_option
    print ' Enter student Name : '
    name = gets.chomp
    print ' Enter student Age : '
    age = gets.chomp
    print ' Enter student Classroom <number> : '
    classroom = gets.chomp
    parent_permission = true
    permission?(parent_permission)
    @app.create_student(age.to_i, classroom.to_i, name, parent_permission)
    puts "---------  New student Added!  ----------- \n
    #{name} is #{age} years old in classroom #{classroom.to_i}"
    puts ' ************************** '
  end

  def teacher_option
    print ' Enter teacher Name : '
    name = gets.chomp
    print ' Enter teacher Age : '
    age = gets.chomp
    print ' Enter teacher specialization : '
    specialization = gets.chomp
    @app.create_teacher(specialization, age.to_i, name)
    puts '---------  New Teacher Added!  -----------'
    puts "#{name} is #{age} years old, who is specialized in teaching #{specialization}"
    puts '-------------------------------- '
  end

  def create_person
    print 'Which person do you want to create ? (1) for Teacher, (2) for Student : '
    input = gets.chomp
    case input.to_i
    when 1
      teacher_option
    when 2
      student_option
    else
      puts 'you entered invalid input! Please try again:'
      create_person
    end
  end

  def creating_new_book
    puts '------------ Creating New Book -----------'
    print ' Enter Book Title : '
    title = gets.chomp
    print ' Enter Book Author : '
    author = gets.chomp
    @app.create_new_book(title, author)
  end

  def creating_new_rental
    puts '------------ Making a New Rental -----------'
    puts ' Select a Book from the list below by the number'
    @app.display_books
    print ' Enter book number : '
    book_number = gets.chomp
    puts 'Select a Person from the list below by the number'
    @app.list_of_people
    person_number = gets.chomp
    print ' Enter the Date e.g (2022/9/29) : '
    date = gets.chomp
    @app.create_rental(date, person_number, book_number)
  end

  def display_rental
    puts '------------ Show Rental list by ID -----------'
    print '\n Enter the person\'s ID : '
    id = gets.chomp
    @app.rent_list_by_id(id)
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
      display_books
    when 2
      list_of_people
    when 3
      create_person
    when 4
      creating_new_book
    when 5
      creating_new_rental
    when 6
      rent_list_by_id
    end
  end
end