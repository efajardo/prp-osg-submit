.PHONY: configmap

all:
	-kubectl delete secret osgflock-submit-token -n osg-services
	-kubectl create secret generic osgflock-submit-token --from-file=token=osg-flock-token -n osg-services
	-kubectl delete secret submit-token-key -n osg-services
	-kubectl create secret generic submit-token-key --from-file=token_key=token_key -n osg-services
	-kubectl delete configmap condor-flock-config -n osg-services
	-kubectl create configmap condor-flock-config --from-file=condor.config=prp-condor-flock.config --from-file=ProbeConfig -n osg-services
