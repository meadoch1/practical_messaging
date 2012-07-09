require 'stomp'

cli = Stomp::Client.new("admin","password","localhost",61613)
5.times do |i|
	puts "Publishing message #{i}"
	cli.publish("/queue/cc1","Do work! msg #{i}")
end

