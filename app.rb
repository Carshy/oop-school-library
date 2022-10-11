require './book'
require './person'
require './student'
require './teacher'
require './rental'
require './classroom'

class App
  attr_accessor :books, :people

  def initialize
    @books = []
    @people = []
    @students = []
    @teachers = []
    @rentals = []
  end

  def run
    user_input
  end

  def display_books
    puts '----  List of All Books -----'
    if @books.empty?
      puts 'Book store is Empty !'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1} - #{book.title} by #{book.author}"
      end
    end
    puts '-----------------------------'
  end

  def list_of_people
    puts '----  List of All People -----'
    if @people.empty?
      puts 'No People Registered !'
    else
      @people.each_with_index do |person, index|
        if person.instance_of?(Student)
          puts "#{index + 1} -  [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        else
          puts "#{index + 1} - [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
    puts '-----------------------------'
  end

  def create_student(age, classroom, name, parent_permission)
    student = Student.new(age, classroom, name, parent_permission: parent_permission)
    @people << student unless @people.include?(student)
    @students << student unless @students.include?(student)
  end

  def create_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher unless @people.include?(teacher)
    @teachers << teacher unless @teachers.include?(teacher)
  end

  def create_new_book(title, author)
    book = Book.new(title, author)
    @books << book unless @books.include?(book)
    puts '------------ New Book Added -----------'
    puts "#{title} by #{author} added to book list successfuly!\n
    -----------------------------------"
  end

  def create_rental(date, person_number, book_number)
    rent = Rental.new(date, people[person_number.to_i - 1], books[book_number.to_i - 1])
    @rentals << rent unless @rentals.include?(rent)
    puts '-------- Rental Created -------'
    puts '-----------------------------'
  end

  def rent_list_by_id
    puts '------------ Rental list by ID -----------'
    print '\n Enter the person\'s ID : '
    id = gets.chomp
    puts '**** Rental list ****'
    if @rentals.empty?
      puts 'No rental recorded !'
    else
      @rentals.select do |rent|
        if rent.person.id == id.to_i
          puts "Date: #{rent.date}, Book '#{rent.book.title}' by #{rent.book.author}"
        else
          puts "#{rent.person.name} does not reantal a book!"
        end
      end
    end
    puts '-----------------------------'
  end
end
