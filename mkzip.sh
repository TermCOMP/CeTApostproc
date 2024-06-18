#!/bin/sh

if [ "$#" -eq 2 ]; then
    prop=$1
    strat=$2
    sed "s/PROPERTY/$prop/" process.template > process
    sed -i "s/STRATEGY/$strat/" process
elif [ "$#" -eq 1 ]; then
    prop=$1
    sed "s/PROPERTY/$prop/" process.template > process
    sed -i "s/STRATEGY/$strat/" process
    strat="full"
else
    echo "illegal number of parameters"
    echo "mkzip.sh PROPERTY STRATEGY   or"
    echo "mkzip.sh PROPERTY            for full rewriting"
    exit 0;
fi

zip -r "cetapostproc_${prop}_${strat}.zip" process ceta trs-conversion cpf2* xsltproc

rm process
