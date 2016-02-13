#!/usr/bin/env ruby
#
#	Ruby 1.9 Code
#	Coded by: Jason Beitler
#

# Vars
require 'rubygems'
require 'mail'
email_hd 	= '/email_header_default.txt'
email	 	= '/email_header.txt'
homeDir	 	= '/home/user'
scanDir	 	= '/External_Daily_Scan/ip_list'
targetList 	= "#{homeDir +  scanDir}/external_targets"
outFile   	= "results"
appDir	 	= "#{homeDir}/External_Daily_Scan"
confDir		= "#{appDir}/email_conf"
logDir	 	= "#{appDir}/logs/"
logFile  	= Time.now.to_s.gsub(/ /,'_')
writer		= File.new(logDir + logFile,'w')

puts "#{confDir + email_hd}"
puts "Starting nmap scan."
writer.puts("Starting nmap scan.")

output = `nmap -iL #{targetList} -sS -T4 -Pn -p1- -R --open -oN #{outFile}`

if output.nil?
	puts "Error scanning!"
	writer.puts("Error scanning!")
	writer.close
	exit!
end

if File.exists?(confDir + email)
	File.delete(confDir + email)
end

puts "Creating Email."
writer.puts("Creating Email.")

puts "cp #{confDir + email_hd} #{confDir + email}"
writer.puts("cp #{confDir + email_hd} #{confDir + email}")

`cp #{confDir + email_hd} #{confDir + email}`

puts "cat #{outFile} >> #{confDir + email}"
writer.puts("cat #{outFile} >> #{confDir + email}")

`cat #{outFile} >> #{confDir + email}`

`sendmail -t < #{confDir + email}`

puts "Emailing report."
writer.puts("Emailing report.")

puts "Cleaning up."
writer.puts("Cleaning up.")

File.delete(outFile) 
writer.puts("\n\nOutput:\n#{output}")
writer.close
