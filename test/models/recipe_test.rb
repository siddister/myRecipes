require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
   def setup
        @chef = Chef.create(name: "Mike", email: "mike@example.com")
        @recipe = @chef.recipes.build(name: "Spaghetti", summary: "Best Spaghetti ever", description: "boil water, make noodles, heat sauce, brown meat, and enjoy your face off") 
   end
   
   test "recipe should be valid" do
    assert @recipe.valid?
   end
   
   test "chef_id must be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
   end
   
   test "name should be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
   end
   
   test "name length should not be too long(100ch)" do
       @recipe.name = "a" * 101
       assert_not @recipe.valid?
   end
   
   test "name length should not be too short(5ch)" do
       @recipe.name = "aaaa"
       assert_not @recipe.valid?
   end
   
   test "summary should be present" do
       @recipe.summary = " "
       assert_not @recipe.valid?
   end
   
   test "summary length should not be too long(150ch)" do
       @recipe.summary = "a" * 151
       assert_not @recipe.valid?
   end
   
   test "summary length should not be too short(10ch)" do
        @recipe.summary = "a" * 9
        assert_not @recipe.valid?
   end
   
   test "description should be present" do
       @recipe.description= " "
       assert_not @recipe.valid?
   end
   
   test "description length should not be too long(500ch)" do
       @recipe.description = "a" * 501
       assert_not @recipe.valid?
   end
   
   test "description length should not be too short(20ch)" do
       @recipe.description = "a" * 19
       assert_not @recipe.valid?
       @recipe.description = "a" * 20
       assert @recipe.valid?
   end
   
end