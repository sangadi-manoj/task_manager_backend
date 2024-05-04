module Api
  module V1
    class TaskManagerController < ApplicationController
      def index
        return_response(ManageTasks::TasksList.new.fetch)
      end

      def create
        return_response(ManageTasks::TaskManagerService.new(task_creation_params).create)
      end

      def update
        return_response(ManageTasks::TaskManagerService.new(task_updation_params).update_details)
      end

      def destroy
        return_response(ManageTasks::TaskManagerService.new(params).delete)
      end

      def update_task_status
        return_response(ManageTasks::TaskManagerService.new(update_status_params).update_status)
      end

      private

      def task_creation_params
        params.permit(:title, :description, :user_id)
      end

      def task_updation_params
        params.permit(:id, :title, :description, :user_id)
      end

      def update_status_params
        params.permit(:id, :status)
      end
    end
  end
end