function features=compute_extra_PCA_coeffs(features,mua)

features.numextrafeaatures=features.numextrafeaatures+1;

D=zeros(4,size(features.data,2));

visible = find(ismember(features.clusters, find(features.clustervisible)));

%coeffs=wave_features_wc_mod_8(mua.waveforms(visible,:)')./10;

[coeffs,score]= princomp(mua.waveforms(visible,:)','econ');

D(:,visible)=coeffs(:,1:4)';
for i=1:4
    features.name{size(features.data,1)+i}=['pca ',num2str(features.numextrafeaatures),'-',num2str(i)];
end;

features.data(end+1:end+4,:)=D;

features=sc_scale_features(features);