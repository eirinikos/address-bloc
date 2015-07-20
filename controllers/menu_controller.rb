

require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View Entry Number n"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i
   
    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      system "clear"
      view_entry_num
      main_menu
    when 6
      puts "GOODBYE!"

      exit(0)
      #terminate the program

    else
      system "clear"
      puts "Sorry, that is not a valid input."
      main_menu
    end
  end

  def view_all_entries
    @address_book.entries.each do |entry|
    system "clear"
    puts entry.to_s
    entry_submenu(entry)
    end
    system "clear"
    puts "End of entries."
  end
    
  def create_entry
    system "clear"
    puts "New AddressBloc Entry."

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name,phone,email)

    system "clear"
    puts "New entry created."
  end

  def search_entries
  end

  def read_csv
  end

  def view_entry_num
    system "clear"
    print "View entry number: "
    entry_num = gets.to_i

    if entry_num >= 0 && entry_num < @address_book.entries.size
      system "clear"
      puts @address_book.entries[entry_num].to_s
    else
      puts "Sorry, that is not a valid input."
      # this still allows char inputs?
    end   
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to the main menu"

    selection = gets.chomp

    case selection
    when "n"
      # for now, entering n, d, or e just returns control to view_all_entries
    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      puts "#{selection} IS NOT A VALID INPUT!"
      entry_submenu(entry)
    end
  end
end
