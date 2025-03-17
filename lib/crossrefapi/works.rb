module Crossrefapi
  class Works
    def initialize(client)
      @client = client
    end

    def by_doi(doi)
      @client.get("works/#{doi}")
    end

    def by_doi_agency(doi)
      @client.get("works/#{doi}/agency")
    end
  end
end
