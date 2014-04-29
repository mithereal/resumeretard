-module(job,[Id,Title,Ownerid,Employerid,Created,Modified,Expires,Location,Subtitle]).

-compile(export_all).

latest()->
 %%Test1 = boss_db:find(job, []).
 {output,"ok"}.

create('POST', []) ->
%%  Title = Request:param("title"),

  Job = job:new(Id,Title,Employerid,Created,Modified,Expires,Location,Subtitle),
  Job:save(),

  {redirect, "/"}.
