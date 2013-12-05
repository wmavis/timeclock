#!/usr/bin/env ruby

RUBY_ENV = 'development'

require 'rubygems'
require 'cgi'
cgi = CGI.new
puts cgi.header

puts "<html><body>"

begin
	Dir['../app/**/*.rb'].each{ |f| require f }
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
rescue Exception => e
	if RUBY_ENV === 'development'
		puts "<b>Exception: " + CGI.escapeHTML(e.inspect) + "</b>"
	else
		raise e
	end
end

puts "</body></html>"
