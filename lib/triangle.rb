class Triangle
  
  attr_reader :side_1, :side_2, :side_3

  def initialize(side_1,side_2,side_3) 
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    @side_1.is_a?(Integer) ? s1 = @side_1 : s1 = @side_1 * 10
    @side_2.is_a?(Integer) ? s2 = @side_2 : s2 = @side_2 * 10
    @side_3.is_a?(Integer) ? s3 = @side_3 : s3 = @side_3 * 10

    triangle_sides = [s1,s2,s3]
    sides_attr = triangle_sides.combination(2).to_a
    sides_attr = sides_attr.map{|s| s.reduce(:*)}
    b = []

    sides_attr.each{|s|
      triangle_sides.each{|t|
        if(s>t)
          b << true
        else
          b << false
        end
      }
    }

    if !b.all?{|a| a==true}
        raise TriangleError
    elsif triangle_sides.all? { |a|  a == triangle_sides[0]}
      :equilateral
    elsif triangle_sides.combination(2).any? { |a,b|  a == b}
      :isosceles
    elsif triangle_sides.combination(2).none? { |a,b|  a == b}
      :scalene
    end

  end

  class TriangleError < StandardError
    #def message
     # "Triangle is illegal"
     # end
  end
end










