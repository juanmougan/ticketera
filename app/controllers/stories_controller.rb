class StoriesController < ApplicationController
  before_action :set_story, only: %i[ show edit update destroy ]
  before_action :fill_epics, only: %i[ new edit ]

  # GET /stories or /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1 or /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories or /stories.json
  def create
    if story_params[:sprint].nil?
      @story = Story.new(story_params)
    else
      sprint = Sprint.find(story_params.sprint)
      @story = sprint.tasks.new(story_params)
    end

    respond_to do |format|
      @story.status = params[:story][:status].to_i  # Convert status to integer
      if @story.save
        format.html { redirect_to @story, notice: "Story was successfully created." }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1 or /stories/1.json
  def update
    respond_to do |format|
      @story.status = params[:story][:status].to_i  # Convert status to integer
      if @story.update(story_params)
        format.html { redirect_to @story, notice: "Story was successfully updated." }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1 or /stories/1.json
  def destroy
    @story.destroy!

    respond_to do |format|
      format.html { redirect_to stories_path, status: :see_other, notice: "Story was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params.expect(:id))
    end

    def fill_epics
      @epics = Epic.all
    end

    # Only allow a list of trusted parameters through.
    def story_params
      params[:story][:status] = params[:story][:status].to_i    # Nasty hack
      params.expect(story: [ :title, :description, :status, :due_date, :points, :epic_id ])
    end
end
