require 'stomp'

cli = Stomp::Client.new("admin","password","localhost",61613)

cli.subscribe("/queue/resp", {"id" => "resp"}) { |m| 
	puts "Recieved finished task #{m.body}"
}

while true
	sleep 5
end
