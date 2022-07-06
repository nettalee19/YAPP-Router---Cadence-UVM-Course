class yapp_tx_sequencer extends uvm_sequncer #(yapp_packet);
	`uvm_component_utils(yapp_sequncer)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction
endclass
