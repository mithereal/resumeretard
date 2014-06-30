-module(resumeretard_job_controller, [Req]).
-compile(export_all).

%% @doc Creates a new job record.
create('POST', []) ->
  Title = Req:param("title"),
  Ownerid = Req:param("ownerid"),
  Created = Req:param("created"),
  Modified = Req:param("modified"),
  Expires = Req:param("expires"),
  Location = Req:param("location"),
  Subtitle = Req:param("subtitle"),
  Requirements = Req:param("requirements"),
  Benifets = Req:param("benifets"),
  Type = Req:param("type"),
  Description = Req:param("description"),

  Job = job:new(id,Title,Ownerid,Created,Modified,Expires,Location,Subtitle,Requirements,Benifets,Type,Description),
  Job:save(),
  
 {ok, [{job,Job}]}.

%% @doc Lists job records.
list('GET', []) ->

  Jobs = boss_db:find(job,[]),
  
 {ok, [{jobs,Jobs}]}.
