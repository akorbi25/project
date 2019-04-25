module Contexts
  module UserContexts
    def create_users
      @ed_user = FactoryBot.create(:user, employee: @ed, email: "ed@gmail.com")
      puts @ed.first_name
      @cindy_user = FactoryBot.create(:user, employee: @cindy, email: "cindy@gmail.com")
      puts @cindy.first_name
      @ralph_user = FactoryBot.create(:user, employee: @ralph, email: "ralph@gmail.com")
    end
    
    def remove_users
      @ed_user.destroy
      @cindy_user.destroy
      @ben_user.destroy
    end

  end
end