require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"

module Rulers
  class Application
    def call(env)
      if env["PATH_INFO"] == '/favicon.ico'
        return [404,
          {'Content-Type' => 'text/html'}, []]
      elsif env["PATH_INFO"] == '/'
        controller = QuotesController.new(env)
        act = 'a_quote'
      else
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
      end
      begin
        text = controller.send(act)
        [200, {'Content-Type' => 'text/html'}, [text]]
      rescue Exception => error
        [500, {'Content-Type' => 'text/html'}, ["Boohoo, an error occurred: #{error}"]]
      end
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
