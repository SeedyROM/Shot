require "http"
require "http/server"

require "./shot/*"

module Shot
  HTTP_VERBS = [:get, :post, :put, :delete, :head, :patch]

  private macro build_route_helpers
    {% for verb in HTTP_VERBS %}
      def {{verb.id}}(path, &block : Router::Callback)
        Router.add({ {{verb}}, path, block })
      end
    {% end %}
  end

  build_route_helpers

  def self.start(host = "localhost", port = 5000, silent = false)
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

    server = HTTP::Server.new(handlers)
    server.bind_tcp host, port, reuse_port: true
    server.listen
  end
end

include Shot
