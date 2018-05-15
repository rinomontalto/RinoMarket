class Content < ApplicationRecord
	belongs_to :user
	has_attached_file :cover
  	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/,
  	message:"Supportate solo file immagini"

  	has_attached_file :allegato, :content_type =>[/^image\/(png|jpeg|gif)/,'application/msword','application/mspowerpoint','application/pdf','application/msexcel'],
  	message: "Formato non supportato
  	"
end
