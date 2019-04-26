class User < ApplicationRecord
    belongs_to :employee
    has_secure_password 
    validates_uniqueness_of :email, case_sensitive: false
    validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format"
    validate :active_employee, on: :update
  

  def emp_role
    return self.employee.role
  end
  
  private

  def active_employee?
      if !self.employee.active
        throw :abort
      end
  end
  
end
