-module(resumeretard_user_controller, [Req]).
-compile(export_all).

login('GET', []) ->
    {ok, [{redirect, Req:header(referer)}]};
    
login('POST', []) ->
    Username = Req:post_param("username"),
    Password = Req:post_param("password"),
    case boss_db:find(member, [{username, 'equals', Username}]) of
        [Member] ->
            case sentry:check_password(Username,Password) of
                true ->
                 {ok, [{error, "password is correct"}]};
                   %% {redirect, proplists:get_value("redirect",
                     %%   Req:post_params(), "/"), sentry:login_cookies()};
                false ->
                    {ok, [{error, "Bad name/password combination"}]}
            end;
        [] ->
            {ok, [{error, "No Member named " ++ Username}]}
    end.

list('GET', []) ->
	Users = boss_db:find(member, []),
	{ok, [{users, Users}]}.
