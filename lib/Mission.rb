#
# Create your "Mission" class in this file.
#

class Mission
  
  #Constructor
  def initialize input_file = nil
    @file = input_file.split
    @x = 0
    @y = 0
    @face = "N"
    @maxX = 0
    @maxY = 0
    @roverCount = 1
    @more = true
  end

  #Main function to call
  def rover_positions_as_string
    @maxX = @file[0]
    @maxY = @file[1]
    while @more

      set_initial_position
      move_rover(@file[1 + 4 * @roverCount])
      puts "#{@x} #{@y} #{@face}"
      if @file[6 + 3 * @roverCount] == nil
        @more = false
      else
        @roverCount = @roverCount + 1
      end
    end  
  end
   
  #Movement
  def move_rover movement
    movement.chars.each do |move|
      case move
        when 'L'
          turn_left
        when 'R'
          turn_right
        when 'M'
          move_forward
        else
          p "Dont make stuff up"
      end
    end
  end
   
  def turn_left
    case @face
      when "N"
        @face = 'W'
      when "S"
        @face = 'E'
      when "E"
        @face = 'N'
      when "W"
        @face = 'S'
    end
  end
   
  def turn_right
    case @face
      when "N"
        @face = 'E'
      when "S"
        @face = 'W'
      when "E"
        @face = 'S'
      when "W"
        @face = 'N'
    end
  end
      
  def move_forward
    case @face
      when "N"
        @y = @y + 1
      when "S"
        @y = @y - 1
      when "E"
        @x = @x + 1
      when "W"
        @x = @x - 1
    end
  end
   
  def set_initial_position
    @x = @file[2 + 4 * (@roverCount - 1)].to_i
    @y = @file[3 + 4 * (@roverCount - 1)].to_i
    @face = @file[4 + 4 * (@roverCount - 1)]
  end
end