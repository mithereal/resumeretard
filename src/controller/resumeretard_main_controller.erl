-module(resumeretard_main_controller, [Req]).
-compile(export_all).

index('GET', []) ->
Jobs = boss_db:find(job, []),
    {ok,  [{jobs,Jobs}]}.
    
sitemap('GET', []) ->
    {ok,  []}.

home('GET', []) ->
Jobs = boss_db:find(job, []),
    {ok,  [{jobs,Jobs}]}.
