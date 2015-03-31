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
			content_tag :span, "", class: "glyphicon glyphicon-question-sign task-action"
		elsif taskling.status == 1
			link_to taskling_path(taskling, taskling: {status: 3}), method: :patch do
				content_tag :span, "", class: "glyphicon glyphicon-ok-circle task-action active" 
			end
		else
			link_to taskling_path(taskling, taskling: {status: 1}), method: :patch do
				content_tag :span, "", class: "glyphicon glyphicon-ok-sign task-action complete" 
			end
		end
	end

	def show_taskling_status(taskling)
		if taskling.status == 0
			style = "btn btn-xs btn-default task-status"
		elsif taskling.status == 1
			style = "btn btn-xs btn-success task-status"
		elsif taskling.status == 2
			style = "btn btn-xs btn-warning task-status"
		else
			style = "btn btn-xs btn-default task-status"
		end
		content_tag :span, taskling.print_status, class: style
	end

end
