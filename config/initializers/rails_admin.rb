RailsAdmin.config do |config|
  config.main_app_name = ["gallery",]

  #config.attr_accessible_role { :default }

  config.label_methods << :description # Default is [:name, :title]

  config.actions do
    # root actions
    dashboard                     # mandatory
    # collection actions
    index                         # mandatory
    new
    export
    history_index
    bulk_delete
    # member actions
    show
    edit
    delete
    history_show
    show_in_app
  end

end