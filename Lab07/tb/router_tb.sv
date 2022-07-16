class router_tb	extends uvm_env;
	`uvm_component_utils(router_tb)

	yapp_env yapp;

	channel_env chan0;
	channel_env chan1;
	channel_env chan2;

	hbus_env hbus;

	clock_and_reset_env clock_and_reset;

	function new(string name, uvm_component parent);
		super.new(name,parent);
	endfunction 

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("TESTBENCH","testbench is being executed", UVM_HIGH)
		//env = new("env", this);
		yapp = yapp_env::type_id::create("yapp", this);

		uvm_config_int::set(this, "chan0", "channel_id", 0);
		uvm_config_int::set(this, "chan1", "channel_id", 1);
		uvm_config_int::set(this, "chan2", "channel_id", 2);
		yapp = yapp_env::type_id::create("chan0", this);
		yapp = yapp_env::type_id::create("chan1", this);
		yapp = yapp_env::type_id::create("chan2", this);

		uvm_config_int::set(this, "hbus", "num_masters", 1);
		uvm_config_int::set(this, "hbus", "num_slaves", 0);
		yapp = yapp_env::type_id::create("hbus", this);

		clock_and_reset = clock_and_reset_env::type_id::create("clock_and_reset", this);


	endfunction

	
endclass
