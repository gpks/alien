class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  def new
    @contact = Contact.new
  end

  def edit
  end

  def show
  end

  def index
    @contacts = Contact.all
  end

  def delete
  end

  def create

    @city = City.find_or_create_by(name: (params[:contact][:city_id]))
    contact_params.delete(:city_id)
    @contact = Contact.new(contact_params)
    @contact.city_id = @city.id

    if @contact.save 
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.' 
  end
  end




   private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # def city_params
    #   params.require(:city).permit(:name)
    # end


    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:city_id,:objects,:id)
    end

