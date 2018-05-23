class Content < ApplicationRecord
  extend FriendlyId
  friendly_id :titolo, use: :slugged

	belongs_to :user

  has_many :sales
	has_attached_file :cover
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/,
  	message:"Supportate solo file immagini"

  	has_attached_file :allegato, :content_type =>[/^image\/(png|jpeg|gif)/,'application/msword','application/mspowerpoint','application/pdf','application/msexcel'],
  	message: "Formato non supportato"

  	validates :titolo, :descrizione, :price, presence: true
  	validates :price, numericality: { greater_than: 49 }
  	validates :cover, attachment_presence: true
  	validates :allegato, attachment_presence: true
end
