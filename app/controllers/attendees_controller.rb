class AttendeesController < ApplicationController
 def create

       @event= current_user.events.build
  end

end
