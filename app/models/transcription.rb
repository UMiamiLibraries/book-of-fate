class Transcription < ApplicationRecord
  belongs_to :question
  belongs_to :pattern
  has_many :submissions
  has_many :tags

  self.per_page = 16

  def get_image_url
    aws_link = "https://s3.amazonaws.com/book-of-fate/images/answers";
    q = (self.question.id - 1).to_s.rjust(2, "0");
    p = self.pattern
    return aws_link + "/q" + q + "/q" + q + "_p" + p.page + "_" + p.side + "_" + p.offset + ".jpg"
    end
end
