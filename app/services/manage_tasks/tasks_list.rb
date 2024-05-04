module ManageTasks
  class TasksList < BaseService
    def fetch
      retrive_tasks
    end

    private

    def retrive_tasks
      data = TaskManager.all.as_json(except: %i[created_at updated_at])

      success_response(data, 'Task List fetched')
    end
  end
end