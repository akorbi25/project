class Shift < ApplicationRecord
    before_create :newshifts
    # before_destroy :wait
    belongs_to :assignment
    has_many :shift_jobs
    has_many :jobs, through: :shift_jobs
    has_one :employee, through: :assignment
    has_one :store, through: :assignment
    validates_presence_of :date, :start_time, :assignment
    validates_time :start_time
    validates_time :end_time, after: :start_time, allow_blank: true    
    validates_date :date, on_or_after: lambda { :assignment_start_date }, on_or_before_message: "must be on or after the start of the assignment"
    validate :currentassignments
   
   
    scope :completed, -> { joins(:shift_jobs).group(:shift_id) }
    scope :for_store, -> (store_id) { joins(:assignment, :store).where("assignments.store_id = ?", store_id) }
    scope :past, -> { where('date < ?', Date.current) }
    scope :upcoming, -> { where('date >= ?', Date.current) }
    scope :incomplete, -> { joins("LEFT JOIN shift_jobs ON shifts.id = shift_jobs.shift_id").where('shift_jobs.job_id IS NULL') }
    scope :for_employee, ->(employee_id) { joins(:assignment, :employee).where("assignments.employee_id = ?", employee_id) }
    scope :for_next_days, ->(day) { where('date BETWEEN ? AND ?', Date.today, day.days.from_now.to_date) }
    scope :for_past_days, ->(day) { where('date BETWEEN ? AND ?', day.days.ago.to_date, 1.day.ago.to_date) } 
    scope :by_store, -> { joins(:assignment, :store).order('stores.name') }
    scope :by_employee, -> { joins(:assignment, :employee).order('employees.last_name, employees.first_name') }
    scope :chronological, -> { order(:date, :start_time) }
   
    def completed?
        self.shift_jobs.count>0 
    end
    
    def start_now
        self.update_attribute(:start_time, Time.zone.now)
    end
    
    def end_now
        self.update_attribute(:end_time, Time.zone.now)
    end
'new shifts should have a callback which automatically sets the end time
to three hours after the start time'

  def newshifts
    self.end_time= self.start_time+ (3*3600)
  end
  private
  def assignment_start_date
    @assignment_start_date = self.assignment.start_date.to_date
  end
  
  def currentassignments
    if self.assignment.nil? || self.assignment.end_date.nil?
        throw :abort 
    end
  end    
  
  # def wait 
  #   if self.date == date.current
  #     self.destroy
  #   end
  # end
 
end
