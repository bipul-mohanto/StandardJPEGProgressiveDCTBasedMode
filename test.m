clear all
clc

Im=double(imread('LAKE.TIF'));
[L H R1]=LF(Im);
[LL LH R2]=LF(rot90(L,1));
[HL HH R3]=LF(rot90(H,1));
LL=rot90(LL,3);
LH=rot90(LH,3);
HL=rot90(HL,3);
HH=rot90(HH,3);
imnew=[[LL;LH],[HL;HH]];
Recon=[R2;R3];
figure,
imshow(Recon,[]);
% figure,imshow(R,[]);