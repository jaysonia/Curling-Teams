
class Curler
  include Comparable

  attr_reader :name, :proficiency, :desired_pro

  def <=>(obj)
     self.proficiency <=> obj.proficiency
  end

  def initialize(name, pro, des_pro)
    @name = name
    if pro >10 || pro <1
      raise ArgumentError.new("value #{pro} is out of range")
    else
      @proficiency = pro
    end

    if des_pro >10 || des_pro <1
      raise ArgumentError.new("value #{des_pro} is out of range")
    else
      @desired_pro = des_pro
    end

  end

  def to_s
    "#{@name}'s proficiency is #{@proficiency}. Seeks partner with a proficiency >= #{@desired_pro}"
  end
end