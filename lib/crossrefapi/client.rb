# frozen_string_literal: true

module Crossrefapi
  # Crossrefapi::Client
  #
  # This class serves as the main entry point for interacting with the CrossRef API.  It delegates to
  # the Crossrefapi::Works and Crossrefapi::Prefixes classes to provide access to the various endpoints
  # available in the CrossRef API.
  #
  # For detailed API documentation, visit:
  # https://api.crossref.org/swagger-ui/index.html#/
  #
  # Example usage:
  #
  #   client = Crossrefapi::Client.new
  #   response = client.works.by_doi('10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en')
  #   pp response
  #
  class Client
    API_BASE = "https://api.crossref.org/"

    attr_reader :works, :prefixes

    def initialize
      @works = Crossrefapi::Works.new(self)
      @prefixes = Crossrefapi::Prefixes.new(self)
    end

    def get(endpoint, query = {})
      uri = build_uri(endpoint, query)

      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body)
      else
        "Error! Status: #{response.code} #{response.body}"
      end
    end

    private

    def build_uri(endpoint, query = {})
      url = "#{API_BASE}#{endpoint}"
      uri = URI.parse(url)
      uri.query = URI.encode_www_form(query) unless query.empty?
      uri
    end
  end
end
