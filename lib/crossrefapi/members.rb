# frozen_string_literal: true

module Crossrefapi
  # This class serves as the main entry point for interacting with the CrossRef API members endpoints.
  #
  # For detailed API documentation, visit:
  # https://api.crossref.org/swagger-ui/index.html#/Members
  #
  # Example usage:
  #
  #   client = Crossrefapi::Client.new
  #   query = { "query": "red+list" }
  #   response = client.members.all(query)
  #   pp response
  #
  class Members
    def initialize(client)
      @client = client
    end

    def all(query)
      @client.get("members", query)
    end

    def by_id(id)
      @client.get("members/#{id}")
    end

    def by_id_works(id, query = {})
      @client.get("members/#{id}/works", query)
    end
  end
end
