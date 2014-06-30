-module(member, [Id, Username, Email, Name, PasswordHash, Key, Status]).
-define(SECRET_STRING, "Not telling secrets!").

session_identifier() ->
    mochihex:to_hex(erlang:md5(?SECRET_STRING ++ Id)).
    
%% old password check method
check_password(Password) ->
    Salt = mochihex:to_hex(erlang:md5(Username)),
    user_lib:hash_password(Password, Salt) =:= PasswordHash.

login_cookies() ->
    [ mochiweb_cookies:cookie("member_id", Id, [{path, "/"}]),
        mochiweb_cookies:cookie("session_id", session_identifier(), [{path, "/"}]) ].

%check_cryptpass(Password) ->
%    user_lib:hash_password(Password) =:= PasswordHash.
    
%check_password(PasswordAttempt) ->
%    StoredPassword = erlang:binary_to_list(PasswordHash),
%    user_lib:compare_password(PasswordAttempt, StoredPassword).


random_string(Length) ->
	AllowedChars="1234567890qwertyuiopasdfghjklzxcvbnm",
    lists:foldl(fun(_, Acc) ->
                        [lists:nth(random:uniform(length(AllowedChars)),
                                   AllowedChars)]
                            ++ Acc
                end, [], lists:seq(1, Length)).

