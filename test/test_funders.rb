# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
require "webmock/minitest"

module Crossrefapi
  class FundersTest < Minitest::Test
    def setup
      @client = Client.new
    end

    def test_all
      endpoint = "funders?query=nerc"

      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { 'Content-Type' => 'application/json' })

      response = @client.funders.all({ "query" => "nerc" })
      assert_equal response_body, response
    end

    def test_by_id
      endpoint = "funders/100008668"

      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { 'Content-Type' => 'application/json' })

      response = @client.funders.by_id("100008668")
      assert_equal response_body, response
    end

    def test_by_id_works
      endpoint = "funders/100008668/works"

      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { 'Content-Type' => 'application/json' })

      response = @client.funders.by_id_works("100008668")
      assert_equal response_body, response
    end
  end
end
