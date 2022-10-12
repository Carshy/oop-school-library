require './book'
require './person'
require './student'
require './teacher'
require './rental'
require './classroom'

class App
  attr_accessor :title, :author, :books, :people

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
      puts 'No People Registered!'
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

  def create_rental()
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, idx| puts "#{idx}) Title: \"#{book.title}\" Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, idx|
      puts "#{idx}) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date (yyyy/mm/dd): '
    date = gets.chomp
    person = @people[person_index]
    book = @books[book_index]
    Rental.new(date, person, book)
    puts '-------- Rental Created -------'
    puts '-----------------------------'
  end

  def rent_list_by_id
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = @people.find { |prsn| prsn.id == person_id }
    rental = person.rentals
    puts 'Rentals:'
    rental.each do |item|
      puts "Date: #{item.date}, Book: #{item.book.title}, by #{item.book.author}"
    end
  end

end
