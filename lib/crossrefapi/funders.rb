# frozen_string_literal: true

module Crossrefapi
  # This class serves as the main entry point for interacting with the CrossRef API funders endpoints.
  #
  # For detailed API documentation, visit:
  # https://api.crossref.org/swagger-ui/index.html#/Funders
  #
  # Example usage:
  #
  #   client = Crossrefapi::Client.new
  #   query = { "query": "red+list" }
  #   response = client.funders.all(query)
  #   pp response
  #
  class Funders
    def initialize(client)
      @client = client
    end

    def all(query)
      @client.get("funders", query)
    end

    def by_id(id)
      @client.get("funders/#{id}")
    end

    def by_id_works(id)
      @client.get("funders/#{id}/works")
    end
  end
end
