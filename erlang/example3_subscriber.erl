-module(example3_subscriber).

-export([rec/0]).

rec() ->
	Conn = stomp:connect("localhost", 61613, "admin","password"),

	stomp:subscribe("/topic/*.Traffic", Conn, []),
	MyFunction=fun([_, _, {_, X}]) ->  io:fwrite("message recieved in Erlang: ~s ~n", [X]) end,
	stomp:on_message(MyFunction, Conn).

