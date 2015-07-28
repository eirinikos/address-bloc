

# Using require_relative, tell Ruby to load
# the library named entry.rb relative to address_book.rb's filepath
require_relative "entry"
require "csv"

# require
# require_relative "../name"
# extend
# include
# load

class AddressBook
  attr_accessor :entries
  
  def initialize
    @entries = []
  end

  def add_entry(name,phone,email)

    # Create index to store the insertion index.
    index = 0
    @entries.each do |entry|

      # Compare name with the name of the current entry.
      # If name lexicographically proceeds entry.name, we've 
      # found the index to insert at. Otherwise, we increment
      # index and continue comparing with other entries.
      if name < entry.name
        break
      end
      index += 1
    end

    # Insert a new entry into entries using the calculated index.
    @entries.insert(index, Entry.new(name,phone,email))
  end

  def import_from_csv(file_name)
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    # the result of CSV.parse is an object of type CSV::Table
    
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

  def binary_search(name)
    lower = 0
    upper = entries.length - 1

    while lower <= upper
    # while there is a range of indices to search

      mid = (lower + upper) / 2
      mid_name = entries[mid].name

      if name == mid_name # case-sensitive!!!
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end

    return nil # if no match is found!
  end
end