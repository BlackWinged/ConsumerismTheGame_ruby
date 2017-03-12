class PublicController < ApplicationController
  def index
  
    ContactMailer.contact_me("test").deliver_now()
  end
end
