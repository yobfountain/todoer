module ListsHelper

	def show_task_action(task)
		if task.status == 0
			link_to 'activate', list_task_path(task.list, task, task: {status: 1}), method: :patch
		elsif task.status == 1
			link_to 'close', list_task_path(task.list, task, task: {status: 2}), method: :patch
		else
			link_to 're-open', list_task_path(task.list, task, task: {status: 1}), method: :patch
		end
	end

	# ["inactive", "in progress", "stuck", "finished"]
	def show_taskling_action(taskling)
		if taskling.status == 0
			"This task is inactive."
		elsif taskling.status == 1
			link_to 'click to complete', taskling_path(taskling, taskling: {status: 3}), method: :patch
		else
			"completed"
		end
	end

end
