-module(resumeretard_application_controller, [Req]).
-compile(export_all).

lost('GET', []) ->
    {ok, [{message,"unable to find page"}]}.
    
version('GET', []) ->
    {ok, [{version,"0.1"}]}.
