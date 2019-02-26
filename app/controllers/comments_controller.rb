class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :get_note_comments, only: [:index,:new,:create,:update,:destroy]
  layout 'user'

  # GET /comments
  # GET /comments.json
  def index
    respond_to do |format|
      format.html { redirect_to note_comments_path }
      format.js
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @user_note.comments.new
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @user_note.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
          format.html
          format.js
      else
          format.html { redirect_to ro, notice: 'Comment was successfully updated.' }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
      if @comment.update_attributes!(comment_params)
         respond_to do |f|
         f.html
         f.js
       end
     else
       render 'edit'
     end
end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.destroy(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def get_note_comments
      @user_note=Note.find(params[:note_id])
      @comments = @user_note.comments.order('comments.created_at desc').paginate(:page => params[:page], :per_page => 5)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body,:note_id,:commented_by_id)
    end
end
