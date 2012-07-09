require 'stomp'

num = ARGV[0]
cli = Stomp::Client.new("admin","password","localhost",61613)
system("clear")
puts "Listening for messages"
cli.subscribe("/queue/cc1", {"id" => "t#{num}"}) { |m| 
	puts "Worker #{num} Recieved a message: #{m.body}"
}

while true
	sleep 5
end
