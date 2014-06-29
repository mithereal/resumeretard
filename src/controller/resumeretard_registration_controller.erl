-module(resumeretard_registration_controller, [Req]).
-compile(export_all).

index('GET', []) ->
    {ok,  []}.

signup('POST', []) ->
    {ok,  []}.

register('GET', []) ->
    {ok, []};

register('POST', []) ->
    Email = Req:post_param("email"),
    Username = Req:post_param("username"),
    Password = bcrypt:hashpw(Req:post_param("password"),bcrypt:gen_salt()),
    ColosimoUser = colosimo_user:new(id, Email, Username, Password),
    Result = ColosimoUser:save(),
    {ok, [Result]}.
