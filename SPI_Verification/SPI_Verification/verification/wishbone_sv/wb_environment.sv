class wb_environment extends uvm_env;

    // Add a handle for the wb_agent
    wb_agent agent;

    // Add a component utility macro and a component constructor
    `uvm_component_utils(wb_environment)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);

        agent = wb_agent::type_id::create("agent",this);

    endfunction : build_phase
    
    virtual function void start_of_simulation_phase(uvm_phase phase);
    
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "\n\nRunning Simulation in wb_environment", UVM_HIGH)
        
    endfunction : start_of_simulation_phase



endclass : wb_environmentironment