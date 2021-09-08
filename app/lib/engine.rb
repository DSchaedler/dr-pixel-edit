# Engine Methods

def randr(min, max)
  rand(max - min + 1) + min
end

def hex_to_rgb(hexstring)
  hexstring.delete('#').split('').each_slice(2).map { |e| e.join.to_i(16) }
end

def gaussian(mean, stddev) # rubocop:disable Metrics/AbcSize
  theta = 2 * Math::PI * rand
  rho = Math.sqrt(-2 * Math.log(1 - rand))
  scale = stddev * rho
  [mean + scale * Math.cos(theta), mean + scale * Math.sin(theta)]
end

# Custom Console Buttons

# Append the Engine Console Class
class GTK::Console::Menu # rubocop:disable Style/ClassAndModuleChildren
  def custom_buttons
    [
      (button id: :reset_app, row: 4, col: 10,
              text: 'Reset $app', method: :reset_app_clicked),
      (button id: :rubocop, row: 4, col: 9,
              text: 'rubocop -a', method: :rubocop_button_clicked),
      (button id: :clear_console, row: 4, col: 8,
              text: 'Clear Console', method: :clear_console_button_clicked)
    ]
  end

  def reset_app_clicked
    $app = nil # rubocop:disable Style/GlobalVars
    $gtk.reset # rubocop:disable Style/GlobalVars
  end

  def rubocop_button_clicked
    puts 'Starting rubocop...'
    $gtk.args.gtk.system 'rubocop -a' # rubocop:disable Style/GlobalVars
  end

  def clear_console_button_clicked
    $gtk.console.clear # rubocop:disable Style/GlobalVars
  end
end
