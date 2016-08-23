-module(erlang99).
-include_lib("eunit/include/eunit.hrl").
-import(lists,[]).
-export([last/1
        ,penultimate/1
        ,kth/2
        ,reverse/1
        ]).

last([H|[]]) -> H;
last([_|T]) -> last(T).

last_test_() -> ?_assertEqual(3, last([1,2,3])).

penultimate([H,_|[]]) -> H;
penultimate([_|T]) -> penultimate(T).

penultimate_test_() -> ?_assertEqual(2, penultimate([1,2,3])).

kth(1, [H|_]) -> H;
kth(N, [_|T]) -> kth(N-1,T).

kth_test_() -> [?_assertEqual(1, kth(1, [1]))
               ,?_assertEqual(2, kth(2, [1,2]))
               ,?_assertEqual(1, kth(1, [1,2,3]))
               ,?_assertEqual(2, kth(2, [1,2,3]))
               ,?_assertEqual(3, kth(3, [1,2,3]))
               ].

reverse(L) -> lists:foldl(fun(X,Z) -> [X|Z] end, [], L).

reverse_test_() -> 
    Ls=[[],[0],[0,1],[0,1,2]],
    [?_assertEqual(lists:reverse(lists:nth(1,Ls)), reverse(lists:nth(1,Ls)))
    ,?_assertEqual(lists:reverse(lists:nth(2,Ls)), reverse(lists:nth(2,Ls)))
    ,?_assertEqual(lists:reverse(lists:nth(3,Ls)), reverse(lists:nth(3,Ls)))
    ,?_assertEqual(lists:reverse(lists:nth(4,Ls)), reverse(lists:nth(4,Ls)))
    ].
