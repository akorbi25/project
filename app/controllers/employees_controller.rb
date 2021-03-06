class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  #authorize_resource
  # GET /employees
  # GET /employees.json
  def index
    if current_user.employee.role == "admin"
      @employees = Employee.all.alphabetical
      #@inactive_employees = Employee.inactive.alphabetical
    elsif current_user.employee.role == "manager"
          @employees = Employee.all.alphabetical
      #@employees = Employee.all.alphabetical.select{|x| x.hasassignments && x.current_assignment.store == current_user.employee.current_assignment.store}
        #@inactive_employees = Employee.inactive.alphabetical.select{|x| x.working? && x.current_assignment.store == current_user.employee.current_assignment.store}
    else
      @employee = current_user.employee
    end

    #authorize! :read, @employees
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end
  
  def active
    @employees = Employee.active
  end

  def inactive
    @employees = Employee.inactive
  end
  
  def managers
    @employees = Employee.managers
  end
  def regulars
    @employees = Employee.regulars
  end
  def admins
    @employees = Employee.admins
  end
  
  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.build_user
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :ssn, :date_of_birth, :phone, :role, :active, user_attributes: [:id, :email, :password])
    end
end
