
// write the constraints to generate the sequence 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 1 0 2 0 3 0 4 0 5
module tb;
        class seq;
                rand bit [3:0] arr[];
                constraint c1 {arr.size==28;}
                constraint c2 {foreach(arr[i])
                                        if(i%2==0)
                                                arr[i] == 0;
                                        else if(i<18)
                                                arr[i] == i-((i-1)/2);
                                        else
                                                arr[i] == ((i+1)/2)-9;
                                }
        endclass
        seq s1;
        initial begin
                s1 = new();
                assert(s1.randomize());
                $display("%0p",s1.arr);
        end
endmodule
