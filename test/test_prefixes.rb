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

      response_body = { "status" => "ok" }.to_json

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body)

      response = @client.prefixes.by_prefix("10.2305")
      assert_equal JSON.parse(response_body), response
    end

    # def test_by_prefix_works
    #   endpoint = "prefixes/10.2305/works"
    #   response_body = { "status" => "ok" }.to_json

    #   stub_request(:get, "https://api.crossref.org/#{endpoint}")
    #     .to_return(status: 200, body: response_body)

    #   query = { "query.container-title" => "IUCN Red List of Threatened Species", "offset" => "9980" }

    #   response = @client.works.by_prefix_works("10.2305", query)
    #   assert_equal JSON.parse(response_body), response
    # end
  end
end
