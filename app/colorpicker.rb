# Drop in place color picking menu
class ColorPicker
  def initialize
    max = 255
    posx = 100
    posy = 100
    width = 255
    default = 128
    @selected_color = { r: default, g: default, b: default, a: default }

    @a_slider = Slider.new(max: max, pos: { x: posx, y: posy }, width: width, default: default)
    posy += 20
    @g_slider = Slider.new(max: max, pos: { x: posx, y: posy }, width: width, default: default)
    posy += 20
    @b_slider = Slider.new(max: max, pos: { x: posx, y: posy }, width: width, default: default)
    posy += 20
    @r_slider = Slider.new(max: max, pos: { x: posx, y: posy }, width: width, default: default)

    @hex_code = "#888888"
  end

  def tick(args)
    draw = []
    draw.append @r_slider.tick(args)
    draw.append(
      x: @r_slider.pos[:x] - 20, y: @r_slider.pos[:y] + 10, text:'r', primitive_marker: :label
      )
    draw.append @g_slider.tick(args)
    draw.append(
      x: @g_slider.pos[:x] - 20, y: @g_slider.pos[:y] + 10, text:'g', primitive_marker: :label
      )
    draw.append @b_slider.tick(args)
    draw.append(
      x: @b_slider.pos[:x] - 20, y: @b_slider.pos[:y] + 10, text:'b', primitive_marker: :label
      )
    draw.append @a_slider.tick(args)
    draw.append(
      x: @a_slider.pos[:x] - 20, y: @a_slider.pos[:y] + 10, text:'a', primitive_marker: :label
      )

    draw << {x: 640, y: 360, w: 100, h: 100, r: @r_slider.value, g: @g_slider.value, b: @b_slider.value, a: @a_slider.value, primitive_marker: :solid}

    draw << hex_input(args)

    args.outputs.primitives << draw

  end

  def hex_input(args)
    draw = []
    box = args.gtk.calcstringbox("#######")
    width = box[0]
    height = box[1]
    draw << {x: 100, y: 60, w: width, h: height, primitive_marker: :border}
    draw << {x: 100, y: 60, text: "#{@hex_code}", primitve_marker: :label}
    return draw
  end
end
