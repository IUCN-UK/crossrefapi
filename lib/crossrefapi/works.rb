# frozen_string_literal: true

module Crossrefapi
  # This class serves as the main entry point for interacting with the CrossRef API prefixes endpoints.
  #
  # For detailed API documentation, visit:
  # https://api.crossref.org/swagger-ui/index.html#/Works
  #
  # Example usage:
  #
  #   client = Crossrefapi::Client.new
  #   response = client.works.by_doi('10.2305/IUCN.UK.2016-1.RLTS.T56003281A22157381.en')
  #   pp response
  #
  class Works
    def initialize(client)
      @client = client
    end

    def all(query)
      @client.get("works", query)
    end

    def by_doi(doi)
      @client.get("works/#{doi}")
    end

    def by_doi_agency(doi)
      @client.get("works/#{doi}/agency")
    end
  end
end
