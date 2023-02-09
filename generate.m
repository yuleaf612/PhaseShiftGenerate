% 生成三频四步条纹光栅图案
clc,clear;
width = 1280;
height = 720;
Ih = zeros(height,width,12);
Iv = zeros(height,width,12);

Ia = 135;
Ib = 100;
s = 10;
f = [(s+1)*(s+1),s*(s+1),s*s];
f = f/width;
for j=1:width
    for k=1:3
        Ih(:,j,(k-1)*4+1) = round(Ia+Ib*cos(2*pi*f(k)*(j-0.5)+0*pi/2));
        Ih(:,j,(k-1)*4+2) = round(Ia+Ib*cos(2*pi*f(k)*(j-0.5)+1*pi/2));
        Ih(:,j,(k-1)*4+3) = round(Ia+Ib*cos(2*pi*f(k)*(j-0.5)+2*pi/2));
        Ih(:,j,(k-1)*4+4) = round(Ia+Ib*cos(2*pi*f(k)*(j-0.5)+3*pi/2));
    end
end
for n=1:12
    strNum = num2str(n+3);
    filename = ['generatePic3\',strNum,'.bmp'];
    imwrite(uint8(Ih(:,:,n)),filename);
end

s = 8;
f = [(s+1)*(s+1),s*(s+1),s*s];
f = f/height;
for i=1:height
    for k=1:3
        Iv(i,:,(k-1)*4+1) = round(Ia+Ib*cos(2*pi*f(k)*(i-0.5)+0*pi/2));
        Iv(i,:,(k-1)*4+2) = round(Ia+Ib*cos(2*pi*f(k)*(i-0.5)+1*pi/2));
        Iv(i,:,(k-1)*4+3) = round(Ia+Ib*cos(2*pi*f(k)*(i-0.5)+2*pi/2));
        Iv(i,:,(k-1)*4+4) = round(Ia+Ib*cos(2*pi*f(k)*(i-0.5)+3*pi/2));
    end
end
for n=1:12
    strNum = num2str(n+3+12);
    filename = ['generatePic3\',strNum,'.bmp'];
    imwrite(uint8(Iv(:,:,n)),filename);
end

% 黑白图案
Iblack = zeros(height,width);
Iwhite = ones(height,width)*255;
imwrite(uint8(Iblack),'generatePic3\2.bmp');
imwrite(uint8(Iwhite),'generatePic3\3.bmp');

% 十字图
Icross = ones(height,width)*255;
centerx = round(0.5*width);
centery = round(0.5*height);
Icross(:,centerx-3:centerx+3) = 0;
Icross(centery-3:centery+3,:) = 0;
imwrite(uint8(Icross),'generatePic2\1.bmp');




