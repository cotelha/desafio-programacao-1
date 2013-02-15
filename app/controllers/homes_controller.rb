# coding: utf-8
require 'csv'

class HomesController < ApplicationController  
  def index
  	@sum_sale = Sale.select("sum(sales.item_price*purchase_count) as vlr_compra ").first.vlr_compra
  end

  def import
  	
	 	unless params[:file].blank? then
			parseado = CSV.parse( File.open('import', 'r') { |f| params[:file].read }.force_encoding("UTF-8"), col_sep: "\t" ) 
			#head = parseado.first.map{|x| x.gsub(" ", "_")}
			parseado.delete_at(0) # delete first row
			parseado.each do |c|
				Sale.create(
				:purchaser_name=>c[0],
				:item_description=>c[1],
				:item_price=>c[2],
				:purchase_count=>c[3],
				:merchant_address=>c[4],
				:merchant_name=>c[5]
				)
			end 
		end		

    respond_to do |format|
      unless params[:file].blank?
        format.html { redirect_to homes_index_path, :notice => 'Dados importados com sucesso.' }        
      else
        format.html { redirect_to homes_index_path, :alert => 'Erro ao importar arquivo. Verifique seu arquivo e tente novamente.' }        
      end
    end    

  end
end
