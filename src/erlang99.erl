-module(erlang99).
-export([last/1]).

last([H|[]]) -> H;
last([_|T]) -> last(T).

penultimate([H,_|[]]) -> H;
penultimate([_|T]) -> penultimate(T).
