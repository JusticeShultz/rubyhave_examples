class Entity
  attr_accessor :x, :y, :view, :alive

  def initialize(x, y, view, level, tree)
    @x = x
    @y = y
    @view = view
    @alive = true
    @level = level
    @behavior = tree.new(self)
  end

  def behave
    if @alive
      apply_gravity || @behavior.tick
      @alive = @level.in_bounds?(x, y)
    end
  end

  def apply_gravity
    return false if below == Level::STATIC

    # Apply some "gravity"
    self.y += 1
    true
  end

  def left
    look(x - 1, y)
  end

  def right
    look(x + 1, y)
  end

  def below
    look(x, y + 1)
  end

  def above
    look(x, y - 1)
  end

  def look(x, y)
    @level.peek(x, y)
  end
end
