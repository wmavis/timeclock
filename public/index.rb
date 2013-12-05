#!/usr/bin/env ruby

require 'cgi'
cgi = CGI.new
puts cgi.header

begin
	require 'rubygems'
	require 'mysql2'

	puts "<html><body>This is a test</body></html>"
rescue Exception => e
	puts "<html><body>Exception: " + CGI.escapeHTML(e.inspect) + "</body></html>"
end
