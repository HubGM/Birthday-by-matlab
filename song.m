clear

 A4 = 440;%标准音A4，不同的曲调音调不同，scale的取值范围不同

 pt = 44100;p0 = pt/2;%频率

 scale = A4/2^(9/12)*2.^((-12:11)/12);%这里可以调节音调高低，e.g.：改变式子中的-12：11为0：23

 map = [1 3 5 6 8 10 12 13 15 17 18 20 22 24 25];%音符

 score = [5 5 6 5 8 7 5 5 6 5 9 8 5 5 12 10 8 7 6 6 11 11 10 8 9 8];

 rhythm = [0.5 0.5 1 1 1 2 0.5 0.5 1 1 1 2  0.5 0.5 1 1 1  0.5 0.5 2 0.5 0.5 1 1 1 2];%节拍

data = zeros(1,551250);

for i=1:length(score) %生成生日歌的编码

    perdata = sin((1:rhythm(i)*p0)/pt*2*pi*scale(map(score(i))));

    [dm,dn(i)] = size(perdata);

    data(1,(sum(dn)-dn(i)+1):sum(dn)) = perdata;

end

bofang = audioplayer(data,pt+1000);

play(bofang)   %播放生日快乐祝福歌

drawrose2_R %播放花朵
