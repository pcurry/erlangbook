-module(world).
-export([start/0]).

start() ->
    Joe      = spawn(person, init, ["Joe"]),
    Susannah = spawn(person, init, ["Susannah"]),
    Dave     = spawn(person, init, ["Dave"]),
    Andy     = spawn(person, init, ["Andy"]),
    Rover    = spawn(dog, init, ["Rover"]),
    Rabbit1  = spawn(rabbit, init, ["Flopsy"]),
    
