class SharedNotesController < ApplicationController
  before_action :set_shared_note, only: [:show, :edit, :update, :destroy,:update_permission]

  # GET /shared_notes
  # GET /shared_notes.json
  def index
    @shared_notes = SharedNote.where(email:current_user.email).all
    respond_to do |format|
      format.html
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
    respond_to do |format|
      format.html { redirect_to note_comments_path }
      format.js
    end
  end

  # GET /shared_notes/1/edit
  def edit
  end

  # POST /shared_notes
  # POST /shared_notes.json
  def create
    @check_email=User.find_by(email:params[:shared_note][:email])
    @note=Note.find(params[:note_id])
    @shared_note = @note.shared_notes.new(shared_note_params)
    if @check_email == nil
        @shared_note.save
        @msg = "You need to register in SimpleNoteApp through " + "<a href ='http://localhost:3000'>http://localhost:3000</a>"
    else

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


  def request_for_permission
    @share_id=SharedNote.find(params[:id])
    @msg="Hi, [#{view_context.link_to('Test','http://localhost:3000'+update_permission_shared_note_path(:id => params[:id]))}]".html_safe
    @msg = "Request for edit permission of note "+@share_id.note.title+" from  "+@share_id.email + "<br>[#{view_context.link_to('To Approve Click on this link','http://localhost:3000'+update_permission_shared_note_path(:id => params[:id],:permission_id => 2))}]"
    @note_id = @share_id.note.user.email
    EmailJob.perform_later @msg ,@note_id
  end

  def update_permission
    @shared_note.permission_id=params[:permission_id]
    @shared_note.save
    respond_to do |format|
      format.html { redirect_to root_path}
      format.js
    end
  end

  def shared_by_me_notes
    @shared_notes =SharedNote.where(shared_by_id:current_user.id).order('shared_notes.created_at desc')
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_note
      @shared_note = SharedNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shared_note_params
      params.require(:shared_note).permit(:email,:shared_by_id,:permission_id)
    end
end
