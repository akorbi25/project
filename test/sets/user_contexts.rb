module Contexts
  module UserContexts
    def create_users
      #puts "h;lm"
      #puts @ed_user.email
      @ed_user = FactoryBot.create(:user, employee: @ed, email: "ed@gmail.com", password_digest: "edpass")
      #puts @ed_user.email
      #puts @ed.first_name
      @cindy_user = FactoryBot.create(:user, employee: @cindy, email: "cindy@gmail.com", password_digest: "cindypass")
      puts @cindy.first_name
      @ralph_user = FactoryBot.create(:user, employee: @ralph, email: "ralph@gmail.com", password_digest: "ralphpass")
    end
    
    def remove_users
      @ed_user.destroy
      @cindy_user.destroy
      @ralph_user.destroy
    end

  end
end