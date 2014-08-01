class RootController < ApplicationController
  def index
    @cities = City.all
    @cont = Contact.all

    @cities.each do |name|
      @city_obj = 0
      @cont.each do |cont|
        if name.id == cont.city_id
          @city_obj += cont.objects
        end
      end
    end

  end
end