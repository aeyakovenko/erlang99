FILES=test/test.erl\
			src/erlang99.erl

out/ok:$(FILES) Makefile
	mkdir -p $(@D)
	erlc $(FILES)
	erl -noshell -s test hello_world -s init stop
	touch $@
