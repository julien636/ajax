class EmailsController < ApplicationController
  def index
    @emails=Email.all.sort.reverse
  end

  def new
  end

  def show
    @emails=Email.all.sort.reverse
    @email=Email.find(params[:id])
    @email.update(status:true)
    @email.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @emails=Email.all.sort.reverse
    @email=Email.find(params[:id])
    @email.update(status:false)
    @email.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end


  def create
    @newemail = Email.new(object:Faker::Lorem.sentence,body:Faker::Lorem.paragraph,status:false)
    if @newemail.save
      flash[:notice] = "Email created"
    else
      flash[:notice] = "Please try again"
    end
    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.js { }
    end
  end

  def destroy
    @email=Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end

