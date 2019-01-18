  class LRUCache
    def initialize(limit)
        @limit = limit
        @cache = []
    end

    def count
        cache.count
      # returns number of elements currently in cache
    end

    def add(el)
      if @cache.include?(el)
        @cache.delete(el)
        @cache << el
      elsif @cache.count >= @limit
        @cache.shift 
        @cache << el 
      else 
        @cache << el 
      end 
    end

    def show
      p @cache
      nil
    end

    private
    # helper methods go here!

  end