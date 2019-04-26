module Contexts
    module ShiftJobContexts
        def create_shift_jobs

            @edshift = FactoryBot.create(:shift, assignment: @assignment1, date: 1.day.from_now.to_date)
            @edshiftj = FactoryBot.create(:shift_job, shift: @edshift, job: @seller)
            @edshiftj2 = FactoryBot.create(:shift_job, shift: @edpastshift2, job: @waiter)
            @kathrynshiftj = FactoryBot.create(:shift_job, shift: @kathrynpastshift, job: @cooker)
            # puts "The number of shifts completed is: #{Shift.completed.count}"
        end
        def remove_shift_jobs
            @edshift.destroy
            @edshiftj.destroy
            @edshiftj2.destroy
            @kathrynshiftj.destroy
        end
    end
end