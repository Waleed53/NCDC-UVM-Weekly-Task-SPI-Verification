
class spi_driver extends uvm_driver #(spi_transaction);

    spi_transaction req;
  
    `uvm_component_utils(spi_driver)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction 

    virtual task run_phase(uvm_phase phase);

        forever begin

            seq_item_port.get_next_item( req );
            send_to_dut( req );
            seq_item_port.item_done();
            
        end       

    endtask
    
    virtual task send_to_dut( spi_transaction req);

            #10ns 
            `uvm_info("SEND_TO_DUT", $sformatf("Packet is \n%s", req.sprint()), UVM_LOW)
                
    endtask
    
    
    virtual function void start_of_simulation_phase(uvm_phase phase);
    
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "\n\nRunning Simulation in spi_driver", UVM_HIGH)
        
    endfunction : start_of_simulation_phase


endclass : spi_driver