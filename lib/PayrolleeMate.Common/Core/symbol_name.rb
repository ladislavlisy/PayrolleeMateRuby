module Payrollee_Common

  class SymbolName
    attr_reader :code
    attr_reader :name

    def initialize(code, name)
      @code = code
      @name = name
    end

    def ==(other)
      @code == other.code
    end

    def <=>(other)
      @code <=> other.code
    end

    def <(other)
      @code < other.code
    end

    def >(other)
      @code > other.code
    end

    def eql?(other)
      @code == other.code
    end

    def hash
      @code.hash
    end

    def to_s
      @code.to_s
    end

  end

end