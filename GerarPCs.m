%Gera a matriz de componentes principais
%Entrada:
%   data = matriz de dados. Cada amostra de medi��es � representada em uma
%coluna
%sa�da:
%   P = dados no novo espa�o vetorial (autofaces no caso de imagens)
%   PC = matriz componentes principais
%   mn = m�dia de cada coluna da matriz de dados
function [P PC mn] = GerarPCs(data)
    [M,N] = size(data);
    mn = mean(data,2); %calcular a m�dia
    data = double(data) - repmat(mn,1,N); %imagens - media

    covariancia = data' * data; %matriz de covari�ncia
    [PC,V] = eig(covariancia); %autovetores e autovalores

    V = diag(V); 

    clear covariancia, clear M, clear N;

    %ordenar autovetores e autovalores

    [junk,rindices] = sort(-1*V);
    V = V(rindices);
    V = diag(V);
    PC = PC(:,rindices);

    clear junk , clear rindices, clear V;

    %c�lculo das autofaces

    P = data * PC;
    i = size(PC,2);

    clear PC;

    %proje��o das imagens no espa�o de faces
    PC = [];
    for j = 1:i
        temp = P' * data(:,j);
        PC = [PC temp];
    end

    clear i, clear j, clear temp;
end