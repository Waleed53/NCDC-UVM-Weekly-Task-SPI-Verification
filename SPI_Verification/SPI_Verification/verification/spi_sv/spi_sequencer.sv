
class spi_sequencer extends uvm_sequencer #(spi_transaction);

    `uvm_component_utils(spi_sequencer)

    function new(string name, uvm_component parent);
    
        super.new(name, parent);
        
    endfunction
    
    virtual function void start_of_simulation_phase(uvm_phase phase);
    
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "\n\nRunning Simulation in spi_sequencer", UVM_HIGH)
        
    endfunction : start_of_simulation_phase


endclass : spi_sequencer
