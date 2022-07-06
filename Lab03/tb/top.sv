/*-----------------------------------------------------------------
File name     : top.sv
Description   : lab01_data top module template file
Notes         : From the Cadence "SystemVerilog Advanced Verification with UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2015
-----------------------------------------------------------------*/

module top;
	// import the UVM library
	// include the UVM macros
	import uvm_pkg::*;
	`include "uvm_macros.svh"

	// import the YAPP package
	import yapp_pkg::*;
	`include "router_tb.sv"
	`include "router_test_lib.sv"

	//yapp_packet p1;
	//int ok;
	
	// generate 5 random packets and use the print method
	// to display the results
	
	initial begin
		run_test("base_test");
	end

	/*initial begin
		for(int i = 0 ; i < 5; i++) begin
			p1 = new($sformatf("packet_%0d", i));
			ok = p1.randomize();
			p1.print();
		end
	end*/
	
	
	/*initial begin
		repeat(5)
		p1 = new("p1");
		p1.print();

	end*/

// experiment with the copy, clone and compare UVM method
endmodule : top
