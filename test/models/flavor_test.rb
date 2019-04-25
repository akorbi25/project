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
    end
    
    should "return inactive flavors" do
      assert_equal 1, Flavor.inactive.size
    end
  end
end