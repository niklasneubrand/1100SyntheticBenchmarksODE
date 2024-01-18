function arPlotObsModelStructure()

arLoad;

h(1) = figure;
arObsParamMatrix('d');
h(2) = figure;
arObsParamMatrix('c');
h(3) = figure;
arStatesParamMatrix('d');
h(4) = figure;
arStatesParamMatrix('c');

savefig(h,'observableModelStructure.fig')

end