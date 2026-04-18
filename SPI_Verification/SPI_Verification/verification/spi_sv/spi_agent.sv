class spi_agent extends uvm_agent;
  
    // component handles
    spi_sequencer sequencer;
    spi_driver driver;
    spi_monitor monitor;
    
    uvm_active_passive_enum is_active = UVM_ACTIVE;

    //  Add a component utility macro and a component constructor
    `uvm_component_utils_begin(spi_agent)

        `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)

    `uvm_component_utils_end

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        
        super.build_phase(phase);
        monitor = spi_monitor::type_id::create("monitor",this);

        if(get_is_active() == UVM_ACTIVE ) begin
            sequencer = spi_sequencer::type_id::create("sequencer",this);
            driver = spi_driver::type_id::create("driver",this);
        end

    endfunction : build_phase

    virtual function void connect_phase(uvm_phase phase);

        if(get_is_active() == UVM_ACTIVE ) begin
            driver.seq_item_port.connect(sequencer.seq_item_export);
        end

    endfunction : connect_phase
    
    virtual function void start_of_simulation_phase(uvm_phase phase);
    
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "\n\nRunning Simulation in SPI_agent", UVM_HIGH)
        
    endfunction : start_of_simulation_phase

endclass : spi_agent