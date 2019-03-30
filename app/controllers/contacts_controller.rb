class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show; end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.properties.build
  end

  # GET /contacts/1/edit
  def edit; end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:full_name,
                                    :date_of_birth,
                                    :present_address,
                                    :community,
                                    :length_of_stay_at_present_address,
                                    :mobile,
                                    :occupation,
                                    :email,
                                    :personal_property,
                                    :jointly_owned_property,
                                    :agent,
                                    :has_authority_from_owner,
                                    :has_site_plan,
                                    :site_plan_request,
                                    :search_report,
                                    :search_report_request,
                                    :valuation_report,
                                    :valuation_report_request,
                                    :type_of_service,
                                    :request_details,
                                    :request_date,
                                    :client_signature,
                                    :user_id,
                                    :signature_of_authorized_broker,
                                    properties_attributes: %i[_destroy
                                                              id
                                                              name
                                                              description
                                                              location
                                                              category
                                                              property_type])
  end
end
