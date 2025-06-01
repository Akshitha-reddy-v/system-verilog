
// pattern - 0123456789

module test;
  class pattern;
    rand int da[];
    constraint da_size { da.size==10; }
    constraint pattern_gen { foreach(da[i])
      							              da[i]==i;
                           }
  endclass : pattern
  pattern p1;
  initial begin
    p1 = new;
    assert(p1.randomize());
    $display("%0p",p1.da);
  end
endmodule
