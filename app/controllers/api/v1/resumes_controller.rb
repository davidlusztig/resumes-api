class Api::V1::ResumesController < Api::V1::BaseController
    
    before_action :set_resume, only: [ :show ]
    
    def index

      @resumes = policy_scope(Resume)
    end

    def show
  end

  private

  def set_resume
    @resume = Resume.find(params[:id])
    authorize @resume  # For Pundit
  end
end