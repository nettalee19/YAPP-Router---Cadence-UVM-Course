class yapp_tx_monitor extends uvm_monitor;
	`uvm_component_utils(yapp_tx_monitor)

	function new(string name, uvm_component parent);
		super.new(name, parent)
	endfunction

	virtual task run_phase();
		`uvm_info("monitor", "you are in the monitor" ,UVM_LOW);
	endtask
endclass
