require 'stomp'

locs = ["NewYork", "Washington", "Orlando", "Phoenix", "Austin", "Chattanooga" ]
infos = ["Weather", "Traffic", "Forecast"]

cli = Stomp::Client.new("admin","password","localhost",61613)

#first clear the client screens
cli.publish("/topic/reset","Clear for new run")

5.times do |i|
	msg = "#{locs.sample}.#{infos.sample}"
	puts "Publishing message #{i} to #{msg}"
	cli.publish("/topic/#{msg}","Pub/sub msg #{i}")
end
