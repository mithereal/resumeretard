-module(resumeretard_job_controller, [Req]).
-compile(export_all).

%% @doc Creates a new job record.
create('POST', []) ->
Attrs = [{title, Req:param("title")},{ownerid, Req:param("ownerid")},{created, Req:param("created")},{modified, Req:param("modified")},{expires, Req:param("expires")},{location, Req:param("location")},{subtitle, Req:param("subtitle")},{requirements, Req:param("requirements")},{benifets, Req:param("benifets")},{type, Req:param("type")},{description, Req:param("description")}],

  Job = boss_record:new('job', Attrs),
  Job:save(),
  
 {ok, [{job,Job}]}.

%% @doc Lists job records.
list('GET', []) ->

  Jobs = boss_db:find(job,[]),
  
 {ok, [{jobs,Jobs}]}.
