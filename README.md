# 💉 shot

Shot is a microframework designed for fast web development, inspired by Flask and Kemal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  shot:
    github: SeedyROM/shot
```

## Usage

```crystal
require "shot"
```

**That's it!**

## Example
```crystal
require "shot"

get "/" do |ctx|
  ctx.response.puts("Hello world!")
end

Shot.start  # Default to listening on localhost:5000!
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/SeedyROM/shot/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [SeedyROM](https://github.com/SeedyROM) Zack Kollar - creator, maintainer
