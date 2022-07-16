class yapp_tx_monitor extends uvm_monitor;
	`uvm_component_utils(yapp_tx_monitor)

	virtual interface yapp_if vif;

	yapp_packet pkt;

	// Count packets collected
  	int num_pkt_col;

	function new(string name, uvm_component parent);
		super.new(name, parent)
	endfunction

	virtual task run_phase();
		//`uvm_info("monitor", "you are in the monitor" ,UVM_LOW);

		 @(posedge vif.reset)
    		@(negedge vif.reset)
    		`uvm_info(get_type_name(), "Detected Reset Done", UVM_MEDIUM)
    		forever begin 
      		// Create collected packet instance
      		pkt = yapp_packet::type_id::create("pkt", this);

      		// concurrent blocks for packet collection and transaction recording
      		fork
        		// collect packet
        		vif.collect_packet(pkt.length, pkt.addr, pkt.payload, pkt.parity);
        		// trigger transaction at start of packet
        		@(posedge vif.monstart) void'(begin_tr(pkt, "Monitor_YAPP_Packet"));
      		join

      		pkt.parity_type = (pkt.parity == pkt.calc_parity()) ? GOOD_PARITY : BAD_PARITY;
      		// End transaction recording
      		end_tr(pkt);
      		`uvm_info(get_type_name(), $sformatf("Packet Collected :\n%s", pkt.sprint()), UVM_LOW)
      		num_pkt_col++;

	endtask

	function void connect_phase();
		if(!yapp_vif_config::get(this, get_full_name(), "vif", vif))
			`uvm_error("NOVIF", {"virtual interface must be set for: ", get_full_name(), "vif"})
	endfunction
endclass
