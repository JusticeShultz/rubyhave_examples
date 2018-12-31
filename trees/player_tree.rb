Dir[File.expand_path("../behaviors/*.rb", __dir__)].each { |file| require file }

class PlayerTree < Rubyhave::Tree
  def initialize(entity)
    super

    sel = add_child(Rubyhave::Selector.new)

    sel.add_child(WillFall.new).add_child(Jump.new)
    sel.add_child(Walk.new)
  end
end
