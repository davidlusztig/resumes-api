class Api::V1::ResumesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_resume, only: [ :show, :update, :destroy ]  # Re-use this.

  def index
    @resumes = policy_scope(Resume)
  end

  def show
  end

  def update
    if @resume.update(resume_params)
    render :show
    else
    render_error
    end
  end


  def create
        @resume = Resume.new(resume_params)
        @resume.user = current_user
        authorize @resume
    if @resume.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @resume.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end


  private

  def resume_params
     params.require(:resume).permit(:function, :job_description)
  end

  def set_resume
    @resume = Resume.find(params[:id])
    authorize @resume  # For Pundit
  end

  def render_error
    render json: { errors: @resume.errors.full_messages },
      status: :unprocessable_entity
  end
  end

