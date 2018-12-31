Bundler.require
require_relative "trees/player_tree"
require_relative "entity"

class Level
  PLAYER = "@"
  STATIC = "▒"

  def initialize(level_name)
    @entities = []
    @data = load(level_name)
    register(PLAYER, PlayerTree)
    @speed = 10.0
  end

  def load(level_name)
    file = Bundler.root.join("levels", "#{level_name}.lvl")
    @width = File.open(file, "r").each_line.map { |l| l.chomp.length }.max
    File.open(file, "r").map { |l| l.chomp.ljust(@width) }
  end

  def register(char, tree)
    height.times.each do |y|
      while x = @data[y].index(char)
        @data[y][x] = " "
        @entities << Entity.new(x, y, PLAYER, self, tree)
      end
    end

    return nil
  end

  def height
    @data.length
  end

  def width
    @width
  end

  def run
    loop do
      update
      clear
      draw
      sleep(1/@speed)
    end
  end

  def peek(x, y)
    return nil unless in_bounds?(x, y)
    @data[y][x]
  end

  def in_bounds?(x, y)
    x < width && x >= 0 && y < height && y > 0
  end

  def draw
    puts @buffer
  end

  def update
    @buffer = @data.map{ |l| l.dup }
    update_entities
  end

  def update_entities
    @entities.each do |ent|
      ent.behave
      @buffer[ent.y][ent.x] = ent.view if ent.alive
    end
  end

  def clear
    puts "\e[H\e[2J"
  end
end
