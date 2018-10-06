require "spec"
require "http/client"

# ============================================================
# TODO: Fix this nonsense with a module to handle the spawning
# ============================================================
# Inject the Shot module into the current scope
require "../src/shot"

# Load our test routes
require "./test_routes"
# ========
# END TODO
# ========

# Spawn an instance of Shot in a Fiber to test the binary instead of mocks
spawn { Shot.start(silent: true) }
Fiber.yield
