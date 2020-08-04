-module('post_handler').
-export([start/1]).


start(Req)->

	"/" ++ Path = mochiweb_request : get ( path , Req ),

     case Path of
        "post" -> 
        Body = mochiweb_request:recv_body(Req),
        Req:respond({200, [{"Content-Type", "text/plain"}],
                                   erlang:binary_to_list(Body)});
         
         _ -> mochiweb_request : respond ( { 501 , [ ] , [ ] } , Req ) 
     end.
