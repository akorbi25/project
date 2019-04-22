module Contexts
  module UserContexts
    def create_users
      @ed_user = FactoryBot.create(:user, employee: @ed, email: "ed@example.com")
      puts @ed.first_name
      @cindy_user = FactoryBot.create(:user, employee:@cindy, email: "cindy@example.com")
      puts @cindy.first_name
      @ben_user = FactoryBot.create(:user, employee:@ben, email: "ben@example.com")
      @alex_user = FactoryBot.create(:user, employee:@alex, email: "alex@example.com")
    end
    
    def remove_users
      @ed_user.destroy
      @cindy_user.destroy
      @ben_user.destroy
      @alex_user.destroy
    end

  end
end