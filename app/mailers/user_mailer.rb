class UserMailer < ApplicationMailer
	default from: 'Test <test-1908@mail.ru>',
			template_path: 'mailer/posts'

	def send_post
		@user = params[:user]
		@post = params[:post]
		mail(
			to: @user.email,
 			subject: "News!"
		)
	end
end
