module ManageTasks
  class TaskManagerService < BaseService
    def create
      save_task
    end

    def update_details
      update_task
    end

    def delete
      delete_task
    end

    def update_status
      status_update
    end

    private

    def save_task
      record = TaskManager.new(
        title: params[:title],
        description: params[:description],
      )

      return error_response({ errors: record.errors.to_hash }, 'dataInvalid') unless record.save

      success_response({data: record.as_json(except: %i[user_id created_at updated_at])}, 'Task added successfully!')
    end

    def update_task
      unless task.update(description: params[:description], title: params[:title])
        return error_response({ errors: task.errors.to_hash }, 'dataInvalid')
      end

      success_response({data: task.as_json(except: %i[user_id created_at updated_at])}, 'Task updated successfully!')
    end

    def delete_task
      return error_response({ errors: task.errors.to_hash }, 'dataInvalid') unless task.destroy

      success_response({data: {}}, 'Task has been deleted!')
    end

    def status_update
      unless task.update(is_completed: params[:status])
        return error_response({ errors: task.errors.to_hash }, 'dataInvalid')
      end

      success_response({data: task.as_json(except: %i[user_id created_at updated_at])}, 'Task updated successfully!')
    end

    def task
      @task ||= TaskManager.find(params[:id])
    end
  end
end
