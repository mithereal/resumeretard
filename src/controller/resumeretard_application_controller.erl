-module(resumeretard_application_controller, [Req]).
-compile(export_all).

lost('GET', []) ->
    {ok, [{message,"unable to find page"}]}.
    
version('GET', []) ->
Version = boss_db:find(settings, [{name, 'equals', "version"}]),
    {ok, [{version,Version}]}.
