#!/bin/bash
CODE_LOCATION=/Users/paulc/src/personal/erlang/erlangbook/chapter_06

erlc $CODE_LOCATION/hello.erl
erl -noshell -pa $CODE_LOCATION\
             -s hello start -s init stop