-module(jobs,[Id,Title,Entered_ts,Modified_ts,Expires_ts]).
-compile(export_all).

findlatest()->
	{latestjobs,{"name","ts"}}.
