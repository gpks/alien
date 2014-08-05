class RootController < ApplicationController
  def index
    @cities = City.all
#    @cont = Contact.all
    
    #wersja brzydsza
    @cities.to_a.sort! { |x,y| y.contacts.count <=> x.contacts.count }
    
    #wersja ładniejsza
    @cities = City.joins(:contacts).group(Contact.arel_table[:city_id]).
         order(Contact.arel_table[:city_id].count).reverse
  end
end