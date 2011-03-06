-module(area_server2).
-export([loop/0, rpc/2]).

rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
	Response ->
	    Response
    end.


loop() ->
    receive
	{From, {rectangle, Width, Ht}} -> 
	    From ! Width * Ht,
	    loop();
	{From, {circle, R}} ->
	    From ! 3.14159 * R * R,
	    loop();
	Other ->
	    From ! {self(), {error, Other}},
	    loop()
    end.

		      
