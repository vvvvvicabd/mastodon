# frozen_string_literal: true

class Keys::QueryService < BaseService
  class Result < ActiveModelSerializers::Model
    attributes :account, :devices

    def initialize(account, devices)
      @account = account
      @devices = devices || []
    end
  end

  class Device < ActiveModelSerializers::Model
    attributes :device_id, :name, :identity_key, :fingerprint_key

    def initialize(attributes = {})
      @device_id       = attributes[:device_id]
      @name            = attributes[:name]
      @identity_key    = attributes[:identity_key]
      @fingerprint_key = attributes[:fingerprint_key]
    end
  end

  def call(account)
    devices = begin
      if account.local?
        account.devices.map { |device| Device.new(device) }
      else
        # TODO
      end
    end

    Result.new(account, devices)
  end
end
