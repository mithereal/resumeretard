-module(resumeretard_cron_controller, [Req]).
-compile(export_all).

%% store git commit as version   
version('GET', []) ->
	Version=os:cmd("git log | grep '^commit' | head -n 1 | sed 's/commit //'"),
	Record = boss_db:find(settings,[{name, 'equals', 'version'}]),

    {output, [Version]}.

