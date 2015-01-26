class TestsController < ApplicationController
  def show
    template = Spot::Parser.generate_html(params[:id].to_sym, Mock.new('extras'))
    render layout: false, inline: template
  end
end
