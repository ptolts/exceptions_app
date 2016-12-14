class ErrorsController < ApplicationController
  layout false

  def raise_specific_error
    raise Exception
  end
end
