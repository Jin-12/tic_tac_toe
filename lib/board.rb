class Board

def initialize
  @empty_case = ['         ', '         ', '         ']
  @player_1_case = ['   OOO   ','  O   O  ','   OOO   ']
  @player_2_case = ['  XX XX  ','    X    ','  XX XX  ']
  @A_line = [@empty_case, @empty_case, @player_2_case]
  @B_line = [@empty_case, @empty_case, @empty_case]
  @C_line = [@empty_case, @empty_case, @player_1_case]
  @board = [@A_line, @B_line, @C_line]
end

def valid_pos?(pawn_pos)
	pawn_line = pawn_pos.split[0]
	pawn_col = pawn_pos.split[1].to_i - 1
	(0..2).include? pawn_col ? nil : (return false)
	case pawn_line
	when 'A'
		@A_line[pawn_col] == @empty_case ? true : false
	when 'B'
		@B_line[pawn_col] == @empty_case ? true : false
	when 'C'
		@C_line[pawn_col] == @empty_case ? true : false
	else
		return false
	end
end

def return_board
	@board
end
end
