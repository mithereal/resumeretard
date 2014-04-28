-module(resumeretard_search_controller, [Req]).
-compile(export_all).

index('GET', []) ->
    {ok,  []}.
    
jobs('GET', []) ->
	Jobs=boss_db:find(job, []),
    {ok,  [jobs,Jobs]}.



