# COMP 411 Lab Makefile
# See https://gist.github.com/pandringa/0430db89b1a215bc02e7ace910ed07d8 for usage information
# Author: Peter Andringa <peter.andringa@unc.edu>
# Spring 2019

num = $(shell find $? | grep -oP '\d')

ex%: ex%.c
	gcc $? -o ex$(num);

.PHONY: test
test-ex%: ex%.c
	mkdir -p results/
	find ./testIO/ex$(num)in* | grep -oP 'ex\din\d' | xargs -n1 -i bash -c './ex$(num) < testIO/{} > results/{}'
	find ./results/ex$(num)in* | grep -oP '\d$$' | xargs -n1 -i bash -c 'diff --suppress-common-lines -y results/ex$(num)in{} testIO/ex$(num)out{}'
