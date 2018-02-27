module TodoListsHelper
	def todo_list_is_checked?(is_checked = false)
		is_checked ? t('simple_form.yes') : t('simple_form.no')
	end
end
