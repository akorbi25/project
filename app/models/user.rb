class User < ApplicationRecord
    belongs_to :employee
    has_secure_password 
    validates_uniqueness_of :email, case_sensitive: false
    validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format"
    validate :employee_is_active_in_system, on: :update

  private

  def employee_is_active_in_system
    is_active_in_system(:employee)
  end
  
end
