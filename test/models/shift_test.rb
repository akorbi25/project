require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  should have_one(:employee).through(:assignment)
  should have_one(:store).through(:assignment)
  should belong_to(:assignment)
  should have_many(:shift_jobs)    

    should have_many(:jobs).through(:shift_jobs)


  
  should validate_presence_of(:date)
  should validate_presence_of(:start_time)
  should validate_presence_of(:assignment)
  
  should allow_value(Time.now).for(:start_time)
  should allow_value(1.hour.from_now).for(:start_time)
  should allow_value(2.hours.ago).for(:start_time)
  should_not allow_value("fred").for(:start_time)
  should_not allow_value(3.14159).for(:start_time)
  should_not allow_value(nil).for(:start_time)
  context "Creating a context for shifts" do
      # create the objects I want with factories
    setup do 
      create_employees
      create_stores
      create_assignments
      create_shifts
      create_jobs
      create_shift_jobs
      
    end
    
    # and provide a teardown method as well
    teardown do
      remove_employees
      remove_assignments
      remove_stores
      remove_shifts
      remove_jobs
      remove_shift_jobs
    end 
    
 'should "test the scope completed" do
      create_jobs
      create_shift_jobs
      assert_equal 3, Shift.completed.to_a.size
      remove_jobs
      remove_shift_jobs
      
    end'
    
 
    
    should "test the scope for store" do
      assert_equal 6, Shift.for_store(@cmu.id).size
      assert_equal 2, Shift.for_store(@oakland.id).size
    end
 
 
 
  end
end
