#!/bin/bash

seeds=(1 10 25 18)

refdir=ref/
outputdir=output/

create_reference() {
    for seed in ${seeds[@]}; do
      python3 trivia.py $seed > "$refdir/ref_$seed.txt"
    done
}

test_output() {
    for seed in ${seeds[@]}; do
        python3 trivia.py $seed > "$outputdir/output_$seed.txt"
        diff "$refdir/ref_$seed.txt" "$outputdir/output_$seed.txt"
    done
}

case "$1" in
 create)
  create_reference
  ;;
 test)
  test_output
  ;;
 *)
  echo "Usage: (create|test)"
  ;;
esac