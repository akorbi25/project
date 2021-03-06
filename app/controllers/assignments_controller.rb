class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    if current_user.employee.role == "admin"
    @assignments = Assignment.all
    elsif current_user.employee.role == "manager" 
         @assignments = Assignment.all
        # puts current_user.employee.current_assignment.store.id
      #@assignments = Assignment.for_store(current_user.employee.current_assignment.store.id)
    else
    @assignments = current_user.employee.assignments
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new
  end
  
  
    def past_assignments
    @assignments = Assignment.past
  end
    def current
    @assignments = Assignment.current
  end

  # GET /assignments/1/edit
  def edit
  end
  
  def for_store
    @assignments = Assignment.for_store(2)
  end

  def for_employee
    @assignments = Assignment.for_employee(1)
  end
  
  def for_pay_level
    @assignments = Assignment.for_pay_level(3)
  end
  
  def for_role
    @assignments = Assignment.for_role("manager")
  end
  
  def current
    @assignments = Assignment.current
  end
  def past
    @assignments = Assignment.past
  end
  
  


  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:store_id, :employee_id, :start_date, :end_date, :pay_level)
    end
end
