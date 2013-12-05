class EmployeesController < Controller

	def asdf
		e = Employee.new({ :identifier => 'ident', :first_name => 'fn', :id => 40 })
		e.save
	end

	def index
		@employees = @client.query("SELECT id, identifier, first_name, last_name FROM employees ORDER BY id")

		render "index"
	end

	def create
	        employees = @client.query("INSERT INTO employees (identifier, first_name, last_name) VALUES ('id', 'fn', 'ln')")
	        puts "affected_rows: " + @client.affected_rows.to_s + "<br />"
	end

	def edit
		id = @client.escape($cgi['id'])
		employees = @client.query("SELECT id, identifier, first_name, last_name FROM employees WHERE id = '#{id}'")
		if employees.count === 0
			puts "NO EMPLOYEE FOUND"
		else
			employees.each do |employee|
				@employee = employee
			end
		end

		render "edit"
	end

	def show
		id = @client.escape($cgi['id'])
		employees = @client.query("SELECT id, identifier, first_name, last_name FROM employees WHERE id = '#{id}'")
		if employees.count === 0
			puts "NO EMPLOYEE FOUND"
		else
			employees.each do |employee|
				puts "Found employee:<br />"
				puts "ID: " + employee["id"].to_s + "<br />"
				puts "First Name: " + employee["first_name"].to_s + "<br />"
				puts "Last Name: " + employee["last_name"].to_s + "<br />"
			end
		end
	end

	def update
		employee = Employee.new({})
		employee.id = $cgi['id']
		employee.identifier = $cgi['identifier']
		employee.first_name = $cgi['first_name']
		employee.last_name = $cgi['last_name']
	        employee.save

		@status_message = "Employee updated"

		edit
	end

	def test

		employees.each do |employee|
			puts employee.inspect + "<br />"
		end
	end
end
