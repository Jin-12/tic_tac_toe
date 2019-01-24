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

def return_board
	@board
end
end
