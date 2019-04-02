class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]
  before_action :is_admin

  # GET /
  # GET /job_postings.json
  # for showing ALL job postings
  def index
    @job_postings = JobPosting.all
  end

  # for showing job pustings under an employer
  # def show_under_employer

  # end

  # GET employer/1/job_postings/1
  # GET /job_postings/1.json
  def show
  end

  # GET employers/1/job_postings/1/new
  def new
    @job_posting = JobPosting.new
    @employer = Employer.find(params[:employer_id])
  end

  def new_with_unknown_employer
    @job_posting = JobPosting.new
    @employers = Employer.all
  end
  # GET employers/1/job_postings/1/edit
  def edit
  end

  # POST employers/1/job_postings
  # POST /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)

    respond_to do |format|
      if @job_posting.save
        if @admin
        format.html { redirect_to admin_job_postings_path, notice: 'Job posting was successfully created.' }
        else 
        format.html { redirect_to user_job_postings_path, notice: 'Job posting was successfully created.' }
        end
        format.json { render :show, status: :created, location: @job_posting }
      else
        if @admin
        format.html { render [:admin, :new] }
        
        else
          format.html { render [:user, :new] }
        end
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_with_unknown_employer
    @job_posting = JobPosting.new(job_posting_params)

    respond_to do |format|
      if @job_posting.save
        if @admin
          format.html { redirect_to admin_job_postings_path, notice: 'Job posting was successfully created.' }
        else
          format.html { redirect_to user_job_postings_path, notice: 'Job posting was successfully created.' }
        end
        format.json { render :show, status: :created, location: @job_posting }
      else
        format.html { render 'new_with_unknown_employer' }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT employers/1/job_postings/1
  # PATCH/PUT /job_postings/1.json
  def update
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        if @admin
          format.html { redirect_to admin_job_posting_path(@job_posting), notice: 'Job posting was successfully updated.' }
        else
          format.html { redirect_to user_job_posting_path(@job_posting), notice: 'Job posting was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { render [:admin, :edit] }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE employers/1/job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting.destroy
    respond_to do |format|
      if @admin
        format.html { redirect_to admin_job_postings_url, notice: 'Job posting was successfully destroyed.' }
      else
        format.html { redirect_to user_job_postings_url, notice: 'Job posting was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_posting_params
      params.require(:job_posting).permit(:position_name, :position_desc, :location, :benefits, :employer_id)
    end

    def is_admin
      port = request.fullpath.split("/")[1]
      @admin = (port == "admin")
    end

end
