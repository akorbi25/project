require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  should have_one(:employee).through(:assignment)
  should have_one(:store).through(:assignment)
  should belong_to(:assignment)
  should have_many(:shift_jobs)    

  should have_many(:jobs).through(:shift_jobs)
  should validate_presence_of(:assignment)
  should validate_presence_of(:date)
  should validate_presence_of(:start_time)
  should_not allow_value(nil).for(:start_time)
  should allow_value(Time.now).for(:start_time)
  should allow_value(1.hour.from_now).for(:start_time)
  should allow_value(1.hour.ago).for(:start_time)
  should_not allow_value("bad").for(:start_time)
  should_not allow_value(3.8888).for(:start_time)
  
  context "Creating a context for shifts" do
    setup do 
      create_employees
      create_stores
      create_assignments
      create_shifts
      #create_jobs
      #create_shift_jobs
      
    end
    teardown do
      remove_employees
      remove_assignments
      remove_stores
      remove_shifts
      #remove_jobs
      #remove_shift_jobs
    end 
    
 should "test the scope completed" do
      create_jobs
      create_shift_jobs
      assert_equal 3, Shift.completed.to_a.size
      remove_jobs
      remove_shift_jobs
      
    end
    

    should "test the scope for store" do
      assert_equal 5, Shift.for_store(@cmu.id).size
    end

    should "return past shifts" do
      assert_equal 3, Shift.past.size
  end

    should "return upcoming shifts" do
      assert_equal 4, Shift.upcoming.size
    end
 
    should "show incomplete shifts" do
      create_jobs
      create_shift_jobs
      assert_equal 5, Shift.incomplete.to_a.size
      remove_jobs
      remove_shift_jobs    
end 

    should "test the scope for_employee" do
      assert_equal 4, Shift.for_employee(@ed.id).size
  end
 
     should "test the scope for_next_days" do
      assert_equal 4, Shift.for_next_days(3).size
  end
    should "test the scope for_past_days" do
      assert_equal 2, Shift.for_past_days(3).size

  end
  
    should "test the scope by store name" do
      assert_equal ["CMU", "CMU", "CMU", "CMU", "CMU", "Oakland", "Oakland"], Shift.by_store.map{|s| s.store.name}
end

    should "test the scope by employee name" do
      assert_equal ["Crawford, Cindy", "Gruberman, Ed", "Gruberman, Ed", "Gruberman, Ed", "Gruberman, Ed", "Janeway, Kathryn", "Janeway, Kathryn"], Shift.by_employee.map{|s| s.employee.name}
end

    should "return employees chronologically" do
      assert_equal ["Ed", "Ed", "Kathryn", "Ed", "Kathryn", "Cindy", "Ed"], Shift.chronological.map{|s| s.employee.first_name}
end
  
  end
end
