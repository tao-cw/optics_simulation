DW=I(PY1:PY2,PX1:PX2,:);
 figure;
imshow(DW),title('车牌定位后图像');
 imwrite(DW,'dw.jpg');
