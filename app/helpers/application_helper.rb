module ApplicationHelper
  def login_stuff
    if current_user
      link_to(current_user.name, current_user) + ' &nbsp&nbsp' + link_to('log out', user_session_path(current_user_session), :method => :delete)
    else
      link_to('log in', new_user_session_path) + ' ' + link_to('sign up', new_user_path)
    end
  end
  
  def resource_links
    ['projects', 'users', 'locations', 'roles', 'calls'].map do |res|
      link_to(res, '/' + res)
    end
  end

  def google_analytics
    <<-GOOGLE_ANALYTICS
    <script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
    try {
    var pageTracker = _gat._getTracker("UA-10943745-1");
    pageTracker._trackPageview();
    } catch(err) {}</script>
    GOOGLE_ANALYTICS
  end
end
