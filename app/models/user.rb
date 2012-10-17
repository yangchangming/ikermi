require 'digest/sha2'
class User < ActiveRecord::Base

    attr_protected :hashed_password,:enabled
    attr_accessor :password
    
    validates_presence_of :username,:message=>"用户名不能为空！"
    validates_presence_of :email,:message=>"邮箱地址不能为空!"
    validates_presence_of :password,:message=>"密码不能为空！",:if=>:password_required?
    validates_presence_of :password_confirmation,:message=>"请再次输入密码！",:if=>:password_required?

    validates_length_of :username,:within=>3..64,:too_short=>"用户名长度为3~64!"
    validates_length_of :email,:too_short=>'邮箱地址长度为5~128!',:within=>5..128
    validates_length_of :password,:within=>4..20,:if=>:password_required?,:too_short=>'密码长度为4~20!'

    validates_confirmation_of :password,:if=>:password_required?,:message=>"密码不匹配！"
    
    validates_uniqueness_of :username,:message=>"用户名已经存在！"
    validates_uniqueness_of :email,:message=>"邮箱地址已经存在！",:case_sensitive=>false

    validates_format_of  :email, :message => "邮箱格式不正确!", :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

=begin
    validates_length_of :profile,:maximum=>1000
=end
    
    #验证用户登陆系统
    def self.authenticate(email,password)
        user = self.find_by_email(email)
        if user
          excepted_password = User.encrypt(password)
          if excepted_password != user.hashed_password
            user = nil
          end
        end
        user
    end


    #对password进行编码
    def before_save
      self.hashed_password = User.encrypt(password) if !self.password.blank?
    end
    
    def password_required?
      self.hashed_password.blank? || !self.password.blank?
    end
    
    #生成64位hashcode    
    def self.encrypt(string)
      return Digest::SHA256.hexdigest(string)
    end
    
end
