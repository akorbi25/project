require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_employees
end
  teardown do
    remove_employees
end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_path
    assert_response :success
  end


    test "should get active employees" do
    get active_employees_path
    assert_response :success
  end
      test "should get inactive employees" do
    get inactive_employees_path
    assert_response :success
  end
      test "should get managers" do
    get managers_path
    assert_response :success
  end
      test "should get regulars" do
    get regulars_path
    assert_response :success
  end
      test "should get for admins" do
    get admins_path
    assert_response :success
  end
  
  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { active: @ed.active, date_of_birth: @ed.date_of_birth, first_name: @ed.first_name, last_name: @ed.last_name, phone: @ed.phone, role: @ed.role, ssn: @ed.ssn } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@ed)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@ed)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@ed), params: { employee: { active: @ed.active, date_of_birth: @ed.date_of_birth, first_name: @ed.first_name, last_name: @ed.last_name, phone: @ed.phone, role: @ed.role, ssn: @ed.ssn } }
    assert_redirected_to employee_url(@ed)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@ed)
    end

    assert_redirected_to employees_url
  end
end
