# frozen_string_literal: true

class REST::EncryptedMessageSerializer < ActiveModel::Serializer
  attributes :account_id, :device_id, :type, :body

  def account_id
    object.from_account_id.to_s
  end

  def device_id
    object.from_device_id
  end
end
