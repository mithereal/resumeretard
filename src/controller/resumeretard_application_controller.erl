-module(resumeretard_application_controller, [Req]).
-compile(export_all).

lost('GET', []) ->
    {ok, [{message,"unable to find page"}]}.
    
version('GET', []) ->
appver = application:get_env(resumeretard, vsn).
    {ok, [{version,appver}]}.
