-module(erlang99).
-include_lib("eunit/include/eunit.hrl").
-export([last/1, penultimate/1]).

last([H|[]]) -> H;
last([_|T]) -> last(T).

last_test_() -> ?_assertEqual(3, last([1,2,3])).

penultimate([H,_|[]]) -> H;
penultimate([_|T]) -> penultimate(T).

penultimate_test_() -> ?_assertEqual(2, penultimate([1,2,3])).
