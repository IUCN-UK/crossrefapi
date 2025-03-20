# frozen_string_literal: true

module Crossrefapi
  # This class serves as the main entry point for interacting with the CrossRef API journals endpoints.
  #
  # For detailed API documentation, visit:
  # https://api.crossref.org/swagger-ui/index.html#/Journals
  #
  # Example usage:
  #
  #   client = Crossrefapi::Client.new
  #   query = { "query": "red+list" }
  #   response = client.journals.all(query)
  #   pp response
  #
  class Journals
    def initialize(client)
      @client = client
    end

    def all(query)
      @client.get("journals", query)
    end

    def by_issn(issn)
      @client.get("journals/#{issn}")
    end

    def by_issn_works(issn)
      @client.get("journals/#{issn}/works")
    end
  end
end