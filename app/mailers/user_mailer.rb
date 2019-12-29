class UserMailer < ApplicationMailer
	default from: 'Test <test-1908@mail.ru>',
			template_path: 'mailer/posts'

	def send_post(email, body)
		mail(
			to: email,
			body: body
 			subject: "News!"
		)
	end
end
