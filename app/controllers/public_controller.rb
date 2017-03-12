class PublicController < ApplicationController
  protect_from_forgery :except => [:contact ]

  def index

  end

  def contact
    if !params[:email].blank? && !params[:message].blank?
      ContactMailer.contact_me(params[:message], params[:email], params[:name]).deliver_now()
    end

  end
end
