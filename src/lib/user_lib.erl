-module(user_lib).
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
                    case Member:session_identifier() =:= Req:cookie("session_id") of
                        false -> {ok, []};
                        true -> {ok, Member}
                    end
            end
     end.
