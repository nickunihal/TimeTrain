class MembersController < ApplicationController

  def new
  	@member= Member.new
  end

  #Create a new timetrain user
  def create
    @member = Member.new(member_params)
    if @member.save(member_params)
	    redirect_to social_sign_up_path
    else
	    redirect_to new_member_registration_path
    end
  end

  def social_sign_up
    @user = current_member
  end

  private
    def member_params
	    params.require(:member).permit(:username, :email, :password, :password_confirmation)
    end

end