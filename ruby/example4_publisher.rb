require 'stomp'

cli = Stomp::Client.new("admin","password","localhost",61613)

#first clear the client screens
cli.publish("/topic/reset","Clear for new run")

5.times do |i|
	puts "Publishing message #{i} to do work"
	
	cli.publish("/queue/workdist","Do work msg #{i}")

end
