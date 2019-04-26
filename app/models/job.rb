class Job < ApplicationRecord
  has_many :shift_jobs
  has_many :shifts, through: :shift_jobs
  validates_presence_of :name
    
  # Scopes
  scope :alphabetical, -> { order('name') }
  scope :active,       -> { where(active: true) }
  scope :inactive,     -> { where(active: false) }
  
  #can only be deleted if the job has never been worked by an employee; otherwise it is made inactive

  before_destroy :wait
  after_rollback :be_inactive
   
  private 
    def wait
      if self.shift_jobs.empty?
        self.destroy
      else
        throw :abort 
      end
    end
    
    
    def be_inactive
         self.update_attribute(:active, false)
    end

end