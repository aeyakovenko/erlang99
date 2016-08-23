-module(erlang99).
-include_lib("eunit/include/eunit.hrl").
-import(lists,[]).
-export([last/1
        ,penultimate/1
        ,nth/2
        ,reverse/1
        ,palindrome/1
        ,nelems/1
        ,flatten/1
        ,compress/1
        ]).

last([H|[]]) -> H;
last([_|T]) -> last(T).

last_test_() -> ?_assertEqual(3, last([1,2,3])).

penultimate([H,_|[]]) -> H;
penultimate([_|T]) -> penultimate(T).

penultimate_test_() -> ?_assertEqual(2, penultimate([1,2,3])).

nth(1, [H|_]) -> H;
nth(N, [_|T]) -> nth(N-1,T).

nth_test_() -> 
  [?_assertEqual(1, nth(1, [1]))
  ,?_assertEqual(2, nth(2, [1,2]))
  ,?_assertEqual(1, nth(1, [1,2,3]))
  ,?_assertEqual(2, nth(2, [1,2,3]))
  ,?_assertEqual(3, nth(3, [1,2,3]))
  ].

reverse(L) -> lists:foldl(fun(X,Z) -> [X|Z] end, [], L).

reverse_test_() -> 
  Ls=[[],[0],[0,1],[0,1,2]],
  [?_assertEqual(lists:reverse(lists:nth(1,Ls)), reverse(nth(1,Ls)))
  ,?_assertEqual(lists:reverse(lists:nth(2,Ls)), reverse(nth(2,Ls)))
  ,?_assertEqual(lists:reverse(lists:nth(3,Ls)), reverse(nth(3,Ls)))
  ,?_assertEqual(lists:reverse(lists:nth(4,Ls)), reverse(nth(4,Ls)))
  ].

nelems(Ls) -> lists:foldr(fun(_,Z) -> (Z + 1) end, 0, Ls).

nelems_test_() -> 
  [?_assertEqual(0, nelems([]))
  ,?_assertEqual(1, nelems([1]))
  ,?_assertEqual(2, nelems([1,2]))
  ,?_assertEqual(3, nelems([1,2,3]))
  ].

palindrome(Ls) -> reverse(Ls) =:= Ls.

palindrome_test_() -> 
  [?_assertEqual(true, palindrome([]))
  ,?_assertEqual(true, palindrome([1]))
  ,?_assertEqual(false, palindrome([1,2]))
  ,?_assertEqual(true, palindrome([1,2,1]))
  ,?_assertEqual(false, palindrome([1,2,1,2]))
  ,?_assertEqual(true, palindrome([1,2,2,1]))
  ].

flatten([]) -> [];
flatten([H|T]) -> flatten(H) ++ flatten(T);
flatten(Ls) -> [Ls].

flatten_test_() -> 
  [?_assertEqual([], flatten([]))
  ,?_assertEqual([], flatten([[]]))
  ,?_assertEqual([], flatten([[],[]]))
  ,?_assertEqual([], flatten([[[]],[]]))
  ,?_assertEqual([], flatten([[],[[]]]))
  ,?_assertEqual([1], flatten([[],[[1]]]))
  ,?_assertEqual([1,2], flatten([[1],[[2]]]))
  ].

compress([]) -> [];
compress([H,H|T]) -> compress([H|T]);
compress([H|T]) -> [H|compress(T)].

compress_test_() ->
  [?_assertEqual([], compress([]))
  ,?_assertEqual([1], compress([1]))
  ,?_assertEqual([1], compress([1,1]))
  ,?_assertEqual([1], compress([1,1,1]))
  ,?_assertEqual([1,2], compress([1,1,1,2]))
  ,?_assertEqual([1,2], compress([1,1,1,2,2]))
  ].
