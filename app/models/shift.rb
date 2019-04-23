class Shift < ApplicationRecord
    belongs_to :assignment
    has_many :shift_jobs
    has_many :jobs, through: :shift_jobs
    has_one :employee, through: :assignment
    has_one :store, through: :assignment
    validates_presence_of :date, :start_time, :assignment
    validates_time :start_time
    validates_time :end_time, after: :start_time, allow_blank: true    
    validates_date :date, on_or_after: lambda { :assignment_start_date }, on_or_before_message: "must be on or after the start of the assignment"
    validate :assignment_must_be_current
   
   
    scope :completed, -> { joins(:shift_jobs).group(:shift_id) }
    scope :for_store, -> (store_id) { joins(:assignment, :store).where("assignments.store_id = ?", store_id) }
    scope :past, -> { where('date < ?', Date.current) }
    scope :upcoming, -> { where('date >= ?', Date.current) }
    
    def completed?
        self.shift_jobs.count>0 
    end
    
    def start_now
        self.update_attribute(:start_time,Time.current)
    end
    
    def end_now
        self.update_attribute(:end_time, Time.current)
    end


  private
  def assignment_start_date
    @assignment_start_date = self.assignment.start_date.to_date
  end
  
  def assignment_must_be_current
    unless self.assignment.nil? || self.assignment.end_date.nil?
      errors.add(:assignment_id, "is not a current assignment at the creamery")
    end
  end    
 
end
