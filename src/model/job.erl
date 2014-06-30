-module(job,[Id,Title,Ownerid,Created,Modified,Expires,Location,Subtitle,Requirements,Benifets,Type,Description]).

-compile(export_all).

%% @doc Returns the most recently posted job records.
latest()->
 Data = boss_db:find(job, []).
 %%{output,[{latestjobs,Data}]}.
 
%% @doc Creates a new job record.
create('POST', []) ->
%%  Title = Request:param("title"),

  Job = job:new(Id,Title,Ownerid,Created,Modified,Expires,Location,Subtitle,Requirements,Benifets,Type,Description),
  Job:save(),

  {redirect, "/"}.
