require 'test_helper'

class FlavorTest < ActiveSupport::TestCase
  should have_many(:store_flavors)
  should have_many(:stores).through(:store_flavors)

  should validate_presence_of(:name)

  context "Creating a context for Flavors" do
    setup do 
      create_flavors
    end
    
    teardown do
      remove_flavors
    end

    
    should "alphabetize flavors" do
      assert_equal ["Jamoka", "Mocha", "Strawberry", "Vanilla"], Flavor.alphabetical.map{|s| s.name}
    end
    
    should "return active flavors" do
      assert_equal 3, Flavor.active.size
      #assert_equal ["Mocha", "Strawberry", "Vanilla"], Flavor.active.alphabetical.map{|s| s.name}

    end
    
    should "return inactive flavors" do
      assert_equal 1, Flavor.inactive.size
      #assert_equal ["Jamoka"], Flavor.inactive.alphabetical.map{|s| s.name}
    end
    
    should "make sure that flavors can't be destroyed" do
      @vanilla.destroy
      assert_equal 2, Flavor.active.size
      assert_equal ["Mocha", "Strawberry"], Flavor.active.map{|s| s.name}.sort
      assert_equal ["Jamoka", "Vanilla"], Flavor.inactive.map{|s| s.name}.sort
    end
  end
end