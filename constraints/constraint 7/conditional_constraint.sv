


// conditional constraint 1
module conditional_constr;
	class voter_id;
		rand bit [5:0] age;		// 0-63
		rand enum{YES,NO} eligible;
		constraint age_range { if (eligible==YES) age > 18;
							   else age < 18;
							 }
	endclass
	initial begin
		voter_id v_h;
		v_h = new();
		repeat(10) begin
			assert(v_h.randomize());
			$display("age=%0d and if eligible for voter_id - %s",v_h.age,v_h.eligible);
		end
	end
endmodule
