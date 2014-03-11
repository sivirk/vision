-module(index).
-compile(export_all).
-include_lib("n2o/include/wf.hrl").

main() ->
    Title = "Vision",
    Body = body(),
    [ #dtl{file = "index", ext="html", bind_script=true, bindings=[{title,Title},{body,Body}]} ].

body() -> 
    [].

account() ->[].
header() -> [].
footer() -> [].

event({counter,C}) -> wf:update(onlinenumber,wf:to_list(C));

event(Event) -> error_logger:info_msg("Unknown Event: ~p", [Event]).
