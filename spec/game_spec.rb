# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#initialize' do
    let(:board) { game.instance_variable_get(:@board) }

    it 'creates a 2D array with 3 rows' do
      expect(board.length).to eq(3)
    end

    it 'creates a 2D array with 3 columns' do
      expect(board.all? { |row| row.length == 3 }).to eq(true)
    end

    it "creates a 2D array where every value is a single whitespace character ' '" do
      expect(board.flatten.all?(' ')).to eq(true)
    end
  end

  describe '#play' do
    before do
      allow(game).to receive(:welcome_message)
      allow(game).to receive(:game_start_options)
      allow(game).to receive(:exit_message)
      allow(game).to receive(:new_game_message)
      allow(game).to receive(:play_turns)
    end

    context 'when #game_start_options returns 1' do
      before do
        allow(game).to receive(:game_start_options).and_return(1)
      end

      it 'should call #exit_message' do
        expect(game).to receive(:exit_message).once
        game.play
      end

      it 'should not call #new_game_message' do
        expect(game).not_to receive(:new_game_message)
        game.play
      end

      it 'should not call #play_turns' do
        expect(game).not_to receive(:play_turns)
        game.play
      end
    end

    context 'when #game_start_options does not return 1' do
      it 'should not call #exit_message' do
        expect(game).not_to receive(:exit_message)
        game.play
      end

      it 'should call #new_game_message' do
        expect(game).to receive(:new_game_message).once
        game.play
      end

      it 'should call #play_turns' do
        expect(game).to receive(:play_turns).once
        game.play
      end
    end
  end

  describe '#valid_input?' do
    context 'when max and min are switched' do
      it 'returns true if input is in range [max, min]' do
        input = 2
        min = 3
        max = 1
        actual = game.valid_input?(input, max, min)
        expect(actual).to eq(true)
      end

      it 'returns false if input is NOT in range [max, min]' do
        input = 0
        min = 3
        max = 1
        actual = game.valid_input?(input, max, min)
        expect(actual).to eq(false)
      end
    end

    it 'returns true when input is in range [min, max]' do
      input = 2
      min = 1
      max = 3
      actual = game.valid_input?(input, min, max)
      expect(actual).to eq(true)
    end

    it 'returns false when input is NOT in range [min, max]' do
      input = 0
      min = 1
      max = 3
      actual = game.valid_input?(input, min, max)
      expect(actual).to eq(false)
    end
  end

  describe '#string_to_number' do
    context 'when string is an integer' do
      it 'returns integer value of string' do
        input = '5'
        expected = 5
        actual = game.string_to_number(input)
        expect(actual).to eq(expected)
      end
    end

    context 'when string is nil' do
      it 'returns integer value of -1' do
        input = nil
        expected = -1
        actual = game.string_to_number(input)
        expect(actual).to eq(expected)
      end
    end

    context 'when string is not an integer or nil' do
      it 'returns integer value of -1' do
        input = 'four'
        expected = -1
        actual = game.string_to_number(input)
        expect(actual).to eq(expected)
      end
    end
  end

  describe '#game_start_options' do
    let(:dummy_input) { 'dummy_input' }

    before do
      allow(game).to receive(:game_start_prompt)
      allow(game).to receive(:gets).and_return(dummy_input)
      allow(game).to receive(:string_to_number)
      allow(game).to receive(:invalid_input_message)
    end

    context 'when input is not valid once' do
      before do
        allow(game).to receive(:valid_input?).and_return(false, true)
      end

      it 'sends invalid input message once' do
        expect(game).to receive(:invalid_input_message).once
        game.game_start_options
      end
    end

    context 'when input is not valid more than once' do
      before do
        allow(game).to receive(:valid_input?).and_return(false, false, false, false, false, true)
      end

      it 'sends invalid input message more than once' do
        expect(game).to receive(:invalid_input_message).exactly(5).times
        game.game_start_options
      end
    end

    context 'when input is valid' do
      let(:expected) { 23 }

      before do
        allow(game).to receive(:string_to_number).and_return(expected)
        allow(game).to receive(:valid_input?).and_return(true)
      end

      it 'returns input' do
        actual = game.game_start_options
        expect(actual).to eq(expected)
      end
    end
  end

  describe '#player_move' do
    let(:row) { 1 }
    let(:col) { 3 }

    before do
      allow(game).to receive(:player_row).and_return(row)
      allow(game).to receive(:player_col).and_return(col)
      allow(game).to receive(:invalid_move_message)
    end

    it 'calls #player_row' do
      expect(game).to receive(:player_row).once
      game.player_move
    end

    it 'calls #player_col' do
      expect(game).to receive(:player_col).once
      game.player_move
    end

    context 'when [row, col] is invalid once' do
      before do
        allow(game).to receive(:valid_move?).and_return(false, true)
      end

      it 'calls #invalid_move_message once' do
        expect(game).to receive(:invalid_move_message).once
        game.player_move
      end
    end

    context 'when [row, col] is invalid more than once' do
      before do
        allow(game).to receive(:valid_move?).and_return(false, false, false, false, false, true)
      end

      it 'calls #invalid_move_message more than once' do
        expect(game).to receive(:invalid_move_message).exactly(5).times
        game.player_move
      end
    end

    context 'when [row, col] is valid' do
      before do
        allow(game).to receive(:valid_move?).and_return(true)
      end

      it 'returns [row, col]' do
        expect(game.player_move).to eq([row, col])
      end
    end
  end

  describe '#player_row' do
    let(:dummy_input) { 'dummy_input' }

    before do
      allow(game).to receive(:row_input_message)
      allow(game).to receive(:gets).and_return(dummy_input)
      allow(game).to receive(:string_to_number)
      allow(game).to receive(:invalid_input_message)
      allow(game).to receive(:draw_board)
    end

    context 'when input is not valid once' do
      before do
        allow(game).to receive(:valid_input?).and_return(false, true)
      end

      it 'sends invalid input message once' do
        expect(game).to receive(:invalid_input_message).once
        game.player_row
      end
    end

    context 'when input is not valid more than once' do
      before do
        allow(game).to receive(:valid_input?).and_return(false, false, false, false, false, true)
      end

      it 'sends invalid input message more than once' do
        expect(game).to receive(:invalid_input_message).exactly(5).times
        game.player_row
      end
    end

    context 'when input is valid' do
      let(:expected) { 15 }

      before do
        allow(game).to receive(:string_to_number).and_return(expected)
        allow(game).to receive(:valid_input?).and_return(true)
      end

      it 'returns input' do
        actual = game.player_row
        expect(actual).to eq(expected)
      end
    end
  end

  describe '#player_col' do
    let(:dummy_input) { 'dummy_input' }

    before do
      allow(game).to receive(:col_input_message)
      allow(game).to receive(:gets).and_return(dummy_input)
      allow(game).to receive(:string_to_number)
      allow(game).to receive(:invalid_input_message)
      allow(game).to receive(:draw_board)
    end

    context 'when input is not valid once' do
      before do
        allow(game).to receive(:valid_input?).and_return(false, true)
      end

      it 'sends invalid input message once' do
        expect(game).to receive(:invalid_input_message).once
        game.player_col
      end
    end

    context 'when input is not valid more than once' do
      before do
        allow(game).to receive(:valid_input?).and_return(false, false, false, false, false, true)
      end

      it 'sends invalid input message more than once' do
        expect(game).to receive(:invalid_input_message).exactly(5).times
        game.player_col
      end
    end

    context 'when input is valid' do
      let(:expected) { 15 }

      before do
        allow(game).to receive(:string_to_number).and_return(expected)
        allow(game).to receive(:valid_input?).and_return(true)
      end

      it 'returns input' do
        actual = game.player_col
        expect(actual).to eq(expected)
      end
    end
  end

  describe '#valid_move?' do
    let(:row) { 1 }
    let(:col) { 2 }
    let(:board) { game.instance_variable_get(:@board) }

    it 'returns false when [row, col] is filled' do
      board[row][col] = 'X'
      expect(game.valid_move?(row, col)).to eq(false)
    end

    it 'returns true when [row, col] is empty' do
      expect(game.valid_move?(row, col)).to eq(true)
    end
  end
end
