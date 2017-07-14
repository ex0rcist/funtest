class RateExpiryService
  class << self
    CACHE_KEY = 'rate_expiry_jid'.freeze

    # lifetime: seconds til cache expiry
    def run(lifetime)
      cleanup_old_job!

      job = RateExpiryJob.set(wait: lifetime.seconds).perform_later
      Rails.cache.write('rate_expiry_jid', job.provider_job_id)
    end

    private

    def cleanup_old_job!
      jid = Rails.cache.read(CACHE_KEY)
      return unless jid

      old_job = Sidekiq::ScheduledSet.new.find_job(jid)
      old_job.delete if old_job
    end
  end
end
