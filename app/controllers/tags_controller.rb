class TagsController < ApplicationController
  layout 'simplex'

  # GET /tags
  # GET /tags.xml
  def index
    @tags = Tags.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.xml
  def show
    @tags = Tags.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  # GET /tags/new
  # GET /tags/new.xml
  def new
    @tags = Tags.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tags }
    end
  end

  # GET /tags/1/edit
  def edit
    @tags = Tags.find(params[:id])
  end

  # POST /tags
  # POST /tags.xml
  def create
    @tags = Tags.new(params[:tags])

    respond_to do |format|
      if @tags.save
        flash[:notice] = 'Tags was successfully created.'
        format.html { redirect_to(@tags) }
        format.xml  { render :xml => @tags, :status => :created, :location => @tags }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tags.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    @tags = Tags.find(params[:id])

    respond_to do |format|
      if @tags.update_attributes(params[:tags])
        flash[:notice] = 'Tags was successfully updated.'
        format.html { redirect_to(@tags) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tags.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
    @tags = Tags.find(params[:id])
    @tags.destroy

    respond_to do |format|
      format.html { redirect_to(tags_url) }
      format.xml  { head :ok }
    end
  end
end
