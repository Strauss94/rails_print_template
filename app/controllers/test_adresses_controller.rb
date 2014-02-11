class TestAdressesController < ApplicationController
  before_action :set_test_adress, only: [:show, :edit, :update, :destroy]

  # GET /test_adresses
  def index
    @test_adresses = TestAdress.all
  end

  # GET /test_adresses/1
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render_print_template_as_pdf @test_adress.render_with_template(PrintTemplate.first), @test_adress.name
      end
    end
  end

  # GET /test_adresses/new
  def new
    @test_adress = TestAdress.new
  end

  # GET /test_adresses/1/edit
  def edit
  end

  # POST /test_adresses
  def create
    @test_adress = TestAdress.new(test_adress_params)

    if @test_adress.save
      redirect_to @test_adress, notice: 'Test adress was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /test_adresses/1
  def update
    if @test_adress.update(test_adress_params)
      redirect_to @test_adress, notice: 'Test adress was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /test_adresses/1
  def destroy
    @test_adress.destroy
    redirect_to test_adresses_url, notice: 'Test adress was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_adress
      @test_adress = TestAdress.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_adress_params
      params.require(:test_adress).permit(:name, :first_name, :street, :title, :zip, :city, :birthday)
    end
end
