# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
require "webmock/minitest"

module Crossrefapi
  class PrefixesTest < Minitest::Test
    def setup
      @client = Client.new
    end

    def test_by_prefix
      endpoint = "prefixes/10.2305"

      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

      response = @client.prefixes.by_prefix("10.2305")
      assert_equal response_body, response
    end

    def test_by_prefix_works
      endpoint = "prefixes/10.2305/works"
      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org/#{endpoint}?offset=9980&query.container-title=IUCN%20Red%20List%20of%20Threatened%20Species")
        .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

      query = { "query.container-title" => "IUCN Red List of Threatened Species", "offset" => "9980" }

      response = @client.prefixes.by_prefix_works("10.2305", query)
      assert_equal response_body, response
    end
  end
end
