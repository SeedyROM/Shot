require "http"
require "http/server"

require "./shot/*"

#
# The Shot module
#
module Shot
  HTTP_VERBS = %i(get post put delete head patch)

  # Build all the router helper functions
  private macro build_route_helpers
    {% for verb in HTTP_VERBS %}
      def {{verb.id}}(path, &block : Router::Callback)
        Router.add({ {{verb}}, path, block })
      end
    {% end %}
  end
  build_route_helpers

  # Start the HTTP server
  def self.start(host = "localhost", port = 5000, silent = false)
    # Configure the handlers
    if !silent
      puts "💉  Listening at #{host}:#{port}..."
      handlers = [
        HTTP::ErrorHandler.new,
        HTTP::LogHandler.new,
        Shot::RouteHandler.new,
      ]
    else
      handlers = [
        HTTP::ErrorHandler.new,
        Shot::RouteHandler.new,
      ]
    end

    # Setup an HTTP::Server and listen
    server = HTTP::Server.new(handlers)
    server.bind_tcp host, port, reuse_port: true
    server.listen
  end
end

# Injected!
include Shot
