class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :comments
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーション
  # ニックネームは必須
  validates :nickname, presence: true
  # 誕生日は必須
  validates :birthday, presence: true
  # パスワードが半角英字と半角数字それぞれ１文字以上を含む8文字以上100文字以下の文字列
  PASSWORD_RULE = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_RULE, message: 'には英字と数字の両方を含めて入力してください'
  # 名前は必須
  validates :last_name, presence: true
  validates :first_name, presence: true
  # 名前は全角文字で入力されているか
  NAME_RULE = /\A[ぁ-んァ-ヶー一-龠]+\z/.freeze
  validates_format_of :last_name, with: NAME_RULE, message: 'は全角文字で設定してください'
  validates_format_of :first_name, with: NAME_RULE, message: 'は全角文字で設定してください'
  # ふりがなは名前それぞれで必須であること
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  # ふりがなは全角カタカナで入力されているか
  FURIGANA_NAME_RULE = /\A[ア-ン゛゜ァ-ォャ-ョー「」、]+\z/.freeze
  validates_format_of :last_name_kana, with: FURIGANA_NAME_RULE, message: 'は全角カタカナで設定してください'
  validates_format_of :first_name_kana, with: FURIGANA_NAME_RULE, message: 'は全角カタカナで設定してください'
end
