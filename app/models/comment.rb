class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  
  scope :recent, lambda {
    order("created_at DESC").limit(5)
  }

end
