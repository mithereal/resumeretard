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
    Member = member:new(id, Username, Password ),
    Result = Member:save(),
    {ok, [Result]}.
