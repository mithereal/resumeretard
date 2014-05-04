-module(resumeretard_application_controller, [Req]).
-compile(export_all).

lost('GET', []) ->
    {ok, [{message,"unable to find page"}]}.
    
version('GET', []) ->
%DATA = boss_db:find(settings, [{name, 'equals', "version"}]),
%RECORD= hd(DATA),
%VALUE=RECORD:value(),
    {ok, [{version,appver}]}.
