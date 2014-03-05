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

