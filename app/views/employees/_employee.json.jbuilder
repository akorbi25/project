json.extract! employee, :id, :first_name, :last_name, :ssn, :birth_of_date, :phone, :role, :active, :created_at, :updated_at
json.url employee_url(employee, format: :json)
