function features=updateclusterimages(features,mua);

features.clusterimages=zeros(features.imagesize,features.imagesize,12);


%npoints=numel(mua.ts_spike);
npoints=size(mua.waveforms,2);

for i=1:features.Nclusters
    
    inthiscluster=find(features.clusters==i);
    
    for j=1:numel(inthiscluster)
        
        lastx=0; % avoid drawing the same line twice

        for k=2:npoints
            
            
            xa=  (((k-1)/npoints)*features.imagesize);
            ya=  ( mua.waveforms(inthiscluster(j),k-1) );
            
            xb=  ((k/npoints)*features.imagesize);
            yb=  ( mua.waveforms(inthiscluster(j),k) );
            
            
            steps=3;
            for ii=1:steps
                
                m=(ii-1)./steps;
                x=floor((1-m)*xa + m*xb);
                y=floor(( (1-m)*ya + m*yb) *features.imagesize *features.waveformscale) +round(features.imagesize/2);
                
                
                if (x>0) && (y>0) && (x<=features.imagesize) && (y<=features.imagesize)&& (x~=lastx)
                    
                    features.clusterimages(y,x,i)=features.clusterimages(y,x,i)+1;
                    lastx=x;
                end;
                
            end;
            
            
        end;
    end;
end;
