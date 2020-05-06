class SendMailToUserWorkerWorker
  include Sidekiq::Worker

  sidekiq_options retry: 0

  def perform(user_id)
    puts "UserID: #{user_id}"
    User.find(user_id).update(is_sent_email: true)
  end
end
