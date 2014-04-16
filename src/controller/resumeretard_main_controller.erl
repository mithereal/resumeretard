-module(resumeretard_main_controller, [Req]).
-compile(export_all).

index('GET', []) ->
    {output, "<strong>index</strong>"}.



