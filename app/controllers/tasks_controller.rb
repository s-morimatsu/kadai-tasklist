class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
    
  def index
    if logged_in? 
      @tasks = Task.all
      @pagy, @tasks = pagy(Task.order(id: :asc), items: 10)
      #昇順asc  降順 desc

    else
      redirect_to login_url
      
    end
  end

  def show
    if @task.user_id != current_user.id
      redirect_to root_url
    end
  end
  
  def new
    @task = Task.new
  end

  def create
    #@task = Task.new(task_params)  2022/03/30 4:32:10
    
    # task テーブルのユーザーＩＤカラムにユーザーテーブルのＩＤを代入。
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'task が正常に投稿されました'
      redirect_to @task   #リンク先を指定して強制的に飛ばすメソッドです。
    else
      flash.now[:danger] = 'task が投稿されませんでした'
      render :new
    end

  end

  def edit
  end

  def update

    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end

  end

  def destroy
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end
