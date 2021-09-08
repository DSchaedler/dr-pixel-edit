# Abstracted drawing handler
module Draw
  # Create a layer queue for primitives
  class ZHandler
    attr_accessor :layers, :debug_layer

    def initialize
      # layers = [[{}, {}, {},], [{}, {}, {}]]
      @layers = []
      @debug_layer = []
    end

    def tick(args)
      args.outputs.primitives << @layers
      @layers.each(&:clear)

      args.outputs.debug << @debug_layer
      @debug_layer.clear
    end
  end
end

Draw.extend Draw
