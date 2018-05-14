require "http"
require "http/server"

require "./shot/*"

module SHOT
  HTTP_VERBS = [:get, :post, :put, :delete, :head, :patch]

  private macro build_route_helpers
    {% for verb in HTTP_VERBS %}
      def {{verb.id}}(path, &block : Router::Callback)
        Router.add({ {{verb}}, path, block })
      end
    {% end %}
  end

  build_route_helpers

  def self.start(host = "localhost", port = 5000, silent=false)
    puts "Listening at #{host}:#{port}..."
    
    if !silent
      handlers = [
        HTTP::ErrorHandler.new,
        HTTP::LogHandler.new,
        SHOT::RouteHandler.new,
      ]
    else
      handlers = [
        HTTP::ErrorHandler.new,
        SHOT::RouteHandler.new,
      ]
    end

    HTTP::Server.new(host, port, handlers).listen
  end
end
