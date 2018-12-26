class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end

  def show
    find_micropost_by_id
  end

  def new
    @micropost = Micropost.new
  end

  def edit
    find_micropost_by_id
  end

  def create
    @micropost = Micropost.new(micropost_params)

    if @micropost.save
      redirect_to @micropost
    else
      render 'new'
    end
  end

  def update
    find_micropost_by_id

    if @micropost.update(micropost_params)
      redirect_to @micropost
    else
      render 'edit' 
    end
     
  end

  def destroy
    find_micropost_by_id
    @micropost.destroy

    redirect_to microposts_path
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end
    
    def find_micropost_by_id
    	@micropost = Micropost.find(params[:id])
    end
end
