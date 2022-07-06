/*-----------------------------------------------------------------
File name     : run.f
Description   : lab02_data simulator run template file
Notes         : From the Cadence "SystemVerilog Advanced Verification
with UVM training"
------------------------------------------------------------------
Copyright Cadence Design Systems (c)2015
-----------------------------------------------------------------*/

 -uvmhome $UVMHOME
 -incdir ../sv

+UVM_TESTNAME=base_test
+UVM_VERBOSITY=UVM_HIGH

// include directories
//*** add incdir include directories here
../sv/yapp_pkg.sv

// compile files
//*** add compile files here
top.sv
