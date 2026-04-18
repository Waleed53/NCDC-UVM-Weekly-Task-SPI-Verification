

class spi_transaction extends uvm_sequence_item;


  localparam int SS_WIDTH = 1;  

  // Randomizable fields (master-driven)
  rand bit [7:0] mosi;            // Data sent to slave
  rand bit [SS_WIDTH-1:0] ss;     // Slave select (active low)
  
  
    // Register class with UVM factory
  `uvm_object_utils_begin(spi_transaction)
  
	  `uvm_field_int(mosi, UVM_ALL_ON)
	  `uvm_field_int(ss, UVM_ALL_ON)

  `uvm_object_utils_end

  // Constructor
  function new(string name = "spi_transaction");
    super.new(name);
  endfunction

  // Optional: display method
  function void display();
    $display("SPI Transaction: MOSI=%0h, SS=%0b", mosi, ss);
  endfunction
/*
  // Constraints (optional)
  constraint valid_ss {
    // Example: ensure at least one slave is selected
    ss != 0;
  }

*/

endclass

