clear

 A4 = 440;%��׼��A4����ͬ������������ͬ��scale��ȡֵ��Χ��ͬ

 pt = 44100;p0 = pt/2;%Ƶ��

 scale = A4/2^(9/12)*2.^((-12:11)/12);%������Ե��������ߵͣ�e.g.���ı�ʽ���е�-12��11Ϊ0��23

 map = [1 3 5 6 8 10 12 13 15 17 18 20 22 24 25];%����

 score = [5 5 6 5 8 7 5 5 6 5 9 8 5 5 12 10 8 7 6 6 11 11 10 8 9 8];

 rhythm = [0.5 0.5 1 1 1 2 0.5 0.5 1 1 1 2  0.5 0.5 1 1 1  0.5 0.5 2 0.5 0.5 1 1 1 2];%����

data = zeros(1,551250);

for i=1:length(score) %�������ո�ı���

    perdata = sin((1:rhythm(i)*p0)/pt*2*pi*scale(map(score(i))));

    [dm,dn(i)] = size(perdata);

    data(1,(sum(dn)-dn(i)+1):sum(dn)) = perdata;

end

bofang = audioplayer(data,pt+1000);

play(bofang)   %�������տ���ף����

drawrose2_R %���Ż���
