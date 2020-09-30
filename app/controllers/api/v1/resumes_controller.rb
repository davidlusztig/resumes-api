class Api::V1::ResumesController < Api::V1::BaseController
    def index
      @resumes = policy_scope(Resume)
    end
  end