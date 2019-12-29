namespace :mailer do
	desc 'Отправка почты'

	task send_day: :environment do
		Posts.where("created_at < ?", 1.days.ago).each do |post|
			User.where(type_mailing: 1).each do |user|
				UserMailer.with(email: user.email, body: post.body).send_post.deliver_now
			end
		end
	end
	task send_week: :environment do
		Posts.where("created_at < ?", 7.days.ago).each do |post|
			User.where(type_mailing: 2).each do |user|
				UserMailer.with(email: user.email, body: post.body).send_post.deliver_now
			end
		end
	end
end