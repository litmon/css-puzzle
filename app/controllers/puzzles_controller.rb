class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def new
    @puzzle = Puzzle.new
  end

  def create
    @puzzle = Puzzle.new(puzzle_params)
  end

  def delete
    @puzzle = Puzzle.find(params[:id])

    if @puzzle.delete

    else

    end
  end

  private

  def puzzle_params
    params.require(:puzzle).permit()
  end

end
