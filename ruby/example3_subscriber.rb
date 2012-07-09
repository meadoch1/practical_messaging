require 'stomp'

mask = ARGV[0]
system("clear")

cli = Stomp::Client.new("admin","password","localhost",61613)

puts "Listening for messages related to #{mask}"
cli.subscribe("/topic/#{mask}", {"id" => "Listening"}) { |m| 
	puts "Listener #{mask} Recieved a message - Topic: #{m.headers['destination']} Body: #{m.body}"
	cli.publish("/queue/resp","Done working on #{m.body}")
}

cli.subscribe("/topic/reset", {"id" => "reset"}) { |m| 
	system("clear")
	puts "Listener #{mask} Recieved a clear message: #{m.body}"
}
while true
	sleep 5
end

