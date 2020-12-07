cwd				:= $(shell pwd)

clean::
	rm -rf results/*

r-update::
	git reset --hard origin/master && git pull

get-out::
	scp -r stfo194b@taurus.hrsk.tu-dresden.de:/home/stfo194b/sahand/contrastive-unpaired-translation/results .

srun::
	srun \
	--partition=ml \
	--cpus-per-task=1 \
	--gres=gpu:1 \
	--mem-per-cpu=2048 \
	--time=02:00:00 \
	--account=p_ml_cv \
	--pty bash

hello::
	@echo "hello ${USER} !"
