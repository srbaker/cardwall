class CardsController < ApplicationController
  before_action :set_card, only: %i[ show edit update destroy ]

  def index
    @lane = Lane.find(params[:lane_id])
    @cards = @lane.cards
  end

  def show
  end

  def new
    @lane = Lane.find(params[:lane_id])
    @card = Card.new(lane: @lane)
  end

  def edit
  end

  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.turbo_stream
        format.html { redirect_to card_url(@card), notice: "Card was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { head :ok, notice: "Card was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to cards_url, notice: "Card was successfully destroyed." }
    end
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:lane_id, :title, :body, :position)
  end
end
