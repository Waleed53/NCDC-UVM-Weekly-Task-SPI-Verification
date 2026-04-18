// Extend from uvm_monitor. Remember monitors do not have type parameters
class wb_monitor extends uvm_monitor;
       

    `uvm_component_utils(wb_monitor)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    

    virtual task run_phase(uvm_phase phase);
        
        `uvm_info("Monitor", "You are in WBMonitor" , UVM_LOW)

    endtask : run_phase
    
    
    
    virtual function void start_of_simulation_phase(uvm_phase phase);
    
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "\n\nRunning Simulation in wb_monitor", UVM_HIGH)
        
    endfunction : start_of_simulation_phase


endclass : wb_monitor