module ClipsHelper
  def render_clip(clip)
    if clip.document.nil?
      clip.description
    else
      %(<h1>#{clip.document.title}</h1>#{clip.document.body})
    end
  end

end
