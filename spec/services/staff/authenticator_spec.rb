# -*- coding: utf-8 -*-
require 'rails_helper'

describe Staff::Authenticator do
  describe '#authenticate' do
    example '正しいパスワードならtrueを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be(true)
    end

    example '誤ったパスワードならfalseを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('xy')).to be(false)
    end

    example 'パスワード未設定ならfalseを返す' do
      m = build(:staff_member, password: nil)
      expect(Staff::Authenticator.new(m).authenticate(nil)).to be(false)
    end

    example '停止フラグが立っていれば:suspendedを返す' do
      m = build(:staff_member, suspended: true)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be(:suspended)
    end

    example '開始前ならfalseを返す' do
      m = build(:staff_member, start_date: Date.tomorrow)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be(false)
    end

    example '終了後ならfalseを返す' do
      m = build(:staff_member, end_date: Date.today)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be(false)
    end
  end
end
