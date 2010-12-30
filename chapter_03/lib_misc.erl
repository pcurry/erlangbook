-module(lib_misc).
-export([pythag/1, qsort/1, sum/1, for/3]).

sum(L)  -> sum(L, 0).

sum([], N)    -> N;
sum([H|T], N) -> sum(T, H+N).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F)   -> [F(I)|for(I+1, Max, F)].

qsort([])        -> [];
qsort([Pivot|T]) -> 
    qsort([X || X <- T, X < Pivot])
	++ [Pivot] ++ 
	qsort([X || X <- T, X >= Pivot]).

%% Would be more efficient if we could just get the sequence once, and 
%% reference it repeatedly, rather than generating it thrice.
pythag(N) ->
    [ {A, B, C} || A <- lists:seq(1,N),
		   B <- lists:seq(1,N),
		   C <- lists:seq(1,N),
		   A+B+C =< N,
		   A*A+B*B =:= C*C
    ].
