require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if board.over? && board.winner != evaluator
    return false if board.over? && board.winner == evaluator
    queue = [self]
    until queue.empty?
      current_node = queue.shift
      current_node.board.winner == evaluator
    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    moves = []
    (0..2).each do |row_idx|
      (0..2).each do |col_idx|
        pos = [row_idx, col_idx]
        if board.empty?(pos)
          potential_move_board = board.dup
          potential_move_board[pos] = next_mover_mark
          node = self.class.new(potential_move_board, next_mark(next_mover_mark), pos)
          moves << node
        end
      end
    end
    moves
  end

  def next_mark(mark)
    mark == :x ? :o : :x
  end
end
