class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def new
    @puzzle = Puzzle.new
    2.times do
        @puzzle.styles.build
    end

    @puzzle.styles.each do |style|
      style.selectors.build
      style.selectors.each do |selector|
        selector.properties.build
      end
    end
  end

  def create
    @puzzle = Puzzle.new(puzzle_params)
    if @puzzle.save
      redirect_to puzzles_path
    else
      render action: :new
    end
  end

  def delete
    @puzzle = Puzzle.find(params[:id])

    if @puzzle.delete

    else

    end
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:title, :description, styles_attributes: [:state, selectors_attributes: [:name, properties_attributes: [:name, :value]]])
  end

end
