class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :comments
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # パスワードが半角英字と半角数字それぞれ１文字以上を含む8文字以上100文字以下の文字列
  PASSWORD_RULE = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # 名前は全角文字で入力されているか
  NAME_RULE = /\A[ぁ-んァ-ヶー一-龠]+\z/.freeze
  # ふりがなは全角カタカナで入力されているか
  FURIGANA_NAME_RULE = /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: PASSWORD_RULE }
    validates :last_name, format: { with: NAME_RULE }
    validates :first_name, format: { with: NAME_RULE }
    validates :last_name_kana, format: { with: FURIGANA_NAME_RULE, messages: 'は全角カタカナで設定してください' }
    validates :first_name_kana, format: { with: FURIGANA_NAME_RULE, messages: 'は全角カタカナで設定してください' }
  end
end
