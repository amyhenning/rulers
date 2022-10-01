require "rulers/array"
require "rulers/version"
require "rulers/routing"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      `echo debug > debug.txt`; # Ch 1, exercise 1

      # Temporary way of avoiding errors fetching this static file
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      if env['PATH_INFO'] == '/'
         # Ch 2, exercise 3 - Roots and Routes
         # This establishes a root route (tightly coupled to the best_quotes app for now)
        # klass, act = [Object.const_get('QuotesController'), 'a_quote']
        # controller = klass.new(env)

        # Alterately, could do a redirect like this:
        `echo redirecting > debug.txt` # "log" the redirect
        return [302, {'Location' => 'https://google.com'}, []]
      else
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
      end
      begin # Ch 2, exercise 2 - Debugging exceptions
        text = controller.send(act)
      rescue => e
         # "log" the error
        `echo "Error raised while routing request: #{e}" > debug.txt`
         # presentable error message instead of Rack defaults
        return [500, {'Content-Type' => 'text/html'}, ["Routing Error: #{e}"]]
      end

      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    def initialize(env)
      @env = env

      def env
        @env
      end
    end
  end
end
