class base_test extends uvm_test;
	`uvm_component_utils(base_test)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	router_tb tb;

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		
		//`uvm_info("test", "the build phase of the test is being executed." ,UVM_HIGH);

		uvm_config_int::set( this, "*", "recording_detail", 1);

		//uvm_config_wrapper::set(this, "tb.env.agent.sequncer.run_phase", "default_sequence",	yapp_5_packets::get_type());
		//tb = new("tb", this);
		tb = router_tb::type_id::create("tb", this);

	endfunction

	function void end_of_elaboration_phase(uvm_phase phase);
		uvm_top.print_topology();
	endfunction

	function void check_phase(uvm_phase phase);
		check_config_usage();
	endfunction

	task run_phase (uvm_phase phase);
		uvm_objection obj = phase.get_objection();
		obj.set_drain_time(this. 200ns);
	endtask

endclass





class simple_test extends base_test;
	`uvm_component_utils(simple_test)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		set_type_override_by_type(yapp_packet::get_type(), short_yapp_packet::get_type());

		uvm_config_wrapper::set(this, "tb.yapp.tx_agent.sequncer.run_phase", "default_sequence",	yyapp_012_seq::type_id::get());

		uvm_config_wrapper::set(this, "tb.clock_and_reset.agent.sequncer.run_phase", "default_sequence",	clk10_rst5_seq::type_id::get());

		uvm_config_wrapper::set(this, "tb.chan?.rx_agent.sequncer.run_phase", "default_sequence",	ychannel_rx_resp_seq::type_id::get());


		super.build_phase(phase);
	endfunction
endclass






class test2 extends base_test;
	`uvm_component_utils(test2);

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

endclass

class short_packet_test extends base_test;
	`uvm_component_utils(short_packet_test)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
			//short_yapp_packet::type_id::set_type_override(yapp_packet::get_type());
		yapp_packet::type_id::set_type_override(short_yapp_packet::get_type());
		uvm_config_wrapper::set(this, "tb.env.agent.sequncer.run_phase", "default_sequence",	yapp_5_packets::get_type());

		super.build_phase(phase);

	endfunction

endclass


class set_config_test extends base_test;
	`uvm_component_utils(set_config_test)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		uvm_config_int::set(this, "tb.yapp.agent" , "is_active" , UVM_PASSIVE);
		super.build_phase(phase);
	endfunction

endclass





class incr_payload_test extends base_test;
	`uvm_component_utils(incr_payload_test)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		yapp_packet::type_id::set_type_override(short_yapp_packet::get_type());
		uvm_config_wrapper::set(this, "tb.yapp.agent.sequncer.run_phase", "default_sequence",	
			yapp_incr_payload_seq::get_type());

		super.build_phase(phase);
	endfunction

endclass







class exhaustive_seq_test extends base_test;
	`uvm_component_utils(exhaustive_seq_test)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		yapp_packet::type_id::set_type_override(short_yapp_packet::get_type());
		uvm_config_wrapper::set(this, "tb.yapp.agent.sequncer.run_phase", "default_sequence",	
			yapp_exhaustive_seq::get_type());

		super.build_phase(phase);
	endfunction

endclass





class short_yapp_012 extends base_test;
	`uvm_component_utils(short_yapp_012)

	function new(string name, uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		yapp_packet::type_id::set_type_override(short_yapp_packet::get_type());
		uvm_config_wrapper::set(this, "tb.yapp.agent.sequncer.run_phase", "default_sequence",	
			short_yapp_012::get_type());

		super.build_phase(phase);
	endfunction

endclass
