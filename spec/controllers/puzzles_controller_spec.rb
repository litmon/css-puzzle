require 'spec_helper'

describe PuzzlesController, type: :controller do
  describe 'GET /puzzles' do
    let(:puzzles) { create_list(:puzzle, 3) }
    let(:puzzle) { puzzles.first }

    context 'when signed in' do
      it 'should render :index' do
      end
    end

    context 'when signed out' do
      it 'should redirect to welcome page' do
      end
    end
  end
end
