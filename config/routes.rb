Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :task_manager do
        collection do
          put :update_task_status
        end
      end
    end
  end
end
