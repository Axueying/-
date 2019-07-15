% �������������ֱ�ͳ��������Ա(CG)��İ����(UF)��Զ���������ʱ��
clc;clear;
path = 'I:\��Ϊѧ��Ƶ\��_�����Ŵ���\2019_06_10\';
name = '20190430636';
filename = 'ͳ�ƶԱ�.xlsx'
filename2 = [path filename];
zhenlv = 24.0;
time_interval_crop = 6.5;              %����ʱ�����4s
time_interval_away = 2;                %�����ⲿ����ĳ���ʱ��
zhenshu_interval_crop  = zhenlv*time_interval_crop;                %������֡��
zhenshu_interval_away = zhenlv*time_interval_away;

filename = [name, '_region','.csv'];
filename1 = [name,'_walking.csv'];
A = xlsread([path filename]);
a_speed = xlsread([path filename1]);
video_time = length(A)/zhenlv;
uf1_index = find(A(:,1) ==1);
uf1_time = length(uf1_index)/zhenlv;             %��İ������������ʱ��           
cg_index =  find(A(:,1)==3);
cg_time = length(cg_index)/zhenlv;               %������Ա���������ʱ��
away_index = find(A(:,1)==0);
away_time1 = length(away_index)/zhenlv;                  %Զ��������������ʱ��
away_time = length(A)/zhenlv - uf1_time-cg_time;         %ʹ�����



T = find((away_index)>=length(a_speed));
away_index(T) =length(a_speed);
uf1_speed = (a_speed(uf1_index));   
uf1_rest_index = uf1_index(find(uf1_speed(:,1)==1));
uf1_diff = diff(uf1_rest_index);
uf1_diff_seris_count = series_count_accelerate(uf1_diff);
ufl_time_num = find(uf1_diff_seris_count(:,2)>zhenshu_interval_crop);
uf1_rest = sum(uf1_diff_seris_count(ufl_time_num,2))/zhenlv               %İ��������С����Ϣ��ʱ��

uf1_social = uf1_time - uf1_rest;                              %İ������С���罻��ʱ��
cg_speed = (a_speed(cg_index));

cg_rest_index = cg_index(find(cg_speed(:,1)==1));
cg_diff = diff(cg_rest_index);
cg_diff_seris_count = series_count_accelerate(cg_diff);
cg_time_num = find(cg_diff_seris_count(:,2)>zhenshu_interval_crop);
cg_rest = sum(cg_diff_seris_count(cg_time_num,2))/zhenlv            %����Ա����С����Ϣʱ��

% cg_rest  =  length(find(cg_speed(:,1)==1))/zhenlv;  
cg_social = cg_time - cg_rest;                                      %������Ա�罻ʱ��
away_speed = (a_speed(away_index));

away_rest_index = away_index(find(away_speed(:,1)==1));
away_diff = diff(away_rest_index);
away_diff_seris_count = series_count_accelerate(away_diff);
away_time_num = find(away_diff_seris_count(:,2)>zhenshu_interval_away);
away_rest = sum(away_diff_seris_count(away_time_num,2))/zhenlv

away_rest =  length(find(away_speed(:,1)==1))/zhenlv;
away_social =  away_time - away_rest;
time.toal = video_time;
time.uf1_time = uf1_time;
time.cg_time = cg_time;
time.away_time = away_time;
time.rest.uf1_rest = uf1_rest;
time.rest.cg_rest = cg_rest;
time.rest.away_rest = away_rest;
time.social.uf1_social =uf1_social;
time.social.cg_social = cg_social;
time.social.away_social = away_social;
t1 = {name,cg_time,cg_social,uf1_time,uf1_social,cg_time+uf1_time,cg_rest,uf1_rest,cg_rest+uf1_rest,away_time,away_rest,away_social,video_time};
xlswrite(filename2,t1,1,'F9:R9');



