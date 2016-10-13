-module(useless).

-export([add/2, greet_and_add_two/1, greet/2]).

add(A,B) ->
  A+B.

hello() ->
  io:format("Hello, world!~n").

greet_and_add_two(X) ->
  hello(),
  add(X,2).

greet(male, Name) ->
  io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
  io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
  io:format("Hello, ~s!", [Name]).
