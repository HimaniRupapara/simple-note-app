class NotesController < ApplicationController

  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :get_user_note, only: [:index,:new,:create,:update,:destroy,:searchNote]
  layout 'user'


  # GET /notes
  # GET /notes.json
  def index
    @note=@user.notes.new
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note=@user.notes.new
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = @user.notes.new(note_params)
    respond_to do |format|
      if @note.save
        format.html
        format.js
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update_attributes!(note_params)
        format.html
        format.js
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.active=false
    @note.save
    respond_to do |format|
      format.html
      format.js
    end
  end


  def searchNote
    @notes=@notes.where("Lower(title) LIKE Lower(:search) OR Lower(description) LIKE (:search)",search: "%#{params[:search]}%")
  end

  private

    def get_user_note
      @user=User.find(current_user.id)
      @notes = @user.notes.where('active=true').order('notes.created_at desc')
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :description)
    end
end
