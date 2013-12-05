#!/usr/bin/env ruby

# Default RUBY_ENV environment variable to development if it is not set
ENV["RUBY_ENV"] ||= 'development'

require 'rubygems'
require 'cgi'
$cgi = CGI.new
puts $cgi.header

puts "<html><body>"

begin
	require 'yaml'
	require 'mysql2'
	# Require the base classes first
	require '../app/models/model.rb'
	require '../app/views/view.rb'
	require '../app/controllers/controller.rb'
	# Require all ruby files in the app directory
	Dir['../app/**/*.rb'].each{ |f| require f }

	# Get database connection info and connect to the database
	database = YAML::load(File.open('../config/database.yml'))
	$client = Mysql2::Client.new(database[ENV["RUBY_ENV"]])

	# Get the controller and action from the params and default if needed
	controller_name = $cgi['controller']
	action_name = $cgi['action']
	controller_name = "EmployeesController" if controller_name.empty?
	action_name = "edit" if action_name.empty?

	# Create the controller requested by the user
	controller = Module.const_get(controller_name).new($client)

	# Call the action requested by the user on the created controller
	controller.send(action_name)

rescue Exception => e
	# If this is development, display the exception to the front end
	if ENV["RUBY_ENV"] === 'development'
		puts "<b>Exception: " + CGI.escapeHTML(e.inspect) + "</b>"
	else
		raise e
	end
end

puts "</body></html>"
