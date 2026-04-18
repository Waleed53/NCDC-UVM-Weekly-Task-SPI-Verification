// 64 bit option for AWS labs
-64

 -uvmhome /home/cc/mnt/XCELIUM2309/tools/methodology/UVM/CDNS-1.1d

// include directories
//*** add incdir include directories here

  -incdir /home/cc/UVM_LABS/SPI_Verification/verification/wishbone_sv
  -incdir /home/cc/UVM_LABS/SPI_Verification/verification/spi_sv
  -incdir /home/cc/UVM_LABS/SPI_Verification/verification/tb

// compile files
//*** add compile files here

/home/cc/UVM_LABS/SPI_Verification/verification/spi_sv/spi_pkg.sv

/home/cc/UVM_LABS/SPI_Verification/verification/wishbone_sv/wb_pkg.sv


/home/cc/UVM_LABS/SPI_Verification/verification/tb/top.sv


+UVM_TESTNAME=base_test
+UVM_VERBOSITY=UVM_HIGH