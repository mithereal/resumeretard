-module(resumeretard_application_controller, [Req]).
-compile(export_all).

lost('GET', []) ->
    {ok, [{message,"unable to find page"}]}.
    
version('GET', []) ->
	Version=os:cmd("git log | grep '^commit' | head -n 1 | sed 's/commit //'"),
    {ok, [{version,Version}]}.

