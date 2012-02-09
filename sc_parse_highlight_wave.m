function features= parse_highlight_wave(x,y,features);



visible= find(ismember(features.clusters, find(features.clustervisible)));


dX=features.data(features.featureselects(1),visible);
dY=features.data(features.featureselects(2),visible);



[d,selected]=min( sqrt( (dX-x).^2 + (dY-y).^2 ) );
if d<10
    
    %plot(dX(visible(selected)),dY(visible(selected)),'ro','MarkerSize',10);
    features.highlight = visible(selected);
    
    
end;


if features.plotgroup  %select an extra 10 waveforms from the environment of click
    
    
    [d,id]=sort( sqrt( (dX-x).^2 + (dY-y).^2 )+ ((rand*2)-1).*0 );

    features.highlight_multiple=visible(id(1:10));
    
    
end;