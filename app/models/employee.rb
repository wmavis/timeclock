class Employee < Model
	attr_accessor :id, :identifier, :first_name, :last_name

	def save
		# If we do not have an id, insert a new row.  Otherwise, update the existing row
		if id.nil?
			sql = "INSERT INTO employees(identifier, first_name, last_name) " +
				"VALUES ('#{$client.escape(self.identifier.to_s)}', '#{$client.escape(self.first_name.to_s)}', '#{$client.escape(self.last_name.to_s)}')"
		else
			sql = "UPDATE employees " +
				"SET identifier = '#{$client.escape(self.identifier.to_s)}', " +
				"first_name = '#{$client.escape(self.first_name.to_s)}', " +
				"last_name = '#{$client.escape(self.last_name.to_s)}' " +
				"WHERE id = '#{$client.escape(self.id.to_s)}'"
		end

		# Execute the sql
		$client.query(sql)

		# If this is a new row, get the automatically generated id
		if id.nil?
			self.id = $client.last_id
		end
	end
end
