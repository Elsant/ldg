class User < ActiveRecord::Base

  extend FriendlyId
  friendly_id :fullname, use: :slugged

  has_one  :style,     :dependent => :destroy
  has_one  :sizeset,   :dependent => :destroy
  has_one  :fav_store, :dependent => :destroy
  has_many :occasions, :dependent => :destroy
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable  # :omniauthable


  def slug_candidates
    [ :lastname,
      [:firstname, :lastname],
      [:firstname, :lastname, :halfemail]
    ]
  end

  def fullname
   "#{self.firstname} #{self.lastname}"
  end

  def halfemail
    self.email.split(/@/)[0].gsub(/\./, '')
  end

end


