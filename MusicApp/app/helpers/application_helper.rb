module ApplicationHelper
  include ERB::Util
  def auth_token
    "<input
      type='hidden'
      name='authenticity_token'
      value='#{form_authenticity_token}'>".html_safe
  end

  def delete_button_to(action_url, button_text, method = "DELETE")
    str = "<form action='#{action_url}' method='POST'>"\
            "#{auth_token}"\
            "<input type='hidden' name='_method' value='#{method}'>"\
            "<input type='submit' value='#{button_text}'>"\
          "</form>".html_safe
  end

  def ugly_lyrics(lyrics)
    result = ""
    lyrics.each_line { |l| result << "&#9835; #{l}" }
    "<pre>#{result}</pre>".html_safe
  end
end
