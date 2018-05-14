require "http"
require "http/server"

module SHOT
    class Router
        alias Callback = Proc(HTTP::Server::Context, Nil)
        alias Route = Tuple(Symbol, String, Callback)

        @@routes = [] of Route 
        
        def self.routes
            @@routes
        end
        def self.add(route)
            @@routes << route
        end
    end

    class RouteHandler
        include HTTP::Handler

        def call(context)
            Router.routes.map do |route|
                incoming_route = {
                    context.request.method.downcase,
                    context.request.path,
                }
                if incoming_route == { route[0].to_s, route[1] }
                    route[2].call(context)
                    return
                end
            end
            call_next(context)
        end
    end
end