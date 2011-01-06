-module(lib_misc).
-export([perms/1, pythag/1, qsort/1, sum/1, for/3]).

sum(L)  -> sum(L, 0).

sum([], N)    -> N;
sum([H|T], N) -> sum(T, H+N).

%% Roll your own 'for' loop.
for(Max, Max, F) -> [F(Max)];
for(I, Max, F)   -> [F(I)|for(I+1, Max, F)].

%% Clearly written (but inefficient) quicksort implementation.
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

%% Generates list permutations.
perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].
	      
%% Splits a list of numbers, inefficiently.
odds_and_evens(L) ->
    Odds  = [X || X <- L, (X rem 2) =:= 1],
    Evens = [X || X <- L, (X rem 2) =:= 0],
    {Odds, Evens}.


%% Splits the list of numbers more efficiently, using accumulators.
odds_and_evens_acc(L) ->
    odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
    case (H rem 2) of 
	1 -> odds_and_evens_acc(T, [H|Odds], Evens);
	0 -> odds_and_evens_acc(T, Odds, [H|Evens]) 
    end;
odds_and_evens_acc([], Odds, Evens) -> {Odds, Evens}.

