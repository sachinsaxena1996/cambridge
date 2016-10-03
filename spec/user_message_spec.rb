require './user_message'
describe UserMessage do
	describe 'initialize method' do
		before(:each) do
			@params = {
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

		end

		it "sets the user_id" do
				@user_message = UserMessage.new(@params)
				expect(@user_message.user_id).to eq @params[:properties][:user_id]
		end

		it "sets the message with only alert_message if silent is true" do
			@params[:payload][:options][:alert_message] = true
			@user_message = UserMessage.new(@params)
			expect(@user_message.message).to eq @params[:payload][:options][:alert_message]
		end

		it "sets the message with alert_message and badge_count if silent is false" do
			@params[:payload][:options][:silent] = false
			@user_message = UserMessage.new(@params)
			expect(@user_message.message).to eq (@params[:payload][:options][:alert_message].to_s +
				@params[:payload][:options][:badge_count].to_s)
		end

		it "sets the message_type" do
			@user_message = UserMessage.new(@params)
			expect(@user_message.message_type).to eq @params[:payload][:options][:notification_type]
		end

		it "sets the pop_up" do
			@user_message = UserMessage.new(@params)
			expect(@user_message.pop_up).to eq @params[:payload][:options][:silent]
		end
	
		it "sets the publish_at" do
			@user_message = UserMessage.new(@params)
			expect(@user_message.publish_at).to eq @params[:properties][:effective_date]
		end

		it "sets the target to gcm if devices is android" do
			@params[:payload][:options][:devices] = "android => e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96"
			@user_message = UserMessage.new(@params)
			expect(@user_message.target).to eq 'gcm'
		end

		it "sets the target to apn if devices is ios" do
			@params[:payload][:options][:devices] = "ios => e25454608b6097bc412be42ad9bf39797a698925d947b9d136cbb992f649cc96"
			@user_message = UserMessage.new(@params)
			expect(@user_message.target).to eq 'apn'
		end
		
		it "sets the device_ids" do
			@user_message = UserMessage.new(@params)
			expect(@user_message.device_ids).to eq @params[:payload][:options][:devices].split('=>').last.strip
		end
	end
end