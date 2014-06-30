-module(job,[Id,Title,Ownerid,Created,Modified,Expires,Location,Subtitle,Requirements,Benifets,Type,Description]).

-compile(export_all).

latest()->
 Data = boss_db:find(job, []).
 %%{output,[{latestjobs,Data}]}.

create('POST', []) ->
%%  Title = Request:param("title"),

  Job = job:new(Id,Title,Ownerid,Created,Modified,Expires,Location,Subtitle,Requirements,Benifets,Type,Description),
  Job:save(),

  {redirect, "/"}.
