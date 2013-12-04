#!/usr/bin/env ruby
# coding: utf-8

def form(params, &block)
  if [:post,:get].include?(params[:method])
    form_begin = "<form method=\"#{params[:method]}\" action=\"#{params[:action]}\">"
    block.call
    return form_begin + "</form>"
  end

  "<form method=\"post\" action=\"#{params[:action]}\">
    <input type=\"hidden\" name=\"_method\" value=\"#{params[:method]}\"/>
  </form>"
end

def submit(value)
  "<input type=\"submit\" value=#{value}>"
end


puts form(method: :post, action: "/execute") {puts "hola"}
