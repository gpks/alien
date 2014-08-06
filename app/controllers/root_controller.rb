class RootController < ApplicationController
  def index
    @cities = City.all
#    @cont = Contact.all
    
    # #wersja brzydsza
    # @cities.to_a.sort! { |x,y| y.contacts.count <=> x.contacts.count }
    
    #wersja ładniejsza
    @cities = City.joins(:contacts).group(Contact.arel_table[:city_id]).
         order(Contact.arel_table[:city_id].count).reverse.paginate(:page =>10)
  end
def new
  @city = City.new
end

def create

  @city = City.find_or_create_by(params[:name])
  @city.contacts.create(params[:objects])
  redirect_to root_index_path, notice: 'City was successfully created.'
end
# def create
#     @contact = Contact.new(contact_params)
#     if @contact.save 
#       redirect_to @contact, notice: 'Contact was successfully created.'
#     else
#       render :new
#     end
#   end

end
 private
    

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name,:id)
    end

    def contact_params
      params.require(:contact).permit(:city_id,:objects,:id)
    end

