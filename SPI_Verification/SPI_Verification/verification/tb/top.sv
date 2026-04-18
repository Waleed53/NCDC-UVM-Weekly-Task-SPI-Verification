`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;


// Import your transaction packages
import wb_pkg::*;             // Assuming wb_spi_transaction is in wb_pkg
import spi_pkg::*;            // Assuming spi_transaction is in spi_pkg

// Include testbench and test files

`include "spi_tb.sv"
`include "spi_test_lib.sv"

module top;

  // starting UVM test
  initial begin
  
    run_test();
    
  end

endmodule : top


/*
import uvm_pkg::*;            // Import UVM library
`include "uvm_macros.svh"

// Import your transaction packages
import wb_pkg::*;             // Assuming wb_spi_transaction is in wb_pkg
import spi_pkg::*;            // Assuming spi_transaction is in spi_pkg

module top;

  // Transaction objects
  wb_spi_transaction wb_txn;
  spi_transaction    spi_txn;

  initial begin
    int i;

    $display("\nGenerating 5 random WISHBONE + SPI transactions\n");

    // Loop 5 times to generate random transactions
    for (i = 0; i < 5; i++) begin
      // Create WISHBONE transaction via factory
      wb_txn = wb_spi_transaction::type_id::create($sformatf("wb_txn_%0d", i));
      assert(wb_txn.randomize());   // Randomize fields
      wb_txn.print();               // Print transaction fields

      // Create SPI transaction via factory
      spi_txn = spi_transaction::type_id::create($sformatf("spi_txn_%0d", i));
      assert(spi_txn.randomize());  // Randomize fields
      spi_txn.print();              // Print transaction fields

      $display("--------------------------------------------------------\n");
    end

    $display("All transactions generated successfully.\n");

    $finish;
  end

endmodule

*/