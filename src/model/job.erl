-module(job,[Id,Title,Ownerid,Employerid,Entered,Modified,Expires]).

-compile(export_all).

latest()->
 %%Test1 = boss_db:find(job, []).
 {output,"ok"}.

create('POST', []) ->
%%  Title = Request:param("title"),

  Job = job:new(Id,Title,Employerid,Entered,Modified,Expires),
  Job:save(),

  {redirect, "/"}.
