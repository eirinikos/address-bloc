

class Entry
  attr_accessor :name, :phone_number, :email

  #matt =  ["matt", "8e9080923", "a@a.com"]
  #matt[0]
  #matt[1]
  

  def initialize (name, phone_number, email)
    @name = name
    @phone_number = phone_number
    @email = email
  end

  def to_s
    "Name: #{@name}\nPhone Number: #{@phone_number}\nEmail: #{@email}"
    # Create the desired string.
  end
end