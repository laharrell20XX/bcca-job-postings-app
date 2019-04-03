class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :edit, :update, :destroy]
  before_action :is_admin

  # GET /employers
  # GET /employers.json
  def index
    @employers = Employer.all
  end

  # GET /employers/1
  # GET /employers/1.json
  def show
  end

  # GET /employers/new
  def new
    @employer = Employer.new
  end

  # GET /employers/1/edit
  def edit
  end

  # POST /employers
  # POST /employers.json
  def create
    @employer = Employer.new(employer_params)

    respond_to do |format|
      if @employer.save

        if @admin
          format.html { redirect_to admin_employer_path(@employer), notice: 'Employer was successfully created.' }
        else
          format.html { redirect_to user_employer_path(@employer), notice: 'Employer was successfully created.' }
        end
        format.json { render :show, status: :created, location: @employer }
      else
        format.html { render :new }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employers/1
  # PATCH/PUT /employers/1.json
  def update
    respond_to do |format|
      if @employer.update(employer_params)

        if @admin
          format.html { redirect_to admin_employer_path(@employer), notice: 'Employer was successfully updated.' }
        else
          format.html {redirect_to user_employer_path(@employer), notice: 'Employer was successfully updated.'}
        end

        format.json { render :show, status: :ok, location: @employer }
      else
        format.html { render :edit }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    @employer.destroy
    respond_to do |format|
      if @admin
        format.html { redirect_to admin_employers_path, notice: 'Employer was successfully destroyed.' }
      else
        format.html { redirect_to user_employers_path, notice: 'Employer was successfully destroyed.' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_params
      params.require(:employer).permit(:name, :company_desc, :employee_count, :logo_url, :industry, :founded_date, :headquarters_address)
    end

    def is_admin
      port = request.fullpath.split("/")[1]
      @admin = (port == "admin")
    end
end
