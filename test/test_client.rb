# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
require "webmock/minitest"

module Crossrefapi
  class ClientTest < Minitest::Test
    def setup
      @client = Client.new
    end

    def test_initialize
      assert_instance_of Crossrefapi::Works, @client.works
    end

    def test_get_success
      endpoint = "/works/10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en"
      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org#{endpoint}")
        .to_return(
          status: 200,
          body: response_body.to_json,
          headers: { "Content-Type" => "application/json" }
        )

      response = @client.get(endpoint)

      assert_equal response_body, response
    end

    def test_get_failure
      endpoint = "works/invalid"
      response_body = "Not Found"

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 404, body: response_body)

      response = @client.get(endpoint)
      assert_equal "Error! Status: 404 #{response_body}", response
    end
  end
end
