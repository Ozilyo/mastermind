module  MasterMind
  class CodePeg
    attr_accessor :color_code
    
    @@colors = {white: 0, black: 1, red: 2, yellow: 3, blue: 4, brown: 5}


    def self.colors
      @@colors
    end

    def initialize(color='')
      # if @@colors.include?(color.to_s.downcase)
        @color_code = color
      # else
      #   puts "invalid color"
    end
  end
end