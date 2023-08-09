class BoardsController < ApplicationController
  def index
    if params[:search].present?
      @boards = Board.where("name LIKE ? OR email LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    else
      @boards = Board.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    end
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      @board.data = BoardService.generate_board(@board.width, @board.height, @board.mines)
      @board.save
      redirect_to board_path(@board)
    else
      render :new
    end
  end

  def show
    begin
      @board = Board.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Board not found"
      redirect_to boards_path
    end
  end

  private

  def board_params
    params.require(:board).permit(:name, :email, :mines, :width, :height)
  end
end
