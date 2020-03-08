class Todo < ActiveRecord::Base
    def looks
        is_completed= completed ? "[X]" : "[ ]"
        "#{id}  #{todo_text}  #{due_date} #{is_completed}"
    end
end
 