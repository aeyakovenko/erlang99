-module(erlang99).
-include_lib("eunit/include/eunit.hrl").
-export([last/1
        ,penultimate/1
        ,kth/2
        ]).

last([H|[]]) -> H;
last([_|T]) -> last(T).

last_test_() -> ?_assertEqual(3, last([1,2,3])).

penultimate([H,_|[]]) -> H;
penultimate([_|T]) -> penultimate(T).

penultimate_test_() -> ?_assertEqual(2, penultimate([1,2,3])).

kth(0, [H|_]) -> H;
kth(N, [_|T]) -> kth(N-1,T).

kth_test_() ->[?_assertEqual(1, kth(0, [1,2,3]))
              ,?_assertEqual(2, kth(1, [1,2,3]))
              ,?_assertEqual(3, kth(2, [1,2,3]))
              ].
