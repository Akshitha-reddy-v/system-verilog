



// soft constraint
// Scenario 1 - addr between 0-3
class packet;
	rand bit [7:0] data;	// 0-255
	rand bit [3:0] addr;	// 0-15
	constraint addr_range { soft addr > 4; }								
	constraint data_values { data inside {[15:65],200,[210:220]}; }			
endclass
packet pkt1;
module test;
	initial begin
		pkt1 = new();
		repeat(10) begin
			assert(pkt1.randomize() with { addr < 4; });	// 0-3
			$display("%0p",pkt1);
		end
	end
endmodule

// Scenario 2 - addr between 5-15
class packet;
	rand bit [7:0] data;	// 0-255
	rand bit [3:0] addr;	// 0-15
	constraint addr_range { addr > 4; }	// 5-15							
	constraint data_values { data inside {[15:65],200,[210:220]}; }			
endclass
packet pkt1;
module test;
	initial begin
		pkt1 = new();
		repeat(10) begin
			assert(pkt1.randomize() with {soft addr < 4; });	
			$display("%0p",pkt1);
		end
	end
endmodule
