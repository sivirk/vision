-module(index).
-compile(export_all).
-include_lib("n2o/include/wf.hrl").

main() -> 
    Title = "HUITATILE",
    Body = "Body",
    [#dtl{bindings=[{title,Title},{body,Body}]} ].

body() -> [].

account() ->[].
header() -> [].
footer() -> [].

% api_event(Name,Tag,Term) -> error_logger:info_msg("Index Name ~p, Tag ~p, Term ~p",[Name,Tag,Term]), event(change_me).
% event({counter,C}) -> wf:update(onlinenumber,wf:to_list(C));
% event(Event) -> error_logger:info_msg("Event: ~p", [Event]).
