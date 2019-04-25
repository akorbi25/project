module Contexts
  module JobContexts
    def create_jobs
      @cleaner = FactoryBot.create(:job)
      @seller = FactoryBot.create(:job, name: "Seller")
      @waiter  = FactoryBot.create(:job, name: "Waiter", active: false)
      @cooker   = FactoryBot.create(:job, name: "Cooker")
    end

    def remove_jobs
      @cleaner.destroy
      @seller.destroy
      @waiter.destroy
      @cooker.destroy
    end
  end
end