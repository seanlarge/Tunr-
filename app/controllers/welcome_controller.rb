class WelcomeController < ApplicationController
    skip_before_action :require_signing, only [:new, :create]

    def index
      render text: "Yo, sup?"
    end

end
