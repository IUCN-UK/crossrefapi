# frozen_string_literal: true

module Crossrefapi
  class Client
    API_BASE = "https://api.crossref.org/"

    attr_reader :works

    def initialize
      @works = Crossrefapi::Works.new(self)
    end

    def get(endpoint)
      uri = build_uri(endpoint)

      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body)
      else
        "Error! Status: #{response.code} #{response.body}"
      end
    end

    private    

    def build_uri(endpoint)
      url = "#{API_BASE}#{endpoint}"

      URI.parse(url)
    end
  end
end
