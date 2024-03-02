class CardsController < ApplicationController
  before_action :set_card, only: %i[ show edit update destroy ]

  def index
    if params.has_key? :lane_id
      @lane = Lane.find(params[:lane_id])
      @cards = @lane.cards
    else
      @cards = Card.all
    end
  end

  def show
  end

  def new
    # FIXME: this should require a :lane_id
    if params.has_key? :lane_id
      @lane = Lane.find(params[:lane_id])
      @card = Card.new(lane: @lane)
    else
      @card = Card.find(params[:id])
    end
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
        format.html { redirect_to card_url(@card), notice: "Card was successfully updated." }
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
    params.require(:card).permit(:lane_id, :title, :body)
  end
end
