require_relative 'Curler.rb'

class Agency
  attr_reader :men, :women

  def initialize(men = [], women =[])
    @men = men
    @women = women
  end

  def load_men(filename)
    i=0
    begin
      IO.foreach(filename) do |line|
        temp = line.split
        if temp.size == 3
          @men[i] = Curler.new(temp[0].to_s, temp[1].to_i, temp[2].to_i)
          i += 1
        end
      end
    rescue Exception => msg
      'file does not exist'
    end
  end

  def load_women(filename)
    i=0
    begin
      IO.foreach(filename) do |line|
        temp = line.split
        if temp.size == 3
          @women[i] = Curler.new(temp[0].to_s, temp[1].to_i, temp[2].to_i)
          i += 1
        end
      end
    rescue Exception => msg
      'file does not exist'
    end
  end

  def print
    puts 'MALE CURLERS:'
    @men.each do |this|
      puts this.to_s
    end
    puts 'FEMALE CURLERS:'
    @women.each do |this|
      puts this.to_s
    end
  end

  def create_teams
    @men.sort!
    @women.sort!
  end

  def teams_to_s
    string = ''
    for i in 0..@men.size-1
      string << "(#{@women[i].name}, #{@men[i].name}) Satisfaction: #{self.satisfaction(@men[i],@women[i])}\n"
    end
    string
  end

  def satisfaction (male, female)
    if male.proficiency < female.desired_pro
      female_sat = male.proficiency - female.desired_pro
    else
      female_sat = 0
    end
    if female.proficiency < male.desired_pro
      male_sat = female.proficiency - male.desired_pro
    else
      male_sat =0
    end

    (female_sat+male_sat).to_f/2.0
  end

  def each_curler
    0.upto(@men.size-1) do |i|
      yield @men[i]
    end
    0.upto(@women.size-1) do |i|
      yield @women[i]
    end
  end

  def first_ascent
    satis = 0
    for i in 0..@men.size-1
      satis += self.satisfaction(@men[i],@women[i])
    end
    count = 0
    i =0
    while i<@men.size
      x=i+1
      while x <@men.size
        #swap men
        temp_store = @men[x]
        @men[x] = @men[i]
        @men[i] = temp_store
        temp_satis = 0

        for t in 0..@men.size-1
          temp_satis += self.satisfaction(@men[t],@women[t])
        end
        if temp_satis > satis
          satis = temp_satis
          #set i to -1 so it hits 0 after next increment
          i=-1
          break
        else
          #swap back
          @men[i] = @men[x]
          @men[x] = temp_store
          x+=1
        end
      end
      i+=1
    end
  end
end