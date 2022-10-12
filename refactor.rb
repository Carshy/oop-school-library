require './app'

class Refactor
  def initialize
    @app = App.new
  end

  def permission?(parent_permission)
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
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
    
    @app.create_rental()
  end

  def display_people
    @app.list_of_people
  end

  def display_books_list
    @app.display_books
  end

  def rent_list
    @app.rent_list_by_id
  end
end
