class CardColumnsController < ApplicationController
  before_action :set_card_column, only: %i[ show edit update destroy ]

  # GET /card_columns or /card_columns.json
  def index
    @card_columns = CardColumn.all
  end

  # GET /card_columns/1 or /card_columns/1.json
  def show
  end

  # GET /card_columns/new
  def new
    @card_column = CardColumn.new
  end

  # GET /card_columns/1/edit
  def edit
  end

  # POST /card_columns or /card_columns.json
  def create
    @card_column = CardColumn.new(card_column_params)

    respond_to do |format|
      if @card_column.save
        format.html { redirect_to card_columns_url, notice: "Card column was successfully created.", data: { turbo: false } }
        format.json { render :show, status: :created, location: @card_column }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_columns/1 or /card_columns/1.json
  def update
    respond_to do |format|
      if @card_column.update(card_column_params)
        format.html { redirect_to card_column_url(@card_column), notice: "Card column was successfully updated." }
        format.json { render :show, status: :ok, location: @card_column }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card_column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_columns/1 or /card_columns/1.json
  def destroy
    @card_column.destroy!

    respond_to do |format|
      format.html { redirect_to card_columns_url, notice: "Card column was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_card_column
    @card_column = CardColumn.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def card_column_params
    params.require(:card_column).permit(:title, :project_id)
  end
end
