-module(job,[Id,Title,Ownerid,Created,Modified,Expires,Location,Subtitle,Requirements,Benifets,Type,Description]).

-compile(export_all).

latest()->
 %%Test1 = boss_db:find(job, []).
 {output,"ok"}.

create('POST', []) ->
%%  Title = Request:param("title"),

  Job = job:new(Id,Title,Ownerid,Created,Modified,Expires,Location,Subtitle,Requirements,Benifets,Type,Description),
  Job:save(),

  {redirect, "/"}.
