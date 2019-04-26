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
      assert_equal ["Casher", "Cleaner", "Cooker", "Seller", "Waiter"], Job.alphabetical.map{|s| s.name}
    end
    
    should "reutrn active jobs" do
      assert_equal 4, Job.active.size
    end
    
    should "return inactive jobs" do
      assert_equal 1, Job.inactive.size
    end
    
    should "test be inactive" do
      @seller.destroy
      assert_equal 3, Job.active.size
      assert_equal ["Casher", "Cleaner", "Cooker"], Job.active.map{|s| s.name}.sort
      assert_equal ["Waiter"], Job.inactive.map{|s| s.name}.sort
      @casher.destroy
      assert_equal 2, Job.active.size
      assert_equal 1, Job.inactive.size
    end
    
  end

end
