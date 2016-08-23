FILES=src/erlang99.erl

test:
	rebar3 eunit

loop:
	while true; do fswatch -1 .; $(MAKE) test; done
