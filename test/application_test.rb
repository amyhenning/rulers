require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"

    puts last_response.inspect
    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  def test_does_not_delete
    delete "/stuff"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end
end
