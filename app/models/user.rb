class User < ApplicationRecord
  after_create :send_email

  private

  def send_email
    SendMailToUserWorkerWorker.perform_in(1.seconds, self.id)
  end
end
