-module(erlang99).
-export([last/1, penultimate/1]).

last([H|[]]) -> H;
last([_|T]) -> last(T).

last_test() -> 
  3 = last([1,2,3]).

penultimate([H,_|[]]) -> H;
penultimate([_|T]) -> penultimate(T).

penultimate_test() -> 
  2 = penultimate([1,2,3]).


