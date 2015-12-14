json.array! @requests_and_project  do |request|
	json.id request.id
	json.date request.date.strftime('%d.%m.%Y')
	json.is_approved request.is_approved
	json.created_at request.created_at.strftime('%d.%m.%Y %H:%M:%S')
	json.updated_at request.updated_at.strftime('%d.%m.%Y %H:%M:%S')
	json.project_name request.project.name
end