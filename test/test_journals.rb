# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
require "webmock/minitest"

module Crossrefapi
  class JournalsTest < Minitest::Test
    def setup
      @client = Client.new
    end

    def test_all
      endpoint = "journals?query=conservation"

      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

      response = @client.journals.all({ "query" => "conservation" })
      assert_equal response_body, response
    end

    def test_by_issn
      # Use the Online ISSN for the journal "Conservation Biology"
      endpoint = "journals/1523-1739"

      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

      response = @client.journals.by_issn("1523-1739")
      assert_equal response_body, response
    end

    def test_by_issn_works
      endpoint = "journals/1523-1739/works"

      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

      response = @client.journals.by_issn_works("1523-1739")
      assert_equal response_body, response
    end
  end
end
