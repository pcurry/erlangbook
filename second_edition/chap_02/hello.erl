-module(hello).
-export([start/0, counted/1]).

start() ->
    io:format("Hello world~n").

counted(N) when N >= 1 ->
    start(),
    counted(N-1);
counted(N) when N < 0 ->
    io:format("Can't count negative times~n");
counted(0) ->
    io:format("~n").
