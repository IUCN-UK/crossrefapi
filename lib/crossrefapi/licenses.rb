# frozen_string_literal: true

module Crossrefapi
  # This class serves as the main entry point for interacting with the CrossRef API licences endpoints.
  #
  # For detailed API documentation, visit:
  # https://api.crossref.org/swagger-ui/index.html#/Licenses
  #
  # Example usage:
  #
  #   client = Crossrefapi::Client.new
  #   query = { "query": "red+list" }
  #   response = client.licenses.all(query)
  #   pp response
  #
  class Licenses
    def initialize(client)
      @client = client
    end

    def all(query)
      @client.get("licenses", query)
    end
  end
end
