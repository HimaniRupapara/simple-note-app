class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: [:show, :edit, :update, :destroy,:mark_as_important]
  before_action :get_user_note
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
    @note.tag_list_on(:tag_list)

    respond_to do |format|
      if @note.save
        format.html
        format.js
      else
        format.html
        format.js {render :_error_message}
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update_attributes(note_params)
        format.html
        format.js
      else
        format.html
        format.js {render :_error_message}
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
      @notes_based_on_tags = @notes.tagged_with(params[:search])
      if(@notes_based_on_tags.count == 0)
        @notes_based_on_deatils=@notes.where("Lower(title) LIKE Lower(:search) OR Lower(description) LIKE (:search)",search: "%#{params[:search]}%")
        @notes=@notes_based_on_deatils
      else
        @notes=@notes_based_on_tags
      end
    end


    def mark_as_important
      if @note.important==true
        @note.important=false
      else
        @note.important=true
      end
      @note.save
      respond_to do |format|
        format.html
        format.js
      end
    end

    public

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
      params.require(:note).permit(:title,:description,:tag_list,:important)
    end
end
