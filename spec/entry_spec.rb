

# #1 The standard first line of an RSpec test file.

# #2 Use context to give our test structure & communicate
# that all specs inside it belong to the same context.
# In this case, we use context to communicate that the
# specs in the context will test Entry attributes

# #3 We separate our individual tests using the it method
# Each it represents a unique test.

# #4 Each Rspec test ends with one or more expect method,
# which we use to declare the expectations for the test.

# #5 We use a new context to separate the to_s test from
# the initializer tests.

# #6 We use eq to check that to_s returns a string equal to
# expected_string.

require_relative '../models/entry.rb'

# #1
RSpec.describe Entry do

# #2
  context "attributes" do  

# #3 
    it "should respond to name" do
      entry = Entry.new("Ada Lovelace", "010.012.1815","augusta.king@lovelace.com")

# #4 
      expect(entry).to respond_to(:name)
    end

    it "should respond to  phone number" do
      entry = Entry.new("Ada Lovelace", "010.012.1815","augusta.king@lovelace.com")
      expect(entry).to respond_to(:phone_number)
    end

    it "should respond to email" do
      entry = Entry.new("Ada Lovelace","010.012.1815","augusta.king@lovelace.com")
      expect(entry).to respond_to(:email)
    end
  end

# #5
  context "#to_s" do
    it "prints an entry as a string" do
      entry = Entry.new("Ada Lovelace","010.012.1815","augusta.king@lovelace.com")
      expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"

# #6
      expect(entry.to_s).to eq(expected_string)
    end
  end
end