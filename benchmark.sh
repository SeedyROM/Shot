#!/bin/bash

echo 'require "./src/shot"

get "/" do |ctx|
    ctx.response.puts("Hello I am working here!")
end

Shot.start(silent: true)
' > benchmark.cr

crystal build --release benchmark.cr && (./benchmark &)

wrk -c 100 -d 20 http://localhost:5000

[[ -z "$(jobs -p)" ]] || kill $(jobs -p)
rm benchmark.cr benchmark