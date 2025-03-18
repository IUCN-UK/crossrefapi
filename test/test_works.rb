# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
require "webmock/minitest"

module Crossrefapi
  class WorksTest < Minitest::Test
    def setup
      @client = Client.new
    end

    def test_all
      endpoint = "works?query=red+list"

      response_body = { "status" => "ok" }.to_json

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body)

      response = @client.works.all({'query' => 'red+list'})
      assert_equal JSON.parse(response_body), response
    end

    def test_by_doi
      endpoint = "works/10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en"

      response_body = { "status" => "ok" }.to_json

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body)

      response = @client.works.by_doi("10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en")
      assert_equal JSON.parse(response_body), response
    end

    def test_by_doi_agency
      endpoint = "works/10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en/agency"

      response_body = { "status" => "ok" }.to_json

      stub_request(:get, "https://api.crossref.org/#{endpoint}")
        .to_return(status: 200, body: response_body)

      response = @client.works.by_doi_agency("10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en")
      assert_equal JSON.parse(response_body), response
    end
  end
end
