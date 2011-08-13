module CustomControllerMacros
  def it_has_singular_resource_routing(controller_name)
    singular_name = controller_name.singularize
    show_route = "/#{singular_name}"
    new_route = "/#{singular_name}/new"
    create_route = show_route
    edit_route = "/#{singular_name}/edit"
    update_route = show_route
    destroy_route = show_route

    it "has a singular resource route to the show action" do
      {:get => show_route}.should route_to(:controller => controller_name, :action => 'show')
      eval("#{singular_name}_path").should == show_route
    end

    it "has a singular resource route to the new action" do
      {:get => new_route}.should route_to(:controller => controller_name, :action => 'new')
      eval("new_#{singular_name}_path").should == new_route
    end

    it "has a singular resource route to the create action" do
      {:post => create_route}.should route_to(:controller => controller_name, :action => 'create')
    end

    it "has a singular resource route to the edit action" do
      {:get => edit_route}.should route_to(:controller => controller_name, :action => 'edit')
      eval("edit_#{singular_name}_path").should == edit_route
    end

    it "has a singular resource route to the update action" do
      {:put => update_route}.should route_to(:controller => controller_name, :action => 'update')
    end

    it "has a singular resource route to the destroy action" do
      {:delete => destroy_route}.should route_to(:controller => controller_name, :action => 'destroy')
    end
  end
end

RSpec.configure do |config|
  config.extend(CustomControllerMacros, :type => :controller)
end
