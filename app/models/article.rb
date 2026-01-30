class Article
  include ActiveModel::Model
  include ActiveModel::Callbacks

  define_model_callbacks :publish

  before_publish :check_title
  after_publish  :notify_admin

  attr_accessor :title

  def publish
    run_callbacks :publish do
      puts " Article Published!"
    end
  end

  private

  def check_title
    puts "Checking title..."
  end

  def notify_admin
    puts "Admin notified!"
  end
end
  