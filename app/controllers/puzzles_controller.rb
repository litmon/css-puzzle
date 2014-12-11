class PuzzlesController < ApplicationController

  def index
    puzzles_length = Puzzle.all.size
    @puzzle = Puzzle.find(rand(puzzles_length) + 1)
    @init = @puzzle.styles.where(state: 0).first.selectors.first.properties.all
    @goal = @puzzle.styles.where(state: 1).first.selectors.first.properties.all
  end

  def show
    @puzzle = Puzzle.find(params[:id])
  end

  def new
    @puzzle = Puzzle.new

    @puzzle.styles.build(state: :init)
    @puzzle.styles.build(state: :goal)

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
