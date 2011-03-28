class API
  class Cursor

    attr_reader :object_count
    attr_reader :page_size

    include Enumerable

    def initialize(options)
      @klass      = options[:klass]
      @query_hash = options[:query_hash]
      @response   = options[:response]
      @uri        = options[:uri]

      @objects      = objects(@response)
      meta          = @response['meta']
      @page_size    = meta['limit']
      @object_count = meta['total_count']
    end

    def [](i)
      member_at(i)
    end

    def each
      @object_count.times { |i| yield member_at(i) }
    end

    def empty?
      @object_count == 0
    end

    def first
      member_at(0)
    end

    def last
      member_at(@object_count - 1)
    end

    def length
      @object_count
    end

    def page(page_number)
      page_indices(page_number).map { |i| member_at(i) }
    end

    def size
      @objects.size
    end

    protected

    def fetch_objects_near_index(index)
      response = response_for_index(index)
      fetched = objects(response)
      range = page_indices(page_number)
      range.each_with_index do |i, j|
        @objects[i] = fetched[j]
      end
      fetched.length
    end

    def member_at(index)
      if index < 0
        raise "index (#{index}) must be >= 0"
      end
      cached = @objects[index]
      return nil if @object_count == 0
      return cached if cached
      fetch_objects_near_index(index)
      fetched = @objects[index]
      raise "cannot find find member at index #{index}" unless fetched
      fetched
    end

    def objects(response)
      response['objects'].map { |x| @klass.new(x) }
    end

    def page_indices(page_number)
      min = (page_number - 1) * @page_size
      max = [min + @page_size - 1,  @object_count - 1].min
      (min .. max)
    end

  end
end
