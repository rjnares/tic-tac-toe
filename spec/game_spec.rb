# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#valid_input?' do
    it "returns true when input is '1'" do
      expect(game.valid_input?('1')).to eq(true)
    end

    it "returns true when input is '2'" do
      expect(game.valid_input?('2')).to eq(true)
    end

    it "returns false when input is not '1' or '2'" do
      expect(game.valid_input?('3')).to eq(false)
    end
  end

  describe '#game_start_options' do
    let(:expected_value) { 'expected_value' }

    before do
      allow(game).to receive(:game_start_prompt)
      allow(game).to receive(:gets).and_return(expected_value)
      allow(game).to receive(:invalid_input_message)
    end

    context 'when input is not valid once' do
      before do
        allow(game).to receive(:valid_input?).with(expected_value).and_return(false, true)
      end

      it 'sends invalid input message once' do
        expect(game).to receive(:invalid_input_message).once
        game.game_start_options
      end
    end

    context 'when input is not valid more than once' do
      before do
        allow(game).to receive(:valid_input?).with(expected_value).and_return(false, false, false, false, false, true)
      end

      it 'sends invalid input message more than once' do
        expect(game).to receive(:invalid_input_message).exactly(5).times
        game.game_start_options
      end
    end

    context 'when input is valid' do
      before do
        allow(game).to receive(:valid_input?).with(expected_value).and_return(true)
      end

      it 'returns input' do
        expect(game.game_start_options).to eq(expected_value)
      end
    end
  end
end
