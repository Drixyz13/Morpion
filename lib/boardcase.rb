class BoardCase
  attr_accessor :value, :id

  def initialize(id)
    @id = id        # Ex: "A1"
    @value = " "    # Valeur par défaut
  end

  def to_s
    @value
  end

  def empty?
    @value == " "
  end

  def play(symbol)
    if empty?
      @value = symbol
      true
    else
      false
    end
  end
end
