require 'stomp'

cli = Stomp::Client.new("admin","password","localhost",61613)
5.times do |i|
	puts "Publishing message #{i}"
	cli.publish("/topic/pubsub1","Pub/sub msg #{i}")
end

