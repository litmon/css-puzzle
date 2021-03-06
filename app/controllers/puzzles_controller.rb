class PuzzlesController < ApplicationController

  before_action :set_puzzle

  def index
    puzzles_length = Puzzle.all.size
    @puzzle = Puzzle.find(rand(puzzles_length) + 1)
    @init = @puzzle.init.selectors.first.properties
    @goal = @puzzle.goal.selectors.first.properties
    gon.init = @init
    gon.goal = @goal
  end

  def show
    @puzzle = Puzzle.find(params[:id])
    @init = @puzzle.init.selectors.first.properties
    @goal = @puzzle.goal.selectors.first.properties
    gon.init = @init
    gon.goal = @goal
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
    @puzzle.user = current_user
    if @puzzle.save
      redirect_to puzzles_path
    else
      render action: :new
    end
  end

  def delete
    @puzzle = Puzzle.find(params[:id])
    @puzzle.delete!

    redirect_to puzzles_path
  end

  private

  def puzzle_params
    params.require(:puzzle).permit(:title, :description, styles_attributes: [:state, selectors_attributes: [:name, properties_attributes: [:name, :value]]])
  end

  def set_puzzle
    if params[:id]
      @puzzle = Puzzle.find(params[:id])
    end
  end

end
