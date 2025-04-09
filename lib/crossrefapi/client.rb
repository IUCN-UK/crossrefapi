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

    RESOURCES = %w[funders journals licenses members prefixes types works].freeze

    def initialize
      @connection = initialize_connection
    end

    RESOURCES.each do |resource|
      define_method(resource) do
        setup_resource(resource)
      end
    end

    def get(endpoint, query = {})
      response = @connection.get(endpoint, query)

      if response.success?
        response.body
      else
        "Error! Status: #{response.status} #{response.body}"
      end
    end

    private

    def setup_resource(resource)
      instance_variable_get("@#{resource}") ||
        instance_variable_set(
          "@#{resource}", Object.const_get("Crossrefapi::#{resource.capitalize}").new(self)
        )
    end

    def initialize_connection
      Faraday.new(url: API_BASE) do |connection|
        connection.response :json
      end
    end
  end
end
