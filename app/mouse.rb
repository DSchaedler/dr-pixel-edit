# Provides some useful mouse information
class Mouse
  attr_accessor :pos, :moved

  def initialize
    @pos = { x: 640, y: 360 }
    @moved = false
  end

  def tick(args)
    cur_location = { x: args.inputs.mouse.x, y: args.inputs.mouse.y }

    if cur_location != @pos
      @pos = cur_location
      @moved = true
    else
      @moved = false
    end
  end
end
