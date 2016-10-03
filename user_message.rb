class UserMessage
	attr_accessor :user_id, :message, :message_type, :pop_up, :publish_at, :target, :device_ids

	def initialize(params)
		self.user_id = params[:properties][:user_id]
		if params[:payload][:options][:silent] == true
			self.message = params[:payload][:options][:alert_message]
		elsif params[:payload][:options][:silent] == false 
			self.message = params[:payload][:options][:alert_message] + params[:payload][:options][:badge_count].to_s
		end
		self.message_type = params[:payload][:options][:notification_type]
		self.pop_up = params[:payload][:options][:silent]
		self.publish_at = params[:properties][:effective_date]
		if params[:payload][:options][:devices].split('=>').first.strip == 'android'
		 self.target = 'gcm'
		elsif params[:payload][:options][:devices].split('=>').first.strip == 'ios'
			self.target = 'apn'
		end
		self.device_ids = params[:payload][:options][:devices].split('=>').last.strip
		self
	end
end

params = {
		"properties": {
			"user_id":43,
			"managing_user_id":43,
			"description":"Push Notification",
			"effective_date":"2015-07-20T06:28:36-05:00",
			"system_date":"2015-07-20T06:28:36-05:00"
		},
		"payload":{
			"id": 49,
			"options": {
				"devices": "ios => e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96",
				"alert_message": " You have following notifications ",
				"badge_count":10,
				"created_at":"2015-07-20T06:28:36-05:00",
				"id":48,
				"member_id":25,
				"notification_type": "secure_message",
				"silent":true,
				"updated_at":"2015-07-20T06:28:36-05:00"
			}
		}
}
user_message = UserMessage.new(params)
p user_message
