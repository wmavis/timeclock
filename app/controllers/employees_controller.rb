class EmployeesController < Controller

	def index
		employees = @client.query("SELECT id, identifier, first_name, last_name FROM employees ORDER BY id")

		employees.each do |employee|
			puts employee['id'].to_s + ": " + employee['identifier'].to_s + "(" + employee['first_name'].to_s + " " + employee['last_name'].to_s + ")<br />"
		end
	end

	def create
	        employees = @client.query("INSERT INTO employees (identifier, first_name, last_name) VALUES ('id', 'fn', 'ln')")
	        puts "affected_rows: " + @client.affected_rows.to_s + "<br />"
	end

	def show
		id = @client.escape($cgi['id'])
		employees = @client.query("SELECT id, identifier, first_name, last_name FROM employees WHERE id = #{id}")
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
	end

	def test

		employees.each do |employee|
			puts employee.inspect + "<br />"
		end
	end
end
