# frozen_string_literal: true

class DeliverToDeviceService < BaseService
  def call(source_account, source_device, options = {})
    @source_account   = source_account
    @source_device    = source_device
    @target_account   = Account.find(options[:account_id])
    @target_device_id = options[:device_id]
    @body             = options[:body]
    @type             = options[:type]

    if @target_account.local?
      deliver_to_local!
    else
       # TODO
    end
  end

  private

  def deliver_to_local!
    target_device = @target_account.devices.find_by!(device_id: @target_device_id)
    target_device.encrypted_messages.create!(from_account: @source_account, from_device_id: @source_device.device_id, type: @type, body: @body)
  end
end
