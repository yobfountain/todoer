class TasklingsController < ApplicationController

  def update
  	@taskling = Taskling.find(params[:id])
  	respond_to do |format|
      if @taskling.update(params.require(:taskling).permit(:status))
        format.html { redirect_to list_path(@taskling.task.list.code) }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

end