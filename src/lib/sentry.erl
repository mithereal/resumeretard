-module(sentry).
-compile(export_all).

%% On success, returns {ok, Hash}.
hash_password(Password)->
    {ok, Salt} = bcrypt:gen_salt(),
    bcrypt:hashpw(Password, Salt).

hash_password(Password, Salt) ->
    mochihex:to_hex(erlang:md5(Salt ++ Password)).

hash_for(Name, Password) ->
    Salt = mochihex:to_hex(erlang:md5(Name)),
    hash_password(Password, Salt).

%compare_password(PasswordAttempt, Password) ->
%    {ok, Password} =:= bcrypt:hashpw(PasswordAttempt, Password).

    
require_login(Req) ->
    case Req:cookie("member_id") of
        undefined -> {ok, []};
        Id ->
            case boss_db:find(Id) of
                undefined -> {ok, []};
                Member ->
                    case sentry:session_identifier() =:= Req:cookie("session_id") of
                        false -> {ok, []};
                        true -> {ok, Member}
                    end
            end
     end.

random_string(Length) ->
	AllowedChars="1234567890qwertyuiopasdfghjklzxcvbnm",
    lists:foldl(fun(_, Acc) ->
                        [lists:nth(random:uniform(length(AllowedChars)),
                                   AllowedChars)]
                            ++ Acc
                end, [], lists:seq(1, Length)).
                
%% @doc Returns true if the password is correct.
check_password(Password) ->
    Salt = mochihex:to_hex(erlang:md5(Username)),
    sentry:hash_password(Password, Salt) =:= PasswordHash.
   
%% @doc Returns the login cookies.
login_cookies() ->
    [ mochiweb_cookies:cookie("member_id", Id, [{path, "/"}]),
        mochiweb_cookies:cookie("session_id", session_identifier(), [{path, "/"}]) ].

%% @doc Returns the session identifier.
session_identifier() ->
    mochihex:to_hex(erlang:md5(?SECRET_STRING ++ Id)).
