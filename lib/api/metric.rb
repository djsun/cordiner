require File.expand_path('../base', __FILE__)

class API
  class Metric
    PATH = "metrics"

    def self.all
      Base.get("#{PATH}")["objects"]
    end

    def self.find(id)
      Base.get("#{PATH}/#{id}")
    end

  end
end
