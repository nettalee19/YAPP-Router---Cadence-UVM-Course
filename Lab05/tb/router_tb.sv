class router_tb	extends uvm_env;
	`uvm_component_utils(router_tb)

	yapp_env yapp;

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction 

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TESTBENCH","testbench is being executed", UVM_HIGH)
		//env = new("env", this);
		yapp = yapp_env::type_id::create("yapp", this);

	endfunction

	
endclass
