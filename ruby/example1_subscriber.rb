require 'stomp'

num = ARGV[0]
cli = Stomp::Client.new("admin","password","localhost",61613)
puts "Listening for messages"
cli.subscribe("/topic/pubsub1", {"id" => "t#{num}"}) { |m| 
	puts "Listener #{num} Recieved a message: #{m.body}"
}

while true
	sleep 5
end
