class Employee < ApplicationRecord
 # Callbacks
  before_save :reformat_phone
  before_validation :reformat_ssn
  # before_destroy :check
  # after_rollback :be_inactive
  
  # Relationships
  has_many :assignments
  has_many :stores, through: :assignments
  has_one :user, dependent: :destroy
  accepts_nested_attributes_for :user
  has_many :shifts, through: :assignments
  
  
  # Validations
  validates_presence_of :first_name, :last_name, :date_of_birth, :ssn, :role
  validates_date :date_of_birth, on_or_before: lambda { 14.years.ago }, on_or_before_message: "must be at least 14 years old"
  validates_format_of :phone, with: /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", allow_blank: true
  validates_format_of :ssn, with: /\A\d{3}[- ]?\d{2}[- ]?\d{4}\z/, message: "should be 9 digits and delimited with dashes only"
  validates_inclusion_of :role, in: %w[admin manager employee], message: "is not an option"
  validates_uniqueness_of :ssn
  
  # Scopes
  scope :younger_than_18, -> { where('date_of_birth > ?', 18.years.ago.to_date) }
  scope :is_18_or_older,  -> { where('date_of_birth <= ?', 18.years.ago.to_date) }
  scope :active,          -> { where(active: true) }
  scope :inactive,        -> { where(active: false) }
  scope :regulars,        -> { where(role: 'employee') }
  scope :managers,        -> { where(role: 'manager') }
  scope :admins,          -> { where(role: 'admin') }
  scope :alphabetical,    -> { order('last_name, first_name') }
  
  # Other methods
  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end
  
  def current_assignment
    curr_assignment = self.assignments.select{|a| a.end_date.nil?}
    # alternative method for finding current assignment is to use scope 'current' in assignments:
    # curr_assignment = self.assignments.current    # will also return an array of current assignments
    return nil if curr_assignment.empty?
    curr_assignment.first   # return as a single object, not an array
  end
  
  def over_18?
    date_of_birth < 18.years.ago.to_date
  end
  
  def hasassignments
    !(self.current_assignment.nil?)
  end
  def age
    (Time.now.to_s(:number).to_i - date_of_birth.to_time.to_s(:number).to_i)/10e9.to_i
  end
  
  # Misc Constants
  ROLES_LIST = [['Employee', 'employee'],['Manager', 'manager'],['Administrator', 'admin']]
  
  # def destroyuser
    
  # end

  
  # Callback code  (NOT DRY!!!)
  # -----------------------------
   #private
   def reformat_phone
     phone = self.phone.to_s  # change to string in case input as all numbers 
     phone.gsub!(/[^0-9]/,"") # strip all non-digits
     self.phone = phone       # reset self.phone to new string
   end
   def reformat_ssn
     ssn = self.ssn.to_s      # change to string in case input as all numbers 
     ssn.gsub!(/[^0-9]/,"")   # strip all non-digits
     self.ssn = ssn           # reset self.ssn to new string
   end
   
  # def check
  #   if self.shifts.past.empty?
  #     self.destroy
  #     self.current_assignment.delete unless self.current_assignment.nil?
  #   else
  #       throw :abort 
  #   end
  # end
  
  # def be_inactive
  #   self.update_attribute(:active, false)
  #     if !self.current_assignment.nil?
  #     @termassign = self.current_assignment
  #     @termassign.each {|x| x.update_attribute(:end_date, Date.current)} 
  #     @termshift = self.shifts.upcoming
  #     @termshift.each {|x| x.destroy} 
  #   end
  # end 
    

    end


