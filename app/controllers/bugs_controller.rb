class BugsController < ApplicationController
  before_action :set_bug, only: %i[ show edit update destroy ]

  # GET /bugs or /bugs.json
  def index
    @bugs = Bug.all
  end

  # GET /bugs/1 or /bugs/1.json
  def show
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
  end

  # GET /bugs/1/edit
  def edit
  end

  # POST /bugs or /bugs.json
  def create
    @bug = Bug.new(bug_params)

    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, notice: "Bug was successfully created." }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bugs/1 or /bugs/1.json
  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to @bug, notice: "Bug was successfully updated." }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1 or /bugs/1.json
  def destroy
    @bug.destroy!

    respond_to do |format|
      format.html { redirect_to bugs_path, status: :see_other, notice: "Bug was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def bug_params
      params[:bug][:severity] = params[:bug][:severity].to_i    # Nasty hack
      params[:bug][:status] = params[:bug][:status].to_i    # Nasty hack
      params.expect(bug: [ :title, :description, :severity, :status, :due_date, :story_id ])
    end
end
