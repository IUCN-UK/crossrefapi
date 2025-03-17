# frozen_string_literal: true

module Crossrefapi
  class Client
    API_BASE = "https://api.crossref.org/works"

    def initialize
      @http = Net::HTTP
    end

    def fetch_doi(doi)
      uri = URI("#{API_BASE}/#{doi}")
      response = @http.get(uri)
      JSON.parse(response)
    end
  end
end
