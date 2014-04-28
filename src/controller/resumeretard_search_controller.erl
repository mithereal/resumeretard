-module(resumeretard_search_controller, [Req]).
-compile(export_all).

index('GET', []) ->
    {ok,  []}.
    
jobs('GET', [Terms]) ->
	Jobs=boss_db:find(job, []),
    {ok,  [{jobs,Jobs}]}.


portfolios('GET', [Terms]) ->
	Portfolios=boss_db:find(portfolio, []),
    {ok,  [{portfolios,Portfolios}]}.
