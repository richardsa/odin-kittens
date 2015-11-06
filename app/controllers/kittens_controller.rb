class KittensController < ApplicationController
  def index
    @kittens = Kitten.all
    respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @kittens }
          format.json { render :json => @kittens }
    end
  end
  
  def show 
    @kitten = Kitten.find(params[:id])
    respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @kitten }
          format.json { render :json => @kitten }
    end
  end
  
  
  def new 
    @kitten = Kitten.new
  end
  
  def edit 
   @kitten = Kitten.find(params[:id])
  end
  
  def create
  @kitten = Kitten.new(kitten_params)
    if @kitten.save
       redirect_to kittens_path
    else
      render 'new'
    end
  end
  
  
  def update 
  @kitten = Kitten.find(params[:id])
   respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to @kitten, notice: 'Kitten was successfully updated.' }
        format.json { render :show, status: :ok, location: @kitten }
      else
        format.html { render :edit }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end
  
   def destroy
   @kitten = Kitten.find(params[:id])
    @kitten.destroy
    respond_to do |format|
      format.html { redirect_to kittens_url, notice: 'Kitten was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private 
   def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness) 
   end
end


