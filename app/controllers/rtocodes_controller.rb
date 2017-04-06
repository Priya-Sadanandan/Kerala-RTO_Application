class RtocodesController < ApplicationController
  before_action :set_rtocode, only: [:show, :edit, :update, :destroy]


  http_basic_authenticate_with name: "rtoadmin", password: "secret", realm: "Only RTO adminstrators have the authority to Edit/Delete/Add new RTO codes!", except: [:index, :show, :search]

#  # Welcome/Home page
#  def search
#  @current_time = Time.now.to_formatted_s(:short)
#  @greet_message = case Time.now.hour
#  when 5..11
#    "Good Morning! Have a good day!"
#  when 12..15
#    "Good Afternoon!"
#  when 16..19
#    "Good Evening!"
#  when 20..24, 0..4
#    "Good Night!"
#  end
#  #   @rtocode = Rtocode.find(params[:code])
#  #  render html: "Welcome to RTO App!"
#  end

  # GET /rtocodes
  # GET /rtocodes.json
  def index
    @rtocodes = Rtocode.all
  end

  # GET /rtocodes/1
  # GET /rtocodes/1.json
  def show
  end

  # GET /rtocodes/new
  def new
    @rtocode = Rtocode.new
  end

  # GET /rtocodes/1/edit
  def edit
  end

  # POST /rtocodes
  # POST /rtocodes.json
  def create
    @rtocode = Rtocode.new(rtocode_params)

    respond_to do |format|
      if @rtocode.save
        format.html { redirect_to @rtocode, notice: 'Rtocode was successfully created.' }
        format.json { render :show, status: :created, location: @rtocode }
      else
        format.html { render :new }
        format.json { render json: @rtocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rtocodes/1
  # PATCH/PUT /rtocodes/1.json
  def update
    respond_to do |format|
      if @rtocode.update(rtocode_params)
        format.html { redirect_to @rtocode, notice: 'Rtocode was successfully updated.' }
        format.json { render :show, status: :ok, location: @rtocode }
      else
        format.html { render :edit }
        format.json { render json: @rtocode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rtocodes/1
  # DELETE /rtocodes/1.json
  def destroy
    @rtocode.destroy
    respond_to do |format|
      format.html { redirect_to rtocodes_url, notice: 'Rtocode was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # Searching the text
  def search

  @current_time = Time.now.to_formatted_s(:short)
  @greet_message = case Time.now.hour
  when 5..11
    "Good Morning! Have a good day!"
  when 12..15
    "Good Afternoon!"
  when 16..19
    "Good Evening!"
  when 20..24, 0..4
    "Good Night!"
  end

    @rtocodes = Rtocode.all
    if params[:search]
  #    @rtocodes = Rtocode.search(params[:search])
      @rtocodes = Rtocode.search(params[:search]).order("created_at DESC")
    else
      @rtocodes = Rtocode.all.order("created_at DESC")
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rtocode
      @rtocode = Rtocode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rtocode_params
      params.require(:rtocode).permit(:code, :office, :district)
    end
end
