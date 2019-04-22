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

    
    # test the scope 'alphabetical'
    should "shows that there are four flavors in in alphabetical order" do
      assert_equal ["Chocolate", "Mint Chocolate Chip", "Strawberry", "Vanilla"], Flavor.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'active'
    should "shows that there are 3 active flavors" do
      assert_equal 3, Store.active.size
      assert_equal ["Chocolate", "Strawberry", "mint_chip"], Flavor.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there is one inactive flavors" do
      assert_equal 1, Flavor.inactive.size
      assert_equal ["Vanilla"], Flavor.inactive.alphabetical.map{|s| s.name}
    end
  end
end