require "spec_helper"

class TestController < Rulers::Controller # Ch 4. ex 1
  def index
    "Hello!"
  end
end

class TestApp < Rulers::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

describe Rulers::Application do
  include Rack::Test::Methods

  let(:app) { TestApp.new }

  it "returns an ok response for specific requests" do
    get "/test/index"
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Hello!")
  end

  it "redirects to Google on the root path" do
    get "/"

    expect(last_response.status).to eq(302)
    expect(last_response.headers).to include({"Location" => "https://google.com"})
  end
end
