# Chat

This is a app for illustrating the `:gproc` usage according to:

[Process registry in Elixir: A practical example](https://m.alphasights.com/process-registry-in-elixir-a-practical-example-4500ee7c0dcc#.x70gqi1a9)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add chat to your list of dependencies in `mix.exs`:

        def deps do
          [{:chat, "~> 0.0.1"}]
        end

  2. Ensure chat is started before your application:

        def application do
          [applications: [:chat]]
        end

