require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should belong_to(:employee)

  should have_secure_password

  # Validating email...
  should allow_value("fred@fred.com").for(:email)
  should allow_value("fred@andrew.cmu.edu").for(:email)
  should allow_value("my_fred@fred.org").for(:email)
  should allow_value("fred123@fred.gov").for(:email)
  should allow_value("my.fred@fred.net").for(:email)
  
  should_not allow_value("fred").for(:email)
  should_not allow_value("fred@fred,com").for(:email)
  should_not allow_value("fred@fred.uk").for(:email)
  should_not allow_value("my fred@fred.com").for(:email)
  should_not allow_value("fred@fred.con").for(:email)

  should validate_uniqueness_of(:email).case_insensitive

  context "Creating a context for users" do
    setup do 
      create_employees
      create_users
    end
    
    teardown do
      remove_employees
      remove_users
    end

    should "shows that users are connected to an employee who is active in the system" do
      assert @alex.active
      assert_not_nil @alex_user
      @someone = FactoryBot.build(:employee)
      assert @someone.valid?

    end



  end
end