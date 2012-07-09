require 'stomp'

cli = Stomp::Client.new("admin","password","localhost",61613)
cli.publish("/queue/test","hello world")
msg = nil
cli.subscribe("/queue/test", {"id" => "asdf"}) { |m| puts msg = m}
