# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
require "webmock/minitest"

module Crossrefapi
  class LicensesTest < Minitest::Test
    def setup
      @client = Client.new
    end

    def test_all
      endpoint = "licenses?query=red%2Blist"

      response_body = { "status" => "ok" }.to_json

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body)

      response = @client.licenses.all({ "query" => "red+list" })
      assert_equal JSON.parse(response_body), response
    end
  end
end
