require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    setup_handle_errors
  end

  teardown do
    tear_down_handle_errors
  end

  test "the truth" do
    get raise_specific_error_errors_url
    byebug
  end

  private

  def setup_handle_errors
    @env_config = Rails.application.env_config

    @show_exceptions = Rails.application.config.action_dispatch.show_exceptions
    @local_requests = Rails.application.config.action_dispatch.show_detailed_exceptions
    @older_handler = Rails.application.config.exceptions_app
    @consider_local_requests = Rails.application.config.consider_all_requests_local

    Rails.application.config.action_dispatch.show_detailed_exceptions = true
    Rails.application.config.consider_all_requests_local = false
    Rails.application.config.exceptions_app = -> (env) { byebug }
    @env_config['action_dispatch.show_exceptions'] = true
    @env_config['action_dispatch.show_detailed_exceptions'] = true
  end

  def tear_down_handle_errors
    @env_config['action_dispatch.show_exceptions'] = @show_exceptions
    Rails.application.config.action_dispatch.show_detailed_exceptions = @local_requests
    Rails.application.config.exceptions_app = @older_handler
    Rails.application.config.consider_all_requests_local = @consider_local_requests
  end
end
