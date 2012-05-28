class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true

  scope :recent, lambda {
    order("created_at DESC").limit(5)
  }

end
