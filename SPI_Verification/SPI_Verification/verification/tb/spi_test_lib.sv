// Base Test Class
class base_test extends uvm_test;

  // UVM component utility macro
  `uvm_component_utils(base_test)
  
  // tb handle
  spi_tb tb;
  
  // component constructor
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction : new
  
  // Build phase
  function void build_phase(uvm_phase phase);
  
    super.build_phase(phase);
    `uvm_info("BUILD", "Test build_phase is being executed", UVM_HIGH)
    
    // constructing tb instance
    tb = spi_tb::type_id::create("tb", this);

  endfunction : build_phase
  
  // End of elaboration phase
  function void end_of_elaboration_phase(uvm_phase phase);
  
    super.end_of_elaboration_phase(phase);
    
    // printing UVM hierarchy
    uvm_top.print_topology();
    
  endfunction : end_of_elaboration_phase

endclass : base_test


// Test2 
class test2 extends base_test;

  // UVM component macro
  `uvm_component_utils(test2)
  
  // component constructor
  function new(string name, uvm_component parent);
  
    super.new(name, parent);
    
  endfunction : new

endclass : test2