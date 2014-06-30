-module(job,[Id,Title,Ownerid,Created,Modified,Expires,Location,Subtitle,Requirements,Benifets,Type,Description,Payrate]).

-compile(export_all).

%% @doc Returns the most recently posted job records.
latest()->
 Data = boss_db:find(job, []).
 %%{output,[{latestjobs,Data}]}.
 
