-module(resumeretard_main_controller, [Req]).
-compile(export_all).

index('GET', []) ->
Newjobs=boss_db:find(job, []),
    {ok,  [newjobs,Newjobs]}.
    
sitemap('GET', []) ->
    {ok,  []}.




