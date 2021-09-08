# Re-useable slider construct
class Slider
  attr_accessor :value, :pos, :max, :width
  def initialize(max: 255, pos:, width:, default:)
    @value = default

    @max = max
    @pos = pos
    @width = width
  end

  def tick(args)
    draw = []

    draw.append(
      x: @pos[:x], y: @pos[:y], x2: @pos[:x] + @width, y2: @pos[:y],
      primitive_marker: :line
    )

    value_percent = @value / @max
    line_position = value_percent * @width
    real_position = line_position + @pos[:x]

    draw.append(
      x: real_position, y: @pos[:y] - 5, x2: real_position, y2: @pos[:y] + 5,
      primitive_marker: :line
    )

    draw.append(
      x: @pos[:x] + @width, y: @pos[:y] + 10, text: @value.to_s, primitive_marker: :label
    )

    if args.inputs.mouse.button_left
      if @pos[:x] <= args.inputs.mouse.x && args.inputs.mouse.x <= @pos[:x] + @width
        if @pos[:y] - 5 <= args.inputs.mouse.y && args.inputs.mouse.y <= @pos[:y] + 5
          line_position = args.inputs.mouse.x - @pos[:x]
          value_percent = line_position / @width
          @value = (value_percent * @max).to_i
        end
      end
    end

    draw
  end
end
