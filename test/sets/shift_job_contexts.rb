module Contexts
    module ShiftJobContexts
        def create_shift_jobs
            puts @ed_past_shift2.date
            puts @cashier.name
            @ed_shift2 = FactoryBot.create(:shift, assignment: @assign_ed_1, date: 1.day.from_now.to_date)
            puts @ed_shift2.date
            @ed_shift2_job1 = FactoryBot.create(:shift_job, shift: @ed_shift2, job: @cashier)
            puts @ed_shift2_job1
            @ed_shift2_job2 = FactoryBot.create(:shift_job, shift: @ed_past_shift2, job: @mopping)
            @ed_shift3_job1 = FactoryBot.create(:shift_job, shift: @ed_past_shift3, job: @cashier)
            @ed_shift3_job2 = FactoryBot.create(:shift_job, shift: @ed_past_shift3, job: @mopping)
            @kathryn_shift1_job1 = FactoryBot.create(:shift_job, shift: @kathryn_past_shift1, job: @cashier)
        end
        def remove_shift_jobs
            # @ed_shift2_job1.destroy
            # @ed_shift2_job2.destroy
            # @ed_shift3_job1.destroy
            # @ed_shift3_job2.destroy
            # @kathryn_shift1_job1.destroy
        end
    end
end