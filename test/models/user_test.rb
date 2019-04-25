require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should belong_to(:employee)

  should have_secure_password

  should allow_value("muneera@muneera.com").for(:email)
  should allow_value("muneera@andrew.cmu.edu").for(:email)
  should allow_value("mu_neera@muneera.org").for(:email)
  should allow_value("muneera123@muneera.gov").for(:email)
  should allow_value("my.muneera@muneera.net").for(:email)
  
  should_not allow_value("muneera").for(:email)
  should_not allow_value("muneera@muneera,com").for(:email)
  should_not allow_value("muneera@muneera.uk").for(:email)
  should_not allow_value("my muneera@muneera.com").for(:email)
  should_not allow_value("muneera@muneera.con").for(:email)

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
      assert @ed.active
      assert_not_nil @ed_user
      @someone = FactoryBot.build(:employee)
      assert @someone.valid?

    end



  end
end