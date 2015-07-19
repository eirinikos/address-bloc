

# Using require_relative, tell Ruby to load
# the library named entry.rb relative to address_book.rb's filepath
require_relative "entry"

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

  def remove_entry(entry)
    @entries.delete(entry)
  end
end