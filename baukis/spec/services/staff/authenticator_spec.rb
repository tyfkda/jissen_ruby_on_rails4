# -*- coding: utf-8 -*-
require 'rails_helper'

describe Staff::Authenticator do
  describe '#authenticate' do
    example '正しいパスワードならtrueを返す' do
      m = build(:staff_member)
      a = Staff::Authenticator.new(m)
      expect(a.authenticate('pw')).to be_truthy
    end

    example '誤ったパスワードならfalseを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('xy')).to be_falsy
    end

    example 'パスワード未設定ならfalseを返す' do
      m = build(:staff_member, password: nil)
      a = Staff::Authenticator.new(m)
      expect(a.authenticate(nil)).to be_falsy
    end

    example '停止フラグが立っていれば:suspendedを返す' do
      m = build(:staff_member, suspended: true)
      a = Staff::Authenticator.new(m)
      expect(a.authenticate('pw')).to be_truthy
      expect(a.suspended?).to be_truthy
    end

    example '開始前ならfalseを返す' do
      m = build(:staff_member, start_date: Date.tomorrow)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsy
    end

    example '終了後ならfalseを返す' do
      m = build(:staff_member, end_date: Date.today)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsy
    end
  end
end
