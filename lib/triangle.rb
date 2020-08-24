class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    valid_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def valid_triangle
    if a + b > c && a + c > b && b + c > a && [a,b,c].all? {|s| s >= 0}
      true
    else 
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    def message
      "invalid triangle"
    end
  end
end
