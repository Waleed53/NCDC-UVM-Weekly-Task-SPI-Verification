class spi_tb extends uvm_env;

    spi_environment spi_env;
    wb_environment wb_env;

    `uvm_component_utils(spi_tb)
   
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction 
  
    function void build_phase(uvm_phase phase);
   
      super.build_phase(phase);
      `uvm_info("BUILD", "Testbench build_phase is being executed", UVM_HIGH)
      
      spi_env = spi_environment::type_id::create("spi_env",this); 
      wb_env = wb_environment::type_id::create("wb_env",this); 

    endfunction : build_phase
    
    virtual function void start_of_simulation_phase(uvm_phase phase);
    
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "\n\nRunning Simulation in spi_tb", UVM_HIGH)
        
    endfunction : start_of_simulation_phase

endclass : spi_tb
