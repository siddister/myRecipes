require 'test_helper'

class ChefTest < ActiveSupport::TestCase
   def setup
        @chef = Chef.new(name: "Jack Sparrow", email: "jack@sparrow.com")
   end
   
   test "chef should be valid" do
      assert @chef.valid? 
   end
   
   test "chef name should be present" do
       @chef.name = " "
       assert_not @chef.valid?
   end
   
   test "chef name should not be too long" do
      @chef.name = "a"*41
      assert_not @chef.valid?
   end
   
   test "chef name should not be too short" do
       @chef.name = "AA"
       assert_not @chef.valid?
   end
   
   test "email must be present" do
     @chef.email = " " 
     assert_not @chef.valid?
   end
   
   test "email length should be within bounds" do
      @chef.email = "a" * 101 + "@example.com"
      assert_not @chef.valid?
   end
   
   test "email address should be unique" do
    dup_chef = @chef.dup 
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
   end
   
   test "email should accept valid address" do
     valid_addresses = %w[user@example.com R_DDTS@eee.com first.last@example.com]
     valid_addresses.each do |va|
       @chef.email = va
       assert @chef.valid?, "#{va.inspect} should be a valid email"
     end
     
   end
   
   test "email should reject invalid addresses" do
     invalid_addresses = %w[user@example,com this-that@eee user@example first.last@eeedotcom this_at_myspace.com]
     invalid_addresses.each do |ia|
       @chef.email = ia
       assert_not @chef.valid?, "#{ia.inspect} shoud be an invalid address"
     end
   end
   
   
   
   
   
   
   
end