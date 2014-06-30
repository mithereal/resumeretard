-module(member, [Id, Username, Email, Name, PasswordHash, Key, Status]).
-define(SECRET_STRING, "Not telling secrets!").
-compile(export_all).
%% @doc Returns the session identifier.
session_identifier() ->
    mochihex:to_hex(erlang:md5(?SECRET_STRING ++ Id)).
    
%% @doc Returns true if the password is correct.
check_password(Password) ->
    Salt = mochihex:to_hex(erlang:md5(Username)),
    sentry:hash_password(Password, Salt) =:= PasswordHash.
   
%% @doc Returns the login cookies.
login_cookies() ->
    [ mochiweb_cookies:cookie("member_id", Id, [{path, "/"}]),
        mochiweb_cookies:cookie("session_id", session_identifier(), [{path, "/"}]) ].
        
%% @doc Returns true if the password is correct.
%%check_cryptpass(Password) ->
%%    sentry:hash_password(Password) =:= PasswordHash.

%% @doc Returns true if the password is correct.    
%%check_password(PasswordAttempt) ->
%%    StoredPassword = erlang:binary_to_list(PasswordHash),
%%    sentry:compare_password(PasswordAttempt, StoredPassword).

%% @doc Returns a random string of x length.
random_string(Length) ->
	AllowedChars="1234567890qwertyuiopasdfghjklzxcvbnm",
    lists:foldl(fun(_, Acc) ->
                        [lists:nth(random:uniform(length(AllowedChars)),
                                   AllowedChars)]
                            ++ Acc
                end, [], lists:seq(1, Length)).

