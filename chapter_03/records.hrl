
%% .hrl files are used for holding record definitions.
%%  (probably not an accident they use an .h - like C headers)
-record(todo, {status=reminder,who=joe,text}).
