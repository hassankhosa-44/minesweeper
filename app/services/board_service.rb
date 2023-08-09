class BoardService

  def self.generate_board(width, height, mines)
    board = Array.new(height) { Array.new(width) { 0 } }

    mines_left = mines
    while mines_left > 0
      x = rand(width)
      y = rand(height)

      next if board[y][x] == "M"

      board[y][x] = "M"
      mines_left -= 1

      update_adjacent_cells(board, x, y, width, height) unless mines_left.zero?
    end

    board
  end

  private

  def self.update_adjacent_cells(board, x, y, width, height)
    ((y - 1)..(y + 1)).each do |row|
      ((x - 1)..(x + 1)).each do |col|
        next if row < 0 || row >= height || col < 0 || col >= width

        board[row][col] += 1 unless board[row][col] == "M"
      end
    end
  end
end