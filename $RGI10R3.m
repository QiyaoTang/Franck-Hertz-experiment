filename = strings(5,1);  % 创建5行1列的字符串数组
M=zeros(5,5,5);
for i = 1:5
    filename(i) = sprintf('2.%d_2.9_2.6_task2.txt', i+4);  % i=1时生成2.5_2.9_2.6_task2.txt
    M(i)=readmatrix(filename(i));
end
max=zeros(5,5);