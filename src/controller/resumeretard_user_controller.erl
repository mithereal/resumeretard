-module(resumeretard_user_controller, [Req]).
-compile(export_all).

login('GET', []) ->
    {ok, [{redirect, Req:header(referer)}]};
    
login('POST', []) ->
    Username = Req:post_param("username"),
    case boss_db:find(member, [{username, 'equals', Username}]) of
        [Member] ->
            case sentry:check_password(Req:post_param("password")) of
                true ->
                    {redirect, proplists:get_value("redirect",
                        Req:post_params(), "/"), sentry:login_cookies()};
                false ->
                    {ok, [{error, "Bad name/password combination"}]}
            end;
        [] ->
            {ok, [{error, "No Member named " ++ Username}]}
    end.

