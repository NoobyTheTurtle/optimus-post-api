class Api::V1::DistrictsController < Api::V1::BaseController
  before_action :authenticate_request!
end
