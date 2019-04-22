require 'test_helper'

class JobTest < ActiveSupport::TestCase
  should have_many(:shift_jobs)
  should have_many(:shifts).through(:shift_jobs)
  
  should validate_presence_of(:name)
  
    context "Creating a context for jobs" do
    setup do 
      create_jobs
    end
    
    teardown do
      remove_jobs
    end
        # test the scope 'alphabetical'
    should "shows that there are 4 jobs in in alphabetical order" do
      assert_equal ["Cashier", "Ice cream making", "Mopping", "Mover"], Job.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'active'
    should "shows that there are 3 active job" do
      assert_equal 3, Job.active.size
      assert_equal ["Cashier", "Ice cream making", "Mopping"], Job.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there is one inactive job" do
      assert_equal 1, Job.inactive.size
      assert_equal ["Mover"], Job.inactive.alphabetical.map{|s| s.name}
    end
    
  end

end
