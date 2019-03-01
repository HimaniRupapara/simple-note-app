class SharedNotesController < ApplicationController
  before_action :set_shared_note, only: [:show, :edit, :update, :destroy]

  # GET /shared_notes
  # GET /shared_notes.json
  def index
    @note=Note.find(params[:note_id])
    @shared_notes = @note.shared_notes.all
    respond_to do |format|
      format.html { redirect_to note_comments_path }
      format.js
    end
  end

  # GET /shared_notes/1
  # GET /shared_notes/1.json
  def show
  end

  # GET /shared_notes/new
  def new
    @note=Note.find(params[:note_id])
    @shared_note = @note.shared_notes.new
  end

  # GET /shared_notes/1/edit
  def edit
  end

  # POST /shared_notes
  # POST /shared_notes.json
  def create
    @check_email=User.find_by(email:params[:shared_note][:email])
    if @check_email == nil
        @msg = "You need to register in SimpleNoteApp through " + "<a href ='http://localhost:3000'>http://localhost:3000</a>"
    else
      @note=Note.find(params[:note_id])
      @shared_note = @note.shared_notes.new(shared_note_params)
      @msg=Note.find(params[:note_id]).title + " note shared by " + current_user.email
      respond_to do |format|
        if @shared_note.save

          format.html
          format.js
        else
        end
      end
    end
    EmailJob.perform_later @msg ,params[:shared_note][:email]
  end

  # PATCH/PUT /shared_notes/1
  # PATCH/PUT /shared_notes/1.json
  def update
    respond_to do |format|
      if @shared_note.update(shared_note_params)
        format.html { redirect_to @shared_note, notice: 'Shared note was successfully updated.' }
        format.json { render :show, status: :ok, location: @shared_note }
      else
        format.html { render :edit }
        format.json { render json: @shared_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shared_notes/1
  # DELETE /shared_notes/1.json
  def destroy
    @shared_note.destroy
    respond_to do |format|
      format.html { redirect_to shared_notes_url, notice: 'Shared note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_note
      @shared_note = SharedNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shared_note_params
      params.require(:shared_note).permit(:email,:shared_by_id, :permission_id)
    end
end
