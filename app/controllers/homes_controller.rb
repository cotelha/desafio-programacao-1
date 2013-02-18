require "upload_import_sales_to_db"
# coding: utf-8
class HomesController < ApplicationController  
  def index
  	@sum_sale = Sale.select("sum(sales.item_price*purchase_count) as vlr_compra ").first.vlr_compra
  end

  def import  	
    respond_to do |format|
      if UploadAndImportSalesToDb.new(params[:file]).import_to_db
        format.html { redirect_to homes_index_path, :notice => 'Dados importados com sucesso.' }        
      else
        format.html { redirect_to homes_index_path, :alert => 'Erro ao importar arquivo. Verifique seu arquivo e tente novamente.' }        
      end
    end    

  end
end
