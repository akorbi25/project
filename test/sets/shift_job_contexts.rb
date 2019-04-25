module Contexts
    module ShiftJobContexts
        def create_shift_jobs
            # puts @ed_past_shift2.date
            # puts @cashier.name
            @edshift = FactoryBot.create(:shift, assignment: @assignment1, date: 1.day.from_now.to_date)
            # # puts @ed_shift2.date
            @ed_shift2_job1 = FactoryBot.create(:shift_job, shift: @edshift, job: @seller)
            # # puts @ed_shift2_job1
            @ed_shift2_job2 = FactoryBot.create(:shift_job, shift: @edpastshift2, job: @waiter)
            @kathryn_shift1_job1 = FactoryBot.create(:shift_job, shift: @kathrynpastshift, job: @cooker)
            # puts "The number of shifts completed is: #{Shift.completed.count}"
        end
        def remove_shift_jobs
            @edshift.destroy
            @ed_shift2_job1.destroy
            @ed_shift2_job2.destroy
            @kathryn_shift1_job1.destroy
        end
    end
end