class PropertiesController < InheritedResources::Base

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to properties_path
    else
      render action: :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :value)
  end
end

