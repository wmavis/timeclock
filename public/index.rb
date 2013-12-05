#!/usr/bin/env ruby

RUBY_ENV = 'development'

require 'rubygems'
require 'cgi'
cgi = CGI.new
puts cgi.header

begin
	require 'yaml'
	require 'mysql2'

	database = YAML::load(File.open('../config/database.yml'))
	client = Mysql2::Client.new(database[RUBY_ENV])

	employees = client.query("INSERT INTO employees (identifier, first_name, last_name) VALUES ('id', 'fn', 'ln')")
	puts "affected_rows: " + client.affected_rows.to_s + "<br />"

	employees = client.query("SELECT * FROM employees")

	employees.each do |employee|
		puts employee.inspect + "<br />"
	end

	puts "<html><body>This is a test</body></html>"
rescue Exception => e
	puts "<html><body>Exception: " + CGI.escapeHTML(e.inspect) + "</body></html>"
end
