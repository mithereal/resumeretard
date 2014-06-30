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
    Key = member:random_string(20),
    Status = "unconfirmed",
    Password = user_lib:hash_password(Req:post_param("password")),
    Member = member:new(id, Username, Email, Password, Key, Status ),
    Result = Member:save(),
    {ok, [Result]}.
    
