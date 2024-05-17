module ApplicationHelper
    def page_title(title = '')
        base_title = '筋トレ日記'
        title.present? ? "#{title} | #{base_title}" : base_title
    end
end
