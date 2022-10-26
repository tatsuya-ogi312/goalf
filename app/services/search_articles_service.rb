class SearchArticlesService

  def self.search(search)
    if search != ""
      Article.where('title LIKE(?)', "%#{search}%").order('created_at DESC')
    else
      Article.includes(:user).order('created_at DESC')
    end
  end
  
end