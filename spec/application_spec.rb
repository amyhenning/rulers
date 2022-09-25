require "spec_helper"

class TestApp < Rulers::Application
end

describe Rulers::Application do
  include Rack::Test::Methods

  let(:app) { TestApp.new }

  it "returns an ok response for GET requests" do
    get "/"

    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Hello from Ruby on Rulers")
  end

  it "returns an ok response for POST requests" do
    post "/foo"

    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Hello from Ruby on Rulers")
  end
end
