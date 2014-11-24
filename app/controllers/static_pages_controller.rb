class StaticPagesController < ApplicationController
  def home
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "invoice", # pdf will download as file_name.pdf
              :template => 'static_pages/home.html.erb',
              :layout => 'pdf', # uses views/layouts/pdf.html.erb
              :show_as_html => params[:debug].present?, # renders html version if you set debug=true in URL
              :save_to_file => Rails.root.join('pdfs', 'invoice.pdf')

        # or from your controller, using views & templates and all wicked_pdf options as normal
        # pdf = render_to_string :pdf => "some_file_name", :template => "static_pages/home.html.erb", :encoding => "UTF-8"
        #
        # # then save to a file
        # save_path = Rails.root.join('pdfs','filename.pdf')
        # File.open(save_path, 'wb') do |file|
        #   file << pdf
        # end
      end
    end
  end

  def help
  end
end

##make a real html template next time you come in which matches the invoice
