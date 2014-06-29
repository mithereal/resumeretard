-module(member, [Id, Username, Name, PasswordHash]).
-define(SECRET_STRING, "Not telling secrets!").

session_identifier() ->
    mochihex:to_hex(erlang:md5(?SECRET_STRING ++ Id)).

check_password(Password) ->
    Salt = mochihex:to_hex(erlang:md5(Username)),
    user_lib:hash_password(Password, Salt) =:= PasswordHash.

login_cookies() ->
    [ mochiweb_cookies:cookie("member_id", Id, [{path, "/"}]),
        mochiweb_cookies:cookie("session_id", session_identifier(), [{path, "/"}]) ].

check_cryptpass(PasswordAttempt) ->
   Password =:= bcrypt:hashpw(PasswordAttempt, Password).
