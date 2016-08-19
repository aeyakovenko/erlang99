-module(test).
-export([hello_world/0]).
-import(erlang99,[]).

last_t() -> 
  L = 3,
  L = erlang99:last([1,2,3]).

hello_world() ->
  last_t(),
  io:fwrite("pass\n").

