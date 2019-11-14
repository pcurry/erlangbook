-module(shop2).
-export([total/1]).
-import(lists, [map/2, sum/1]).

total(L) ->
    lists:sum([shop:cost(A) * B || {A, B} <- L]).
