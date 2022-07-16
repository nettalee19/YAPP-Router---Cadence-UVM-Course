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

	import hbus_pkg::*;

	import channel_pkg::*;

	import clock_and_reset_pkg::*;


	`include "router_tb.sv"
	`include "router_test_lib.sv"

	//yapp_packet p1;
	//int ok;
	
	// generate 5 random packets and use the print method
	// to display the results
	
	initial begin
		//run_test("base_test");
		yapp_vif_config::set(null, "uvm_test_top.tb.yapp.tx_agent.*","vif",hw_top.in0);
		
		hbus_vif_config::set(null, "*.tb.hbus.*","vif",hw_top.hif);

		hbus_vif_config::set(null, "*.tb.chan0.*","vif",hw_top.ch0);

		hbus_vif_config::set(null, "*.tb.chan1.*","vif",hw_top.ch1);

		hbus_vif_config::set(null, "*.tb.chan2.*","vif",hw_top.ch2);

		hbus_vif_config::set(null, "*.tb.clock_and_reset*","vif",hw_top.clk_rst_if);




		run_test():
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
