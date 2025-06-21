


module test;
  class pattern;
    rand bit da[];
    constraint array_size { da.size==10; }
    constraint seq_gen { foreach(da[i])
                              if(i%2==0)
                                da[i]==0;
                        else
                          da[i]==1;
                       }
  endclass : pattern
  pattern p1;
  initial begin
    p1 = new();
    assert(p1.randomize());
    $display("%0p",p1.da);
  end
  
endmodule
