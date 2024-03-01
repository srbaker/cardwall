class LanesController < ApplicationController
  before_action :set_lane, only: %i[ show edit update destroy ]

  def index
    @lanes = Lane.all
  end

  def show
  end

  def new
    @lane = Lane.new
  end

  def edit
  end

  def create
    @lane = Lane.new(lane_params)

    respond_to do |format|
      if @lane.save
        # FIXME: do I really want to redirect back to project here?
        format.html { redirect_to @lane.project, notice: "Lane was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lane.update(lane_params)
        format.html { redirect_to lane_url(@lane), notice: "Lane was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lane.destroy!

    respond_to do |format|
      format.html { redirect_to @lane.project, notice: "Lane was successfully destroyed." }
    end
  end

  private

  def set_lane
    @lane = Lane.find(params[:id])
  end

  def lane_params
    params.require(:lane).permit(:title, :project_id)
  end
end
