require File.expand_path('../base', __FILE__)

class API
  class Project
    PATH = "projects"

    def self.all
      find_
    end

    # options = {
    #   :start      => 100,
    #   :batch_size => 100
    # }
    def self.find_each(options)
      offset = options[:start]      ? options[:start] : 0
      limit  = options[:batch_size] ? options[:limit] : 20
      response = Base.get("#{PATH}", { :offset => offset, :limit => limit })
      # INCOMPLETE
      response["objects"].each do |object|
        yield object
      end
    end

    def self.find(primary_key)
      Base.get("#{PATH}/#{primary_key}")
    end

  end
end
