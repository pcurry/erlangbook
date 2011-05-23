-module(exercise01).
-compile(export_all).

start(AnAtom, Fun) ->
    
%%spawn(fun() -> loop([]) end).

rpc(Pid, Request) ->
    Pid ! {self(), Request},
    receive
	{Pid, Response} ->
	    Response
    end.

loop(X) ->
    receive
	Any ->
	    io:format("Received:~p~n", [Any]),
	    loop(x)
    end.

