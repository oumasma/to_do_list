class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category

    if @task.save
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js { }
      end
    else
      respond_to do |format|
        format.html {redirect_to root_path}
        format.js { }
      end
      flash[:notice] = "Please try again"
    end
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    
    if task_params[:name] == "1"
      @task.update(status: true)
      puts "le statut est true"
    else
      @task.update(status: false)
      puts "le statut est false"
    end
    
    flash[:notice] = "Task edited"
    
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
    end
    
  end

  def index
    @tasks = Task.all
  end

  def destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js { }
    end
    @task = Task.find(params[:id])
    @task.destroy
  end


  private

  def task_params
    params.permit(:title, :deadline, :description, :name, :id, :status)
  end

  def category_params
    params.require(:Category)
  end

end
