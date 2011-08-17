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

  def it_has_resource_routing(controller_name)
    method_name = controller_name.gsub('/', '_')
    index_route = "/#{controller_name}"
    index_method = method_name + '_path'
    show_route = "#{index_route}/42"
    show_method = method_name.singularize + '_path'
    new_route = "#{index_route}/new"
    new_method = 'new_' + show_method
    create_route = index_route
    edit_route = "#{show_route}/edit"
    edit_method = 'edit_' + show_method
    update_route = show_route
    destroy_route = show_route

    it "has a resource route to the index action" do
      {:get => index_route}.should route_to(:controller => controller_name, :action => 'index')
      send(index_method).should == index_route
    end

    it "has a resource route to the show action" do
      {:get => show_route}.should route_to(:controller => controller_name, :action => 'show', :id => '42')
      send(show_method, '42').should == show_route
    end

    it "has a resource route to the new action" do
      {:get => new_route}.should route_to(:controller => controller_name, :action => 'new')
      send(new_method).should == new_route
    end

    it "has a resource route to the create action" do
      {:post => create_route}.should route_to(:controller => controller_name, :action => 'create')
    end

    it "has a resource route to the edit action" do
      {:get => edit_route}.should route_to(:controller => controller_name, :action => 'edit', :id => '42')
      send(edit_method, '42').should == edit_route
    end

    it "has a resource route to the update action" do
      {:put => update_route}.should route_to(:controller => controller_name, :action => 'update', :id => '42')
    end

    it "has a resource route to the destroy action" do
      {:delete => destroy_route}.should route_to(:controller => controller_name, :action => 'destroy', :id => '42')
    end
  end
end

RSpec.configure do |config|
  config.extend(CustomControllerMacros, :type => :controller)
end
