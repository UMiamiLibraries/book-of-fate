class Transcription < ApplicationRecord
  belongs_to :question
  belongs_to :pattern
  has_many :submissions
  has_many :tags

  accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:page_id].blank? }

  self.per_page = 16

  def get_image_url
    aws_link = "https://s3.amazonaws.com/book-of-fate/images/answers";
    q = (self.question.id - 1).to_s.rjust(2, "0");
    p = self.pattern
    return aws_link + "/q" + q + "/q" + q + "_p" + p.page + "_" + p.side + "_" + p.offset + ".jpg"
  end

  def status
    if self.locked then
      return "Unfreeze"
    else
      return "Freeze"
    end
  end

  def toggle
    if self.locked then
      self.locked = false
    else
      self.locked = true
    end
  end
end
