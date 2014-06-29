-module(user_lib).
-compile(export_all).


hash_password(Password)->
    bcrypt:hashpw(Password, bcrypt:gen_salt()).

hash_password(Password, Salt) ->
    mochihex:to_hex(erlang:md5(Salt ++ Password)).

hash_for(Name, Password) ->
    Salt = mochihex:to_hex(erlang:md5(Name)),
    hash_password(Password, Salt).

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
