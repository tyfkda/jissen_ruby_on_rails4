# -*- coding: utf-8 -*-
require 'rails_helper'

describe Admin::Authenticator do
  describe '#authenticate' do
    example '正しいパスワードならtrueを返す' do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate('pw')).to be(true)
    end

    example '誤ったパスワードならfalseを返す' do
      m = build(:administrator)
      expect(Admin::Authenticator.new(m).authenticate('xy')).to be(false)
    end

    example 'パスワード未設定ならfalseを返す' do
      m = build(:administrator, password: nil)
      expect(Admin::Authenticator.new(m).authenticate(nil)).to be(false)
    end

    example '停止フラグが立っていれば:suspendedを返す' do
      m = build(:administrator, suspended: true)
      expect(Admin::Authenticator.new(m).authenticate('pw')).to be(:suspended)
    end
  end
end
