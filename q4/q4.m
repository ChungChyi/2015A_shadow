filepath = "/home/wuwei/Õº∆¨/";
flist = dir(sprintf("%s/*.png",filepath));

images = cell(0,0);
for idx = 1:length(flist)
    fname = sprintf('%s/%s',filepath,flist(idx).name);
    im = imread(fname);
    images{length(images)+1} = im;
end

X = zeros(14,1); Y = cell(0,0);
for i = 1:length(flist)
    A = cell2mat(images(i));
    gray = rgb2gray(A);
    part = gray(850:900,850:end);
    part = im2double(part);
    P = 1*(part.^2.0);
    k = 0.65; %»∑∂®„–÷µ
    bw = im2bw(P,k);
    val = sum(bw);
    for j = 1:length(bw)
        if (val(length(bw)-j)<51)
            x = length(bw)-j;
            X(i) = x;
            break;
        end
    end
    y = find(bw(:,x)==0);
    Y{i} = y;
end
dist = @(X,Y) sqrt((X-25).^2+(Y-20).^2);
S = dist(X,Y);