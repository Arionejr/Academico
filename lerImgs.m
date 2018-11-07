function [z,resposta] = x
z = [];
resposta = [];
%for j = 1:3
    %lista parametro: endereco da pasta de imagens
    %file = strcat('/tmp/guest-b5sgp8/Downloads/orl_faces','/s'); %%LINUX
%     file = strcat('C:\Users\arion\Documents\PUC 2-2018\Visão por Computação\imagens','\s');%     
%     filename = strcat(file,int2str(j));
%     cd(filename)
%     for k = 1:10
%         x = imread(strcat(int2str(k),'.png'));
%         g = rgb2gray(x);
%         x = g;
%         y = reshape(x,[size(x,1)*size(x,2),1]);
%         z = [z , y];
%     end
    
    for ret = 1:3 %quantidade de pastas de imagens
        file = strcat('C:\Users\arion\Documents\PUC 2-2018\Visão por Computação\imagens','\s');
        filename = strcat(file,int2str(ret));
        cd(filename)
        for k = 1:70 %quantidade de aprendizagem
            x = imread(strcat(int2str(k),'.png'));
            g = rgb2gray(x);
            x = g;   %transformando imagem em escala de cinza
            x = edge(x, 'canny');
            y = reshape(x,[size(x,1)*size(x,2),1]);
            z = [z , y];
            resposta = [resposta,ret];
        end
                
    end
%end


end