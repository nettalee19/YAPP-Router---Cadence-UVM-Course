class yapp_env extends uvm_env;
	`uvm_component_utils(yapp_env)

	yapp_tx_agent agent;

	function new(string name, uvm_component parent);
		super.new(name, parent)
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//agent = new("agent", this);
		agent = yapp_tx_agent::type_id::create("agent", this);

	endfunction


endclass
