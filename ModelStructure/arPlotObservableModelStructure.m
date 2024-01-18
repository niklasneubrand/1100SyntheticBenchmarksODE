function arPlotObservableModelStructure()

close all

arLoad;

h(1) = figure;
arDataObsMatrix('d');
h(2) = figure;
arDataObsMatrix('c');
h(3) = figure;
arStatesParamMatrix('d');
h(4) = figure;
arStatesParamMatrix('c');

savefig(h,'observableModelStructure.fig')

end