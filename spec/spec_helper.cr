require "spec"
require "http/client"
require "../src/shot"
require "./test_routes"

spawn { Shot.start(silent: true) }
Fiber.yield