namespace :mailer do
	desc 'Отправка почты'

	task send_day: :environment do
		puts 'start mailing'
		Posts.where(created_at: 1.day.ago.all_day).each do |post|
			User.where(type_mailing: 1).each do |user|
				UserMailer.with(user: user, post: post).send_post.deliver_now
			end
		end
		puts 'end mailing'
	end

	task send_week: :environment do
		puts 'start mailing'
		Posts.where(created_at: 6.day.ago.all_week).each do |post|
			User.where(type_mailing: 2).each do |user|
				UserMailer.with(user: user, post: post).send_post.deliver_now
			end
		end
		puts 'end mailing'
	end
end