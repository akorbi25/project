module Contexts
  module ShiftContexts
    def create_shifts
      create_upcoming_shifts
      create_past_shifts
    end

    def remove_shifts
      remove_upcoming_shifts
      remove_past_shifts
    end

    def create_upcoming_shifts
        #puts @ed.first_name
        #puts @cmu.name
      @assignment1    = FactoryBot.create(:assignment, employee: @ed, store: @cmu, start_date: 1.month.ago.to_date, end_date: nil, pay_level: 2)
     #puts @assign_ed_1.pay_level
      @edshift      = FactoryBot.create(:shift, assignment: @assignment1)
     #puts @edshift.date
      @edshift2      = FactoryBot.create(:shift, assignment: @assignment1, date: 3.days.from_now.to_date)
      #puts @edshift2.date
      @kathrynshift = FactoryBot.create(:shift, assignment: @assign_kathryn)
      @cindyshift   = FactoryBot.create(:shift, assignment: @assign_cindy, date: 1.day.from_now.to_date)
    end

    def remove_upcoming_shifts
      @assignment1.destroy
      @edshift.destroy     
      @edshift2.destroy
      @kathrynshift.destroy
      @cindyshift.destroy
    end

    def create_past_shifts
      @assignment2  = FactoryBot.create(:assignment, employee: @ed, store: @cmu, start_date: 1.month.ago.to_date, end_date: nil, pay_level: 2)
      @edpastshift = FactoryBot.create(:shift, assignment: @assignment2, date: 1.week.from_now.to_date)
      # #puts @edpastshift.date
      @edpastshift.update_attribute(:date, 4.days.ago.to_date)
      @edpastshift2 = FactoryBot.create(:shift, assignment: @assignment2, date: 1.week.from_now.to_date)
      # #puts @edpastshift2.date
      @edpastshift2.update_attribute(:date, 3.days.ago.to_date)
      @kathrynpastshift = FactoryBot.create(:shift, assignment: @assign_kathryn, date: 1.week.from_now.to_date)
      @kathrynpastshift.update_attribute(:date, 1.day.ago.to_date)
    end

    def remove_past_shifts
      @assignment2.destroy
      @edpastshift.destroy
      @edpastshift2.destroy
      @kathrynpastshift.destroy
    end

  end
end