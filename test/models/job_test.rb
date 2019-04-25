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
    should "alpahbetize jobs" do
      assert_equal ["Cleaner", "Cooker", "Seller", "Waiter"], Job.alphabetical.map{|s| s.name}
    end
    
    should "reutrn active jobs" do
      assert_equal 3, Job.active.size
    end
    
    should "return inactive jobs" do
      assert_equal 1, Job.inactive.size
    end
    
  end

end
