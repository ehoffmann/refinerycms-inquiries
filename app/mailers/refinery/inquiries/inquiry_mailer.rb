module Refinery
  module Inquiries
    class InquiryMailer < ActionMailer::Base

      def confirmation(inquiry, request)
        @inquiry = inquiry
        mail :subject   => Refinery::Inquiries::Setting.confirmation_subject(Globalize.locale),
             :to        => inquiry.email,
             # :from      => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :from      => Refinery::Inquiries::Setting.sender_email,
             :reply_to  => Refinery::Inquiries::Setting.notification_recipients.split(',').first
      end

      def notification(inquiry, request)
        @inquiry = inquiry
        mail :subject   => Refinery::Inquiries::Setting.notification_subject,
             :to        => Refinery::Inquiries::Setting.notification_recipients,
             # :from      => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :from      => Refinery::Inquiries::Setting.sender_email,
             :reply_to  => inquiry.email
      end

    end
  end
end
