require File.expand_path('../base', __FILE__)

class API
  class Observation
    PATH = "observations"

    def self.all
      Base.get("#{PATH}")["objects"]
    end

    def self.find(id)
      Base.get("#{PATH}/#{id}")
    end

  end
end
