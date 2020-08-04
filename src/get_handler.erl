-module('get_handler').
-export([start/1]).


start(Req)->

	"/" ++ Path = mochiweb_request : get ( path , Req ),
		case Path of 
			"hello"->
		        QueryStringData = Req:parse_qs(),
		        Firstname = proplists:get_value("firstname", QueryStringData, "NA"),
		        Lastname = proplists:get_value("lastname", QueryStringData, "NA"),
		        Req:respond({200, [{"Content-Type", "text/plain"}],
		                       "Hello " ++ Firstname ++ " " ++ Lastname ++ "!\n"});
				% QueryStringData = Req:parse_qs(),
				% Username = proplists:get_value("username", QueryStringData, "Anonymous"),
				% {ok, HTMLOutput} = greeting_dtl:render([{username, Username}]),
				% Req:respond({200, [{"Content-Type", "text/html"}],
				%         HTMLOutput});
		     _ ->
		     	Req:respond({200, [{"Content-Type", "text/plain"}],
		                       "Path not found"})
		end.
