require 'stomp'

system("clear")

cli = Stomp::Client.new("admin","password","localhost",61613)

puts "Listening for messages to do work"
cli.subscribe("/queue/workdist", {"id" => "Listening"}) { |m| 
	load = [0,1,2,3].sample

	puts "Recieved a message - Body: #{m.body}"
	puts "Working for #{load} secs"
	sleep load
	cli.publish("/queue/resp","Done working on #{m.body}")
}

cli.subscribe("/topic/reset", {"id" => "reset"}) { |m| 
	system("clear")
	puts "Recieved a clear message: #{m.body}"
}
while true
	sleep 5
end


