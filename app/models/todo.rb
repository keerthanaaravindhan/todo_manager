
 #class Todo < ActiveRecord::Base
  #  def looks
   #     is_completed= completed ? "[X]" : "[ ]"
    #    "#{id}  #{todo_text}  #{due_date} #{is_completed}"
    #end
   #end

class Todo < ActiveRecord::Base
  
  validates :todo_text, presence: true
  validates :todo_text, length: { minimum: 2}
  validates :due_date, presence: true

  belongs_to :user
  # table called Users is present
  # todos table will contain user_id attribute

    def due_today?
      due_date == Date.today
    end
  
    def self.of_user(user)
      all.where(user_id: user.id)
    end

    def over_due?
      due_date < Date.today
    end
  
    def due_later?
      due_date > Date.today
    end

    def self.overdue
      all.where("due_date < ?", Date.today)
    end
  
    def self.duetoday
      all.where("due_date = ?", Date.today)
    end
  
    def self.duelater
      all.where("due_date > ?", Date.today)
    end

    def self.completed
        all.where(completed: true)
    end

  
  
    def self.show_list
      puts "My Todo-list\n\n"
  
      puts "Overdue\n"
      puts overdue.order(due_date: :asc).map { |todo| todo.to_displayable_string }
      puts "\n"
  
      puts "Due Today\n"
      puts duetoday.order(due_date: :asc).map { |todo| todo.to_displayable_string }
      puts "\n"
  
      puts "Due Later\n"
      puts duelater.order(due_date: :asc).map { |todo| todo.to_displayable_string }
      puts "\n"
    end
  
    
    def self.mark_as_complete!(todo_id)
      todo = Todo.find(todo_id)
      todo.update(completed: true)
      return todo
    end
  end
  