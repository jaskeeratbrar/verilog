module part1(A,B,C,D,F);
input A,B,C,D;
output F;
wire f1,f2,f3,s1,s2,s3,t1;

not u1(f1,B);
not u2(f2,C);
not u3(f3,D);

xor u4(s1,A,f1);
xor u5(s2,B,f2);
xor u6(s3,C,f3);

or u7(t1,s1,s2);
or u8(F,t1,s3);

endmodule

module testbench(a,b,c,d,F);
input F;
output a,b,c,d;
reg [3:0]x;
reg a,b,c,d;

integer i;
initial begin
$monitor("a:%b b:%b c:%b d:%b F:%b", a,b,c,d,F);

for(i=0; i<16 ; i=i+1)
begin x=i;
a=x[3];
b=x[2];
c=x[1];
d=x[0];
#10000; end
$finish;
end
endmodule
