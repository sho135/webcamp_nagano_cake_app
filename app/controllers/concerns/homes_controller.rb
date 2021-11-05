class HomesController < ApplicationController

def top
  @new_items = Item.last(4)
end

def about
end

end
