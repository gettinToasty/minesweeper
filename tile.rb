class Tile
  attr_reader :is_bomb, :revealed, :flagged
  attr_accessor :fringe_val, :pos

  def initialize(is_bomb = false)
    @is_bomb = is_bomb
    @flagged = false
    @revealed = false
    @fringe_val = 0
    @pos = nil
  end

  def reveal
    @revealed = true
  end

  def to_s
    return "🚩" if @flagged
    return "⬛️" unless @revealed
    return "☠️" if @is_bomb
    case @fringe_val
    when 0 then "⬜️"
    when 1 then "1️⃣"
    when 2 then "2️⃣"
    when 3 then "3️⃣"
    when 4 then "4️⃣"
    when 5 then "5️⃣"
    when 6 then "6️⃣"
    when 7 then "7️⃣"
    when 8 then "8️⃣"
    end
  end

  def flag
    @flagged = !@flagged
  end

  def neighbors
    x, y = @pos
    [[x - 1, y - 1], [x - 1, y], [x - 1, y + 1], [x, y + 1],
     [x + 1, y + 1], [x + 1, y], [x + 1, y - 1], [x, y - 1]]
  end

  def is_neighbor?(tile)
    neighbors.include?(tile.pos)
  end

end
