

class wb_spi_transaction extends uvm_sequence_item;

  // Randomizable fields (master-driven inputs)
  rand bit [2:0] adr_i;      // Address
  rand bit we_i;             // Write enable (1 = write, 0 = read)
  rand bit [7:0] dat_i;      // Data for write
  rand bit cyc_i;            // Bus cycle
  rand bit stb_i;            // Strobe
  
     // Register class with UVM factory
  `uvm_object_utils_begin(wb_spi_transaction)
  
	  `uvm_field_int(adr_i, UVM_ALL_ON)
	  `uvm_field_int(we_i, UVM_ALL_ON)
	  `uvm_field_int(dat_i, UVM_ALL_ON)
	  `uvm_field_int(cyc_i, UVM_ALL_ON)
	  `uvm_field_int(stb_i, UVM_ALL_ON)

  `uvm_object_utils_end

  // Constructor
  function new(string name = "wb_spi_transaction");
    super.new(name);
  endfunction

  // Optional: display method
  function void display();
    $display("WISHBONE Transaction: adr=%0h, we=%0b, dat=%0h, cyc=%0b, stb=%0b", 
             adr_i, we_i, dat_i, cyc_i, stb_i);
  endfunction

/*
  // Constraints (optional but recommended)
  constraint valid_signals {
    adr_i inside {[0:7]};       // valid 3-bit address range
    if (cyc_i) stb_i == 1;      // strobe only valid when cycle active
  }

*/

endclass

