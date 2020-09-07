class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @newmail = Email.create(object: Faker::Food.dish, body: Faker::Food.description, read: false)
    flash[:notice] = "Email créé"
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
    
  end

  def show
    @emailselected = Email.find(params[:id])
    @emailselected.update(:read => true)
    respond_to do |format|
      format.html { redirect_to email_path(@emailselected.id) }
      format.js { }
    end
  end

  def update
    @emailselected = Email.find(params[:id])
    if @emailselected.read == true
      @emailselected.update(:read => false)
    end
    respond_to do |format|
      format.html { redirect_to email_path(@emailselected.id) }
      format.js { }
    end
  end

  def destroy
    @emailselected = Email.find(params[:id])
    respond_to do |format|
      format.html {redirect_to email_path}
      format.js { }
    end
    @emailselected.destroy
  end
end


