# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
require "webmock/minitest"

module Crossrefapi
  class MembersTest < Minitest::Test
    def setup
      @client = Client.new
    end

    def test_all
      endpoint = "/members?query=iucnx"
      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

      response = @client.get(endpoint)

      assert_equal response_body, response
    end

    def test_by_id
      # Use the member ID for IUCN
      endpoint = "/members/1096"

      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

      response = @client.members.by_id(1096)
      assert_equal response_body, response
    end

    def test_by_id_works
      endpoint = "/members/1096/works"

      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

      response = @client.members.by_id_works(1096)
      assert_equal response_body, response
    end
  end
end
