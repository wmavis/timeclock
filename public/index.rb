#!/usr/bin/env ruby

ENV["RUBY_ENV"] ||= 'development'

require 'rubygems'
require 'cgi'
$cgi = CGI.new
puts $cgi.header

puts "<html><body>"

begin
	Dir['../app/**/*.rb'].each{ |f| require f }
	require 'yaml'
	require 'mysql2'

	database = YAML::load(File.open('../config/database.yml'))
	client = Mysql2::Client.new(database[ENV["RUBY_ENV"]])

	c = EmployeesController.new(client)
	c.show

rescue Exception => e
	if ENV["RUBY_ENV"] === 'development'
		puts "<b>Exception: " + CGI.escapeHTML(e.inspect) + "</b>"
	else
		raise e
	end
end

puts "</body></html>"
