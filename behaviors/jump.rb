class Jump < Rubyhave::Behavior
  def behave
    entity.x += 3
    entity.y -= 1

    Rubyhave::SUCCESS
  end
end
