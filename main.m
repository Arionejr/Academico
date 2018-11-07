%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Paulo Renato Baliza Silva%%
%%        04/12/2016       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all, close all
acert  = 0;
erro   = 0;
estat  = 0;
estat2 = 0;

[data,resposta] = lerImgs;

cd('C:\Users\arion\Documents\PUC 2-2018\Visão por Computação\imagens');

[P PC mn] = GerarPCs(data);

i = 1;

while(i)
    im = input('Informe a imagem (entre aspas simples): '); %nome da pasta\imagem. Ex: s8\5.pgm
    if(im == 0)
        break;
    end
    %1º parâmetro: endereço da pasta de imagens
    x = imread(strcat('C:\Users\arion\Documents\PUC 2-2018\Visão por Computação\imagens',strcat('\',im)));
    g = rgb2gray(x);
    x = g;   %transformando imagem em escala de cinza
    d = Classificar(PC, ProjetarAmostra(x,mn,P));
    
    figure;
    imshowpair(reshape(data(:,d),28,28),x,'montage')
    
    clear im, clear x, clear d
end

for ret = 1:3  % pastas
    file = strcat('C:\Users\arion\Documents\PUC 2-2018\Visão por Computação\imagens','\s');
    filename = strcat(file,int2str(ret));
    cd(filename)
    for k = 71:100 %quantidade de testes realizados
        im = sprintf('s%d/%d.png',ret,k);
        x = imread(strcat('C:\Users\arion\Documents\PUC 2-2018\Visão por Computação\imagens',strcat('\',im)));
        g = rgb2gray(x);
        x = g;
        d = Classificar(PC, ProjetarAmostra(x,mn,P));
        if (resposta(d) == ret)
            acert = acert + 1;
        else
            erro  = erro  + 1;
        end
    end
end

%        -- FIM --

% -- APRESENTACAO DE RESPOSTA --
% OBS: criar variavel com quantidade de testes.
estat  = round(((acert/90)*100),2) % ESTATISTICA EM PERCENTUAL DE ACERTO
estat2 = round(((erro/90)*100),2) % ESTATISTICA EM PERCENTUAL DE ERRO

valor = [acert,erro,estat];
graph = [estat,estat2];
plottype = 'pie3';

% GRAFICO DE PIZZA
disp(valor);
pie3(graph);
title('Pie Chart');

% GRAFICO DE BARRAS
%bar(graph);
%title('Bar Graph');

clear im, clear x, clear d

% AMOSTRAGEM 
%  date 07/11/2018
%  10 DE CADA PASTA = 40%
%  30 DE CADA PASTA = 47%
%  50 DE CADA PASTA = 52%
%  70 DE CADA PASTA = 54%

%       -- canny --
%  date 07/11/2018
%  70 DE CADA PASTA = 58%

%         -- FIM --