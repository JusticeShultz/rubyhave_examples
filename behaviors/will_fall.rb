class WillFall < Rubyhave::Condition
  def evaluate
    entity.look(entity.x + 1, entity.y + 1) != Level::STATIC
  end
end
