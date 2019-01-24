#frozen_string_litteral: true

class Board

# Right at the new board creation we set the cases style and board structure
	def initialize
		@empty_case = ['         ', '         ', '         ']
		@player_1_case = ['   OOO   '.light_blue,'  O   O  '.light_blue,'   OOO   '.light_blue]
		@player_2_case = ['  XX XX  '.green,'    X    '.green,'  XX XX  '.green]
		@A_line = [@empty_case, @empty_case, @empty_case]
		@B_line = [@empty_case, @empty_case, @empty_case]
		@C_line = [@empty_case, @empty_case, @empty_case]
		@board = [@A_line, @B_line, @C_line]
	end

# Called to verify is the choosen pos is valid or no returning true if u can
# play there and false ether way
	def valid_pos?(pawn_pos)
		# pawn_pos is the string from method get so we split the letter from
		# the number to use them as location variables (vertical and horizontal)
		pawn_line = pawn_pos.split[0]
		pawn_col = pawn_pos.split[1].to_i - 1
		# Is this inside the board
		[0, 1, 2].include?(pawn_col) ? nil : (return false)
		# Is the case occupied
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

# Update the board with curent player's pawn style defined by 0 for player one
# and 1 for player two in params
	def board_update(pawn_pos, cur_player)
		# Same split as earlier
		pawn_line = pawn_pos.split[0]
		pawn_col = pawn_pos.split[1].to_i - 1
		case cur_player
		when 0
			pawn_style = @player_1_case
		when 1
			pawn_style = @player_2_case
		end
		case pawn_line
		when 'A'
			@A_line[pawn_col] = pawn_style
		when 'B'
			@B_line[pawn_col] = pawn_style
		when 'C'
			@C_line[pawn_col] = pawn_style
		end
		@board = [@A_line, @B_line, @C_line]
	end

	def end?
		# Check win possibilities before checking for fully filled board returns 0
		# for a non-ended game, 1 for a player's win and 2 for a draw
		(0..2).each { |i| check_line(i, 0) ? (return 1) : 0 } # For each line check columns
		(0..2).each { |i| check_column(0, i) ? (return 1) : 0 }
		check_descending_diagonal(0, 0) ? (return 1) : 0
		check_ascending_diagonal(2, 0) ? (return 1) : 0
		full_board? ? (return 2) : 0
	end

	def return_board
		@board
	end

	private

	def full_board?
		(0..2).each do |cur_line|
			@board[cur_line][0] == @empty_case ? (return false) : true
			@board[cur_line][1] == @empty_case ? (return false) : true
			@board[cur_line][2] == @empty_case ? (return false) : true
		end
	end

	def check_line(cur_line, cur_col)
		@board[cur_line][cur_col] == @empty_case ? (return false) : nil
		if @board[cur_line][cur_col] == @board[cur_line][cur_col + 1]
			@board[cur_line][cur_col] == @board[cur_line][cur_col + 2] ? true : false
		else
			false
		end
	end

	def check_column(cur_line, cur_col)
		@board[cur_line][cur_col] == @empty_case ? (return false) : nil
		if @board[cur_line][cur_col] == @board[cur_line + 1][cur_col]
			@board[cur_line][cur_col] == @board[cur_line + 2][cur_col] ? true : false
		else
			false
		end
	end

	def check_descending_diagonal(cur_line, cur_col)
		@board[cur_line][cur_col] == @empty_case ? (return false) : nil
		if @board[cur_line][cur_col] == @board[cur_line + 1][cur_col + 1]
			@board[cur_line][cur_col] == @board[cur_line + 2][cur_col + 2] ? true : false
		else
			false
		end
	end

	def check_ascending_diagonal(cur_line, cur_col)
		@board[cur_line][cur_col] == @empty_case ? (return false) : nil
		if @board[cur_line][cur_col] == @board[cur_line - 1][cur_col + 1]
			@board[cur_line][cur_col] == @board[cur_line - 2][cur_col + 2] ? true : false
		else
			false
		end
	end
end
