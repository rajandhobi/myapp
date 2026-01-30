 module Admin

class NotesController < ApplicationController
  def index
    if params[:keyword].present?
      @notes = Note.where("title LIKE ?", "%#{params[:keyword]}%")
    else
      @notes = Note.all
    end
  end

  def show
  ids = params.expect(:id)
# @notes = Note.find(params[:id])
  note_id = ids[0]

  @notes = Note.find(note_id)

  Rails.logger.debug ids
  end

  def new
    @notes = Note.new
  end

def create
    @notes = Note.new( note_params)

  if @notes.save
  # render json: {  
  #  message: "Note created successfully",
  #  note: @note
  # }, status: :created
  redirect_to notes_path(@note)
  else
    render :new, status: :unprocessable_entity
  end

  private 

def note_params
  params.expect(note: [:title, :content])
end
end
end
 end

# class NotesController < ApplicationController
# protect_from_forgery with: :null_session
# wrap_parameters :note, include: [:title, :content]

# def index
#   search = params.fetch(:search, {}).permit(:keyword)

#   if search[:keyword].present?
#     @notes = Note.where("title LIKE ?", "%#{search[:keyword]}%")
#   else
#     @notes = Note.all
#   end
# end


#   def show
#     id = params.expect(:id)
#     @notes = Note.find(id)
#   end


#   def new
#     @notes = Note.create

    
#   end
#   def create
#     @notes = Note.create(note_params)



#     if @notes.save
#       redirect_to notes_path
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

  
#   private

#   def note_params
#     params.expect(note: [:title, :content])
#   end
# end



# class NotesController < ApplicationController
#   protect_from_forgery with: :null_session
#   wrap_parameters :note, include: [:title, :content]

#   # 🔹 INDEX
#   def index
#     # 1️⃣ Read search keyword safely
#     search = params.fetch(:search, {}).permit(:keyword)

#     # 2️⃣ Save last visited page in cookie (simple cookie)
#     cookies[:last_page] = "notes_index"

#     if search[:keyword].present?
#       @notes = Note.where("title LIKE ?", "%#{search[:keyword]}%")
#     else
#       @notes = Note.all
#     end
#   end

#   # 🔹 SHOW
#   def show
#     id = params.expect(:id)
#     @note = Note.find(id)

#     # 3️⃣ Signed cookie (tamper-proof)
#     cookies.signed[:last_viewed_note_id] = @note.id
#   end

#   # 🔹 NEW
#   def new
#     # 4️⃣ Read cookie to prefill title (remember last title)
#     @note = Note.new(
#       title: cookies[:last_note_title],
#       content: cookies.encrypted[:last_note_content]
#     )
#   end

#   # 🔹 CREATE
#   def create
#     @note = Note.new(note_params)

#     if @note.save
#       # 5 Simple cookie (browser close → delete)
#       cookies[:last_note_title] = @note.title
#       cookies.signed[:last_note_id] = @note.id
#       # 6Encrypted cookie (secure data)
#       cookies.encrypted[:last_note_content] = @note.content
#       cookies[:note_created] = {
#         value: "yes",
#         expires: 1.hour.from_now
#       }

#       redirect_to notes_path
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   # 🔹 DELETE COOKIES (OPTIONAL)
#   def clear_cookies
#     cookies.delete(:last_note_title)
#     cookies.delete(:note_created)
#     cookies.delete(:last_page)
#     redirect_to notes_path
#   end

#   private

#   def note_params
#     params.expect(note: [:title, :content])
#   end
# end
