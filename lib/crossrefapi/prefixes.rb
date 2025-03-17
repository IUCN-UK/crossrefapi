# frozen_string_literal: true

module Crossrefapi
  # This class serves as the main entry point for interacting with the CrossRef API prefixes endpoints.
  #
  # For detailed API documentation, visit:
  # https://api.crossref.org/swagger-ui/index.html#/Prefixes/
  #
  # Example usage:

  #   client = Crossrefapi::Client.new
  #   response = client.prefixes.by_prefix('10.2305')
  #   pp response
  #
  #   client = Crossrefapi::Client.new
  #   query = { 'query.container-title' => 'IUCN Red List of Threatened Species', 'offset' => '9980' }
  #   response = client.prefixes.by_prefix_works('10.2305', query)
  #   pp response
  #
  class Prefixes
    def initialize(client)
      @client = client
    end

    def by_prefix(prefix)
      @client.get("prefixes/#{prefix}")
    end

    def by_prefix_works(prefix, query = {})
      @client.get("prefixes/#{prefix}/works", query)
    end
  end
end
