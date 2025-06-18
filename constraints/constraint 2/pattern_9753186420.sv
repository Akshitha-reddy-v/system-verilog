module test;
  class seq;
    rand bit [3:0] da[];
    constraint c1 { da.size==10; }
    constraint c2 { foreach(da[i])
                      if(i<5)
                        da[i] == 9-(2*i);
                      else
                        da[i] == 18-(2*i);
                  }
  endclass
  seq s1;
  initial begin
    s1 = new();
    assert(s1.randomize());
    $display("%0p",s1.da);
  end
endmodule
