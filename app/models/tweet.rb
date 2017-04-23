class Tweet < ActiveRecord::Base
    validates :content, presence: true
    validates :content, length: { maximum: 140 } 
    #index表示順をCreateの時間で並び替え(update時に順番が崩れない)
    default_scope -> { order(created_at: :desc) }
end
