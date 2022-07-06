class base_test extends uvm_test;
	`uvm_component_utils(base_test)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	router_tb tb;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		`uvm_info("test", "the build phase of the test is being executed." ,UVM_HIGH);

		uvm_config_wrapper::set(this, "tb.env.agent.sequncer.run_phase", 
					"default_sequence",
					yapp_5_packets::get_type());
		tb = new("tb", this);
	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

endclass

class test2 extends base_test;
	`uvm_component_utils(test2);

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

endclass
