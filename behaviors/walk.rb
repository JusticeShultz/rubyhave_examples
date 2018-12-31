class Walk < Rubyhave::Behavior
  def behave
    entity.x += 1

    Rubyhave::SUCCESS
  end
end
