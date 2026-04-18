class spi_base_seq extends uvm_sequence #(spi_transaction);
  
  // Required macro for sequences automation
  `uvm_object_utils(spi_base_seq)

  // Constructor
  function new(string name="spi_base_seq");
    super.new(name);
  endfunction

  task pre_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.raise_objection(this, get_type_name());
      `uvm_info(get_type_name(), "spi raise objection", UVM_MEDIUM)
    end
  endtask : pre_body

  task post_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.drop_objection(this, get_type_name());
      `uvm_info(get_type_name(), "spi drop objection", UVM_MEDIUM)
    end
  endtask : post_body

endclass : spi_base_seq

//------------------------------------------------------------------------------
//
// SEQUENCE: spi_5_packets
//
//  Configuration setting for this sequence
//    - update <path> to be hierarchial path to sequencer 
//
//  uvm_config_wrapper::set(this, "<path>.run_phase",
//                                 "default_sequence",
//                                 spi_5_packets::get_type());
//
//------------------------------------------------------------------------------
class spi_5_packets extends spi_base_seq;
  
  // Required macro for sequences automation
  `uvm_object_utils(spi_5_packets)

  // Constructor
  function new(string name="spi_5_packets");
    super.new(name);
  endfunction

  // Sequence body definition
  virtual task body();
    `uvm_info(get_type_name(), "Executing spi_5_packets sequence", UVM_LOW)
     repeat(5)
      `uvm_do(req)
  endtask
  
endclass : spi_5_packets
