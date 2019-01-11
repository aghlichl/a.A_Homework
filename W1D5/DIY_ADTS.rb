  class Stack
    def initialize
      @stack = []
    end

    def push(el)
      @stack.push(el)
      el
    end

    def pop
      @stack.pop
    end

    def peek
      @stack.last
    end
  end


    class Queue
    def initialize
      @queue = []
    end

    def enqueue(el)
      @queue.push(el)
    end

    def dequeue
      @queue.shift
    end

    def peek
      @queue.first
    end
  end


  class Map
    def initialize
        @map = []
    end

    def set(key,value)
        pair_idx = map.index{|pair| pair.first==key}
        if pair_idx
            map[pair_idx][1]=value
        else 
            map.push([key,value])
        end 
        value 
    end 

    def get(key)
        map.each{|pair| return pair[1] if pair.first == key}
        nil
    end 

    def delete(key)
        value = get(key)
        map.reject!{|pair|pair.first == key}
        value
    end 

    def show
        deep_dup(map)
    end 

    private 

    attr_reader :map

    def deep_dup(map)
      map.map {|el| el.is_a?(Array) ? deep_dup(el) : el}
    end 
  end 


