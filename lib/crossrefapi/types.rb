# frozen_string_literal: true

module Crossrefapi
  # This class serves as the main entry point for interacting with the CrossRef API types endpoints.
  #
  # For detailed API documentation, visit:
  # https://api.crossref.org/swagger-ui/index.html#/Types
  #
  # Example usage:
  #
  #   client = Crossrefapi::Client.new
  #   query = { "query": "red+list" }
  #   response = client.types.all(query)
  #   pp response
  #
  class Types
    def initialize(client)
      @client = client
    end

    def all(query)
      @client.get("types", query)
    end

    def by_id(id)
      @client.get("types/#{id}")
    end

    def by_id_works(id, query = {})
      @client.get("types/#{id}/works", query)
    end
  end
end
