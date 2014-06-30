%% file: src/controller/test_index_controller.erl
-module(resumeretard_home_controller, [Req]).
-compile(export_all).

%% Forces login if valid session is not present.
%% Called before all actions.
before_(_) ->
    user_lib:require_login(Req).

%%
%% Index
%%
%% requires TestUser
%%
%% GET index/index
%%
index('GET', [], Member) ->
    {ok, [{member, Member}]}.
