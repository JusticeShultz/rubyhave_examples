Dir[File.expand_path("../behaviors/*.rb", __dir__)].each { |file| require file }

class PlayerTree < Rubyhave::Selector
  def initialize(entity)
    super

    jump = WillFall.new(entity)
    jump.add_child(Jump.new(entity))

    add_child(jump)
    add_child(Walk.new(entity))
  end
end
