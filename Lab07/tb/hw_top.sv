/*-----------------------------------------------------------------
File name     : hw_top.sv
Developers    : Kathleen Meade, Brian Dickinson
Created       : 01/04/11
Description   : lab06_vif hardware top module for acceleration
              : Instantiates clock generator and YAPP interface only for testing - no DUT
Notes         : From the Cadence "SystemVerilog Accelerated Verification with UVM" training
-------------------------------------------------------------------
Copyright Cadence Design Systems (c)2015
-----------------------------------------------------------------*/

module hw_top;

  // Clock and reset signals
  logic [31:0]  clock_period;
  logic         run_clock;
  logic         clock;
  logic         reset;

  // YAPP Interface to the DUT
  yapp_if in0(clock, reset);

  channel_if ch0(clock, reset);
  channel_if ch1(clock, reset);
  channel_if ch2(clock, reset);

  hbus_if hif(clock, reset);
	
  clock_and_reset_if clk_rst_if(
	  .clock(clock),
	  .reset(reset),
	  .run_clock(run_clock),
	  .clock_period(clock_period));


  // CLKGEN module generates clock
  clkgen clkgen (
    .clock(clock),
    .run_clock(1'b1),
    .clock_period(32'd10)
  );

  yapp_router dut(
	  .reset(reset).
	  .clock(clock),

	  .in_data(in0.in_data),
	  .in_data_vld(in0.in_data_vld),
	  .in_suspend(in0.in_suspend),

	  .data_0(ch0.data),
	  .data_vld_0(ch0.data_vld),
	  .suspend_0(ch0.suspend),

	  .data_1(ch1.data),
	  .data_vld_1(ch1.data_vld),
	  .suspend_1(ch1.suspend),

	  .data_2(ch2.data),
	  .data_vld_2(ch2.data_vld),
	  .suspend_2(ch2.suspend),

	  .haddr(hif.haddr),
	  .hdata(hif.hdata_w),
	  .hen(hif.hen),
	  .hwr_rd(hif.hwr_rid));




  initial begin
    reset <= 1'b0;
    in0.in_suspend <= 1'b0;
    @(negedge clock)
      #1 reset <= 1'b1;
    @(negedge clock)
      #1 reset <= 1'b0;
  end

endmodule
