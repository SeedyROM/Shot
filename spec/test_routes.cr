# Test Initial DSL
get "/hello" do |ctx|
  ctx.response.puts("Hello world!")
end

post "/comment" do |ctx|
  ctx.response.status_code = 201
  ctx.response.puts("Success")
end
