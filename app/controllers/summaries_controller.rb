class SummariesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.new
    authorize @summary
  end

  def show
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = @post.build_summary(params.require(:summary).permit(:description))
    @summary.post = @post
    authorize @summary

    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@topic, @post, @summary]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    authorize @summary

    if @summary.update_attributes(params.require(:summary).permit(:description))
      redirect_to [@topic, @post, @summary]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end
