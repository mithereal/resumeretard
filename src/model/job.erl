-module(job,[Id,Title,Employerid,Entered_ts,Modified_ts,Expires_ts]).
-compile(export_all).

findlatest()->
	{latestjobs,{"name","ts"}}.

create('POST', []) ->
%%  Title = Request:param("title"),

  Job = job:new(Id,Title,Employerid,Entered_ts,Modified_ts,Expires_ts),
  Job:save(),

  {redirect, "/"}.
