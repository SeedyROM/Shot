require "spec"
require "http/client"
require "../src/shot"
require "./test_routes"

spawn { SHOT.start(silent: true) }
Fiber.yield