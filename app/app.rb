# Main file for the application

module PE
  # Application instance class
  class App
    def initialize
      @z_leveler = Draw::ZHandler.new
      @mouse = Mouse.new
      @color_picker = ColorPicker.new

      @frames = []
      @current_frame_index = nil
      @edit_mode = nil
    end

    def tick(args)
      args.outputs.background_color = [255, 255, 255]

      @mouse.tick(args)

      @color_picker.tick(args)
    end
  end
end
