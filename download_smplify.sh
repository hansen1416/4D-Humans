#!/bin/bash
urle () { [[ "${1}" ]] || return 1; local LANG=C i x; for (( i = 0; i < ${#1}; i++ )); do x="${1:i:1}"; [[ "${x}" == [a-zA-Z0-9.~-] ]] && echo -n "${x}" || printf '%%%02X' "'${x}"; done; echo; }

read -p "Username (SMPLify):" username
read -p "Password (SMPLify):" password
username=$(urle $username)
password=$(urle $password)

wget --post-data "username=$username&password=$password" 'https://download.is.tue.mpg.de/download.php?domain=smplify&resume=1&sfile=mpips_smplify_public_v2.zip' -O './data/smpl/smplify.zip' --no-check-certificate --continue
unzip data/smpl/smplify.zip -d data/smpl/smplify
mv data/smpl/smplify/smplify_public/code/models/basicModel_neutral_lbs_10_207_0_v1.0.0.pkl data/basicModel_neutral_lbs_10_207_0_v1.0.0.pkl
rm -rf data/smpl/smplify
rm -rf data/smpl/smplify.zip