class LanesController < ApplicationController
  before_action :set_lane, only: %i[ show edit update destroy ]

  # GET /lanes/1 or /lanes/1.json
  def show
  end

  # GET /lanes/new
  def new
    @lane = Lane.new
  end

  # GET /lanes/1/edit
  def edit
  end

  # POST /lanes or /lanes.json
  def create
    @lane = Lane.new(lane_params)

    respond_to do |format|
      if @lane.save
        # FIXME: do I really want to redirect back to project here?
        format.html { redirect_to @lane.project, notice: "Lane was successfully created." }
        format.json { render :show, status: :created, location: @lane }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lane.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lanes/1 or /lanes/1.json
  def update
    respond_to do |format|
      if @lane.update(lane_params)
        format.html { redirect_to lane_url(@lane), notice: "Lane was successfully updated." }
        format.json { render :show, status: :ok, location: @lane }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lane.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lanes/1 or /lanes/1.json
  def destroy
    @lane.destroy!

    respond_to do |format|
      format.html { redirect_to @lane.project, notice: "Lane was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lane
    @lane = Lane.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def lane_params
    params.require(:lane).permit(:title, :project_id)
  end
end
