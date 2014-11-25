module ListsHelper

	def show_status_action(task)
		if task.status == 0
			link_to 'activate', list_task_path(task.list, task, task: {status: 1}), method: :patch
		elsif task.status == 1
			link_to 'close', list_task_path(task.list, task, task: {status: 2}), method: :patch
		else
			link_to 're-open', list_task_path(task.list, task, task: {status: 1}), method: :patch
		end
	end

end
