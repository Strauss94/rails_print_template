class PrintTemplatesController < ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]

  # GET /templates
  def index
    @templates = PrintTemplate.all
  end

  # GET /templates/1
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render_print_template_as_pdf(@template, 'Test')
      end
    end
  end

  # GET /templates/new
  def new
    @template = PrintTemplate.new
  end

  # GET /templates/1/edit
  def edit
  end

  # POST /templates
  def create
    @template = PrintTemplate.new(template_params)

    if @template.save
      redirect_to @template, notice: 'PrintTemplate was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /templates/1
  def update
    if @template.update(template_params)
      redirect_to @template, notice: 'PrintTemplate was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /templates/1
  def destroy
    @template.destroy
    redirect_to templates_url, notice: 'PrintTemplate was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = PrintTemplate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def template_params
      params.require(:print_template).permit(:name, :body, :width, :height, :margin_left, :margin_right, :margin_top, :margin_bottom)
    end
end
