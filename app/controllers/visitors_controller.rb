class VisitorsController < DeviseController
  # GET /visitors
  # GET /visitors.json
  prepend_before_filter :authenticate_user!, except: [:home, :about]
 
  def show_all
    @visitors = Visitor.all
  end

  def index
    @visitors = Visitor.all

    respond_to do |format|
      format.html # home.html.erb
      format.json { render json: @visitors }
    end
  end

  def home
    if user_signed_in?
      resource = build_resource({})
      respond_with resource
    end
    #respond_to do |format|
    #  format.html # home.html.erb
   # end
  end 
  
  def about
    respond_to do |format|
      format.html 
      
    end
  end
  # GET /visitors/1
  # GET /visitors/1.json
  def show
    @visitor = Visitor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visitor }
    end
  end

  # GET /visitors/new
  # GET /visitors/new.json
  def new
    @visitor = Visitor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visitor }
    end
  end

  # GET /visitors/1/edit
  def edit
    @visitor = Visitor.find(params[:id])
	@visitor.outtime=Time.now.strftime("%H:%M:%S")
	@visitor.save
	@visitors = Visitor.all

   render :action => 'index'
  
  end
  
  def vcard
    @visitor = Visitor.find(params[:id])

    respond_to do |format|
      format.html{render:layout => false} # vcard.html.erb
      format.json { render json: @visitor }
    end
  end

  # POST /visitors
  # POST /visitors.json
  def create
    @visitor = Visitor.new(params[:visitor])

    respond_to do |format|
      if @visitor.save
        format.html { redirect_to @visitor, notice: 'Visitor is successfully created.' }
        format.json { render json: @visitor, status: :created, location: @visitor }
      else
        format.html { render action: "new" }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /visitors/1
  # PUT /visitors/1.json
  def update
    @visitor = Visitor.find(params[:id])

    respond_to do |format|
      if @visitor.update_attributes(params[:visitor])
        format.html { redirect_to @visitor, notice: 'Visitor is successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visitors/1
  # DELETE /visitors/1.json
  def destroy
    @visitor = Visitor.find(params[:id])
    @visitor.destroy

    respond_to do |format|
      format.html { redirect_to visitors_url }
      format.json { head :no_content }
    end
  end

  private

  def authenticate_user!
     unless user_signed_in?
       redirect_to root_path
     end
  end
end
