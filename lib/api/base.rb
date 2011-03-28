class API
  class Base

    HOST = Cordiner::Application.config.api[:host]
    KEY  = Cordiner::Application.config.api[:key]
    HEADERS = {
      "X-APIKEY" => KEY,
      "Accept"   => "application/json"
    }

    # Common params include 'offset' and 'limit'.
    #
    # For example:
    #   {
    #     :offset => 10,
    #     :limit  => 10
    #   }
    def self.get(path, params = {})
      hash = { :params => params }.merge(HEADERS)
      JSON.parse(RestClient.get(url(path), hash))
    end

    def self.url(path)
      URI.join(HOST, path).to_s
    end

    # def self.get_batch(path, offset, limit)
    #   get(path, { :offset => offset, :limit => limit })
    # end

  end
end
